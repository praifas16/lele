<?php
session_start();
// ติดต่อฐานข้อมูล
$host = 'localhost';
$dbname = 'Scinema';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

// Check if movie_id is set in the GET request
if (isset($_GET['movie_id'])) {
    $movie_id = $_GET['movie_id'];

    // Retrieve movie details from the database
    $sql_movie_details = "SELECT * FROM Movie WHERE MovieID = $movie_id";
    $result_movie_details = $conn->query($sql_movie_details);

    // Check if the query is successful
    if ($result_movie_details && $result_movie_details->num_rows > 0) {
        // Fetch movie details
        $row_movie_details = $result_movie_details->fetch_assoc();

        // Retrieve booked seats and Showtime information from the database
        $sql_booked_seats = "SELECT SelectedSeats, Showtimetime, ShowtimeDate FROM Bookings WHERE MovieID = $movie_id";
        $result_booked_seats = $conn->query($sql_booked_seats);
        // Check if there are booked seats
        if ($result_booked_seats && $result_booked_seats->num_rows > 0) {
            // Fetch booked seats, Showtime, and ShowtimeDate
            $booked_seats = array();
            $showtimes = array();
            $showtimeDates = array();
            $web_time = isset($_GET['time']) ? $_GET['time'] : '';
            $web_date = isset($_GET['date']) ? $_GET['date'] : '';

            while ($row_booked_seats = $result_booked_seats->fetch_assoc()) {
                // Get Showtime, ShowtimeDate, and convert the format to "Y-m-d"
                $showtime = $row_booked_seats['Showtimetime'];
                $showtimeDate = date('d-m-Y', strtotime($row_booked_seats['ShowtimeDate']));

                // Check if Showtime and ShowtimeDate match the time and date from the URL
                if ($web_time == $showtime && $web_date == $showtimeDate) {
                    // Merge booked seats into the array
                    $booked_seats = array_merge($booked_seats, explode(',', $row_booked_seats['SelectedSeats']));
                    $showtimes[] = $showtime;
                    $showtimeDates[] = $showtimeDate;
                }
            }

            // Remove duplicate seat numbers
            $booked_seats = array_unique($booked_seats);

            // Display booked seats and showtimes if there are matching records
            if (!empty($booked_seats)) {
            }
        }
    } else {
        echo "ไม่พบรายละเอียดภาพยนตร์";
    }
} else {
    echo "ไม่พบรหัสภาพยนตร์";
}


$sql_room_details = "SELECT RoomID, RoomName, TypeScreen FROM Room WHERE RoomID = (SELECT RoomID FROM Movie WHERE MovieID = $movie_id)";
$result_room_details = $conn->query($sql_room_details);
if ($result_room_details->num_rows > 0) {
    $row_room_details = $result_room_details->fetch_assoc();
    $room_name = $row_room_details['RoomName'];
    $type_screen = $row_room_details['TypeScreen']; // เพิ่มการดึงข้อมูล TypeScreen
    $room_id = $row_room_details['RoomID'];
} else {
    $room_name = "ไม่พบข้อมูลห้อง";
    $type_screen = "ไม่พบข้อมูลประเภทจอ"; // กำหนดค่าว่างสำหรับ TypeScreen หากไม่พบข้อมูลห้อง
    $room_id = ""; // กำหนดค่าว่างสำหรับ RoomID หากไม่พบข้อมูลห้อง
}

$current_date = date('Y-m-d');
$sql_promotion = "SELECT DiscountAmount, PromotionName FROM Promotion WHERE StartDate <= '$current_date' AND EndDate >= '$current_date'";
$result_promotion = $conn->query($sql_promotion);

$discount_amount = 0;
$promotion_name = ""; // เพิ่มบรรทัดนี้

