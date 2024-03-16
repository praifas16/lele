<?php
// Start the session
session_start();
// ติดต่อฐานข้อมูล
$host = 'localhost';
$dbname = 'Scinema';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $user_name = $_SESSION['user_name'];
}

// Check if data is sent from booking.php
if (
    isset(
        $_POST['selected_seats'],
        $_POST['totalPrice'],
        $_POST['movie_name'],
        $_POST['movie_id'],
        $_POST['date'],
        $_POST['time'],
        $_POST['room_name'],
        $_POST['room_id'],
        $_POST['selected_seats_count']
    )
) {
    $selected_seats = $_POST['selected_seats'];
    $total_price = $_POST['totalPrice'];

    // เพิ่มเงื่อนไขการตรวจสอบค่า $total_price ว่าเป็นตัวเลขที่มากกว่า 0 หรือไม่
    if (!is_numeric($total_price) || $total_price <= 0) {
        echo "ราคาที่ถูกส่งมาไม่ถูกต้อง";
        exit();
    }

    $movie_name = $_POST['movie_name'];
    $movie_id = $_POST['movie_id'];
    $date = $_POST['date'];
    $time = $_POST['time'];
    $room_name = $_POST['room_name'];
    $room_id = $_POST['room_id'];
    $selected_seats_count = $_POST['selected_seats_count'];
} else {
    echo "ไม่พบข้อมูลการจองที่ถูกส่งมา";
    exit();
}
?>
<script>
    // เรียกใช้งาน updateTotalPrice() เมื่อหน้าเว็บโหลดเสร็จสมบูรณ์
    window.onload = function() {
        updateTotalPrice();
    };

    function updateTotalPrice() {
        const pricePerSeat = <?php echo $total_price; ?>;
        const selectedSeats = '<?php echo $selected_seats; ?>'.split(','); // รายการที่นั่งที่เลือก
        const numSeats = selectedSeats.length; // จำนวนที่นั่งที่เลือก
        const totalPrice = pricePerSeat * numSeats; // คำนวณราคารวมตามจำนวนที่นั่งที่เลือก
        document.getElementById('totalPriceSpan').textContent = totalPrice > 0 ? totalPrice + ' บาท' : '-';
        document.getElementById('totalPriceInput').value = totalPrice;
    }
</script>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>รายละเอียดการจอง</title>
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

        section {
            padding: 20px;
            text-align: center;
            width: 100%;
            max-width: 800px;
            /* Limiting the width of the content */
        }

        h1 {
            margin-top: 20px;
            /* Adding top margin to h1 */
        }

        h2 {
            text-align: center;
            /* Centering the h2 */
        }

        img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>
    <h1>รายละเอียดการจอง</h1>
    <section>
        <p><strong>ชื่อหนัง:</strong> <?php echo htmlspecialchars($movie_name, ENT_QUOTES, 'UTF-8'); ?></p>
        <p><strong>วันที่เลือก:</strong> <?php echo htmlspecialchars($date, ENT_QUOTES, 'UTF-8'); ?></p>
        <p>ห้องที่ฉาย: <?php echo htmlspecialchars($room_name, ENT_QUOTES, 'UTF-8'); ?></p>
        <p><strong>เวลาฉาย:</strong> <?php echo htmlspecialchars($time, ENT_QUOTES, 'UTF-8'); ?></p>
        <p><strong>ที่นั่งที่เลือก:</strong> <?php echo htmlspecialchars($selected_seats, ENT_QUOTES, 'UTF-8'); ?></p>
        <p>ราคาที่ต้องจ่าย: <?php echo htmlspecialchars($total_price, ENT_QUOTES, 'UTF-8'); ?> Bath</p>
        <p><strong>จำนวนที่นั่งที่เลือก:</strong> <?php echo count(explode(',', $selected_seats)); ?> ที่นั่ง</p>
        <img src="your_qr_code_image_url" alt="QR Code for Payment">
    </section>

    <h2>ยืนยันการจ่าย</h2>
    <form id="bookingForm" method="post" action="process_booking.php">
        <input type="hidden" name="selected_seats" value="<?php echo htmlspecialchars($selected_seats, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="totalPrice" value="<?php echo htmlspecialchars($total_price, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="movie_name" value="<?php echo htmlspecialchars($movie_name, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="movie_id" value="<?php echo htmlspecialchars($movie_id, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="date" value="<?php echo htmlspecialchars($date, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="time" value="<?php echo htmlspecialchars($time, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="room_name" value="<?php echo htmlspecialchars($room_name, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="room_id" value="<?php echo htmlspecialchars($room_id, ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="selected_seats_count" value="<?php echo count(explode(',', $selected_seats)); ?>">
        <button type="submit">ยืนยันการจอง</button>
    </form>
</body>

</html>