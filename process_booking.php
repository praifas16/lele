<?php
// Start the session
session_start();

// Connect to the database
$host = 'localhost';
$dbname = 'Scinema';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Retrieve user information from session
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $user_name = $_SESSION['user_name'];
}

// Get booking details from POST data
if (isset($_POST['movie_name'], $_POST['date'], $_POST['time'], $_POST['selected_seats'], $_POST['totalPrice'], $_POST['room_name'], $_POST['room_id'], $_POST['selected_seats_count'])) {
    $movie_name = $_POST['movie_name'];
    $movie_id = $_POST['movie_id'];
    $date = date('Y-m-d', strtotime($_POST['date'])); // Convert date to yyyy-mm-dd format
    $time = $_POST['time'];
    $selected_seats = $_POST['selected_seats'];
    $total_price = $_POST['totalPrice'];
    $room_name = $_POST['room_name'];
    $room_id = $_POST['room_id'];
    $booking_date = date('Y-m-d');
    $selectedSeatsCount = $_POST['selected_seats_count'];
    $points_earned = $total_price / 50;

    // Check if selected seats are already booked
    $sql_check_booked_seats = "SELECT SelectedSeats FROM Bookings WHERE MovieID = '$movie_id' AND ShowtimeDate = '$date' AND ShowtimeTime = '$time' AND RoomID = '$room_id'";
    $result_check_booked_seats = $conn->query($sql_check_booked_seats);

    if ($result_check_booked_seats->num_rows > 0) {
        $row = $result_check_booked_seats->fetch_assoc();
        $bookedSeats = explode(',', $row['SelectedSeats']);

        // Check for overlapping seats
        $selectedSeatsArray = explode(',', $selected_seats);
        $overlap = array_intersect($bookedSeats, $selectedSeatsArray);

        if (!empty($overlap)) {
            echo "บางที่นั่งที่คุณเลือกได้ถูกจองแล้ว กรุณาเลือกที่นั่งอื่น";
            exit();
        }
    }

    // Retrieve user's total points from all bookings
    $sql_user_points = "SELECT SUM(Point) AS total_points FROM Bookings WHERE UsersID = '$user_id'";
    $result_user_points = $conn->query($sql_user_points);
    $row_user_points = $result_user_points->fetch_assoc();
    $total_user_points = $row_user_points['total_points'];

    // Calculate total points earned from current booking
    $total_points_earned_current_booking = $points_earned;

    // Calculate total points earned from all bookings
    $total_points_earned_all_bookings = $total_user_points + $points_earned;

    // Insert booking details into the database
    $sql_insert_booking = "INSERT INTO Bookings (UsersID, MovieID, NameMovie, ShowtimeDate, ShowtimeTime, SelectedSeats, TotalPrice, RoomID, BookingDate, Quantity, Point) 
    VALUES ('$user_id', '$movie_id','$movie_name', '$date', '$time', '$selected_seats', '$total_price', '$room_id', '$booking_date', '$selectedSeatsCount','$points_earned')";

    if ($conn->query($sql_insert_booking) === TRUE) {
        // Fetch movie details
        $sql_movie_details = "SELECT * FROM Movie WHERE MovieID = $movie_id";
        $result_movie_details = $conn->query($sql_movie_details);
        $row_movie_details = $result_movie_details->fetch_assoc();

        // Close the database connection
        $conn->close();

        // Display booking details
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Confirmation Page</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #ffe6e6;
                    color: #333;
                }

                .container {
                    max-width: 600px; /* Increase container width */
                    margin: 30px auto;
                    padding: 20px;
                    background-color: #f0bbbb;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                h2 {
                    color: #571111;
                    text-align: center;
                }

                p {
                    margin: 10px 0;
                }

                strong {
                    font-weight: bold;
                }

                .download-btn {
                    text-decoration: none;
                    padding: 10px 20px;
                    background-color: #4CAF50;
                    color: white;
                    border-radius: 5px;
                    cursor: pointer;
                    display: inline-block;
                    margin-top: 10px; /* Adjust margin */
                }
            </style>
        </head>
        <body>
        <div class="container">
            <h2>Ticket</h2>
            <p><strong>ชื่อหนัง:</strong> <?= $row_movie_details['NameMovie'] ?></p>
            <p><strong>วันที่และเวลาแสดง:</strong> <?= $date ?> <?= $time ?></p>
            <p><strong>ที่นั่งที่เลือก:</strong> <?= $selected_seats ?></p>
            <p><strong>จำนวนที่นั่ง:</strong> <?= $selectedSeatsCount ?></p>
            <p><strong>ห้อง:</strong> <?= $room_name ?></p>
            <p><strong>ราคาที่ต้องชำระ:</strong> <?= $total_price ?> บาท</p>
            <p><strong>คะแนนที่ได้ในรอบนี้:</strong> <?= intval($total_points_earned_current_booking) ?></p>
            <p><strong>คะแนนทั้งหมดที่มี:</strong> <?= intval($total_points_earned_all_bookings) ?></p>
        </div>

        <!-- Button to go back to homepage -->
        <div style="text-align: center; margin-top: 20px;">
            <a href="homepage.php" class="download-btn">กลับไปที่หน้าหลัก</a>
        </div>

        <!-- Button to save ticket image -->
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="saveTicketImage()" class="download-btn">บันทึกภาพตั๋ว</button>
        </div>

        <script>
function saveTicketImage() {
    // Create a new canvas element
    var canvas = document.createElement('canvas');
    canvas.width = 650; // กำหนดความกว้างของ Canvas ตามข้อมูลที่แสดงบนหน้าเว็บ
    canvas.height = 400; // กำหนดความสูงของ Canvas ตามข้อมูลที่แสดงบนหน้าเว็บ

    // Get the canvas context
    var ctx = canvas.getContext('2d');

    // Draw ticket details on the canvas
    ctx.fillStyle = '#f0bbbb';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = '#571111';
    ctx.font = 'bold 20px Arial'; // ปรับขนาด font ตามต้องการ
    ctx.fillText('Ticket', 20, 40);
    ctx.fillText('ชื่อหนัง: <?= $row_movie_details['NameMovie'] ?>', 20, 80);
    ctx.fillText('วันที่: <?= $date ?> ', 20, 120);
    tx.fillText('เวลา: <?= $time ?>', 20, 120);
    ctx.fillText('ที่นั่งที่เลือก: <?= $selected_seats ?>', 20, 160);
    ctx.fillText('จำนวนที่นั่ง: <?= $selectedSeatsCount ?>', 20, 200);
    ctx.fillText('ห้อง: <?= $room_name ?>', 20, 240);
    ctx.fillText('ราคาที่ต้องชำระ: <?= $total_price ?> บาท', 20, 280);

    // Convert the canvas to base64 image data
    var imageData = canvas.toDataURL('image/jpeg');

    // Create a link element
    var downloadLink = document.createElement('a');
    downloadLink.href = imageData;
    downloadLink.download = 'ticket.jpg';

    // Append the link to the document body and simulate click
    document.body.appendChild(downloadLink);
    downloadLink.click();

    // Clean up
    document.body.removeChild(downloadLink);

            }
        </script>
        </body>
        </html>
        <?php
    } else {
        echo "เกิดข้อผิดพลาดในการบันทึกข้อมูล: " . $conn->error;
    }
} else {
    echo "ไม่พบข้อมูลการจองที่ถูกส่งมา";
}

// Close the database connection
$conn->close();
?>