if ($result_promotion->num_rows > 0) {
    $row_promotion = $result_promotion->fetch_assoc();
    $discount_amount = $row_promotion['DiscountAmount'];
    $promotion_name = $row_promotion['PromotionName']; // เพิ่มบรรทัดนี้
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>S-Cinema - Naresuann</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* CSS Styles */
        body {
            background-color: #000;
            color: #FFF;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        nav {
            background-color: #212121;
            padding: 10px;
            text-align: center;
            width: 100%;
        }

        nav a {
            color: #FFF;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }

        section {
            padding: 20px;
            text-align: center;
            width: 100%;
            max-width: 800px;
            /* Limiting the width of the content */
        }

        footer {
            background-color: #212121;
            padding: 10px;
            text-align: center;
            width: 100%;
        }

        .movie-details {
            display: flex;
            justify-content: space-between;
            /* Aligning the items with space between */
            align-items: center;
            /* Vertically centering the items */
        }

        .movie-poster {
            width: 300px;
            margin-right: 20px;
        }

        .movie-details-text {
            flex: 1;
            text-align: left;
        }

        .seat-btn {
            width: 40px;
            height: 40px;
            margin: 5px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .seat-btn.selected {
            background-color: #2ecc71;
            /* Changing the color when selected */
        }

        .seat-btn:hover {
            background-color: #2980b9;
        }

        /* เพิ่มสีสำหรับที่นั่งที่ถูกจองแล้ว */
        .seat-btn.booked {
            background-color: #e74c3c;
            pointer-events: none;
            /* ทำให้ไม่สามารถคลิกได้ */
            cursor: not-allowed;
            /* เปลี่ยน cursor เป็น not-allowed */
        }

        /* เพิ่มสีสำหรับที่นั่งที่ถูกเลือก */
        .seat-btn.selected {
            background-color: #2ecc71;
        }

        h1 {
            margin-top: 20px;
            /* Adding top margin to h1 */
        }

        h2 {
            text-align: center;
            /* Centering the h2 */
        }
    </style>
</head>

<body>

    <nav>
        <a href="headder.php">Homepage</a>
        <a href="homepage.php">Movie</a>
        <a href="#">Promotion</a>
    </nav>

    <h1>Booking movie tickets</h1>
    <section>
        <!-- รายละเอียดการจอง -->
        <div class="booking-details">
        </div>

        <!-- รายละเอียดของภาพยนตร์ -->
        <div class="movie-details">
            <div class="movie-poster">
                <img src="<?php echo $row_movie_details['Poster']; ?>" alt="<?php echo $row_movie_details['NameMovie']; ?>" style="width: 100%;">
            </div>
            <div class="movie-details-text">
                <h3><?php echo $row_movie_details['NameMovie']; ?></h3>
                <p>Selected date : <?php echo isset($_GET['date']) ? $_GET['date'] : ''; ?></p>
                <p>Movie price : <?php echo $row_movie_details['price'] ?> Bath</p>
                <p>Showtime : <?php echo isset($_GET['time']) ? $_GET['time'] : ''; ?></p>
                <p>Runtime : <?php echo $row_movie_details['Duration']; ?></p>
                <p>Room : <?php echo $room_name; ?></p>
                <p>Screen type : <?php echo $type_screen; ?></p> <!-- แสดงประเภทจอ -->
                <?php if (!empty($promotion_name)) : ?>
                    <p>Promotion : <?php echo $promotion_name; ?></p>
                <?php endif; ?>
                <p>Price to pay : <span id="totalPrice"><?php echo isset($discount_amount) && $discount_amount > 0 ? $row_movie_details['price'] - $discount_amount : '-'; ?></span></p>
                <p>Selected seat : <span id="selectedSeats">-</span></p>
                <p>Number of seats selected : <span id="selectedSeatsCountDisplay">0 </span> Seat</p>
            </div>
        </div>

        <form id="bookingForm" method="post" action="submit.php">
            <label>เลือกที่นั่ง</label>
            <!-- Displaying seat buttons -->
            <div id="seatContainer">
                <?php
                $seats = array('A', 'B', 'C', 'D', 'E');
                foreach ($seats as $row) {
                    echo "<div>";
                    for ($i = 1; $i <= 8; $i++) {
                        $seatNumber = $row . str_pad($i, 2, '0', STR_PAD_LEFT);

                        // Check if the seat is booked
                        $isBooked = in_array($seatNumber, $booked_seats);

                        // Add class 'booked' if the seat is booked
                        $seatClass = $isBooked ? 'booked' : '';

                        echo "<button class='seat-btn $seatClass' type='button' data-seat='$seatNumber'>$seatNumber</button>";
                    }
                    echo "</div>";
                }
                ?>
            </div>

            <!-- Hidden inputs to store selected seats and room name -->
            <input type="hidden" id="selectedSeatsInput" name="selected_seats" value="">
            <input type="hidden" name="room_name" value="<?php echo $room_name; ?>">
            <input type="hidden" name="room_id" value="<?php echo $room_id; ?>">
            <input type="hidden" name="movie_id" value="<?php echo $movie_id; ?>">
            <input type="hidden" name="totalPrice" id="totalPriceInput"> <!-- Add hidden input field for totalPrice -->
            <input type="hidden" name="selected_seats_count" id="selectedSeatsCount" name="selected_seats_count" value="0">

            <!-- Book Ticket Button -->
            <button id="button" type="button">ยืนยันการจอง</button>
        </form>
    </section>

    <script>
        document.getElementById('button').addEventListener('click', function() {
            const selectedSeats = document.querySelectorAll('.seat-btn.selected');

            // ตรวจสอบว่ามีที่นั่งที่ถูกเลือกอย่างน้อย 1 ที่นั่ง
            if (selectedSeats.length === 0) {
                alert('กรุณาเลือกที่นั่งก่อนทำการยืนยันการจอง');
                return; // ไม่ดำเนินการต่อกับการส่งฟอร์ม
            }

            const selectedSeatNumbers = Array.from(selectedSeats).map(seat => seat.dataset.seat);
            const selectedSeatsInput = document.getElementById('selectedSeatsInput');
            selectedSeatsInput.value = selectedSeatNumbers.join(',');

            // เพิ่มข้อมูลใน URL parameters และทำการ submit ฟอร์ม
            const bookingForm = document.getElementById('bookingForm');
            const movieNameInput = document.createElement('input');
            movieNameInput.type = 'hidden';
            movieNameInput.name = 'movie_name';
            movieNameInput.value = "<?php echo $row_movie_details['NameMovie']; ?>";
            bookingForm.appendChild(movieNameInput);

            const dateInput = document.createElement('input');
            dateInput.type = 'hidden';
            dateInput.name = 'date';
            dateInput.value = "<?php echo isset($_GET['date']) ? $_GET['date'] : ''; ?>";
            bookingForm.appendChild(dateInput);

            const timeInput = document.createElement('input');
            timeInput.type = 'hidden';
            timeInput.name = 'time';
            timeInput.value = "<?php echo isset($_GET['time']) ? $_GET['time'] : ''; ?>";
            bookingForm.appendChild(timeInput);

            const totalPriceInput = document.createElement('input');
            totalPriceInput.type = 'hidden'; // Set input type to 'hidden'
            totalPriceInput.name = 'totalPrice'; // Set input name to 'totalPrice'
            const totalPrice = selectedSeats.length * <?php echo $row_movie_details['price'] - $discount_amount; ?>;
            totalPriceInput.value = totalPrice > 0 ? totalPrice : 0; // Set input value to totalPrice
            bookingForm.appendChild(totalPriceInput);

            bookingForm.submit();
        });

        const seatButtons = document.querySelectorAll('.seat-btn');
        seatButtons.forEach(button => {
            button.addEventListener('click', function() {
                if (!button.classList.contains('booked')) {
                    if (!button.classList.contains('selected')) {
                        button.classList.add('selected');
                    } else {
                        button.classList.remove('selected');
                    }

                    updateSelectedSeats();
                    updateSelectedSeatsCount();
                    updateTotalPrice();
                }
            });
        });

        function updateSelectedSeats() {
            const selectedSeats = document.querySelectorAll('.seat-btn.selected');
            const selectedSeatNumbers = Array.from(selectedSeats).map(seat => seat.dataset.seat);
            const totalPriceSpan = document.getElementById('totalPrice');
            const selectedSeatsSpan = document.getElementById('selectedSeats');
            const totalPrice = selectedSeats.length * <?php echo $row_movie_details['price'] - $discount_amount; ?>;

            document.getElementById('selectedSeatsInput').value = selectedSeatNumbers.join(',');
            totalPriceSpan.textContent = totalPrice > 0 ? totalPrice + ' Bath' : '-';
            selectedSeatsSpan.textContent = selectedSeatNumbers.join(', ');
        }

        function updateSelectedSeatsCount() {
            const selectedSeats = document.querySelectorAll('.seat-btn.selected');
            const selectedSeatsCountInput = document.getElementById('selectedSeatsCount');
            selectedSeatsCountInput.value = selectedSeats.length;

            // อัพเดทจำนวนที่นั่งที่ถูกเลือกที่แสดงบนเว็บ
            const selectedSeatsCountDisplay = document.getElementById('selectedSeatsCountDisplay');
            selectedSeatsCountDisplay.textContent = selectedSeats.length;
        }

        function updateTotalPrice() {
            const selectedSeats = document.querySelectorAll('.seat-btn.selected');
            const pricePerSeat = <?php echo $row_movie_details['price'] - $discount_amount; ?>;
            const numSeats = selectedSeats.length;

            if (numSeats === 0) {
                document.getElementById('totalPrice').textContent = '-';
                document.getElementById('totalPriceInput').value = 0;
            } else {
                const totalPrice = pricePerSeat * numSeats;
                document.getElementById('totalPrice').textContent = totalPrice > 0 ? totalPrice + ' Bath' : '-';
                document.getElementById('totalPriceInput').value = totalPrice;
            }
        }

        document.getElementById('selectedSeatsInput').addEventListener('change', updateTotalPrice);

        // เรียกใช้ฟังก์ชันเพื่อเริ่มต้น
        updateSelectedSeats();
        updateSelectedSeatsCount();
        updateTotalPrice();
    </script>


</body>

</html>