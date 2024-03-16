<?php
// Start the session
session_start();

// ตรวจสอบว่ามีผู้ใช้ล็อกอินหรือไม่
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// ตรวจสอบว่ามีการส่งข้อมูลการจองมาหรือไม่
if (!isset($_POST['movie_name'], $_POST['date'], $_POST['time'], $_POST['selected_seats'], $_POST['totalPrice'], $_POST['room_name'], $_POST['room_id'], $_POST['selected_seats_count'])) {
    echo "ไม่พบข้อมูลการจองที่ถูกส่งมา";
    exit();
}

// ติดต่อฐานข้อมูล
$host = 'localhost';
$dbname = 'Scinema';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

// ตรวจสอบการเชื่อมต่อกับฐานข้อมูล
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// ดึงข้อมูลการจองจาก POST data
$movie_name = $_POST['movie_name'];
$date_parts = explode('-', $_POST['date']); // แยกวันที่ออกเป็นส่วนๆ (dd-mm-yyyy)
$date = $date_parts[2] . '-' . $date_parts[1] . '-' . $date_parts[0]; // ปรับรูปแบบวันที่เป็น yyyy-mm-dd
$time = $_POST['time'];
$selected_seats = $_POST['selected_seats'];
$total_price = $_POST['totalPrice'];
$room_name = $_POST['room_name'];
$room_id = $_POST['room_id'];
$user_id = $_SESSION['user_id'];
$selectedSeatsCount = $_POST['selected_seats_count'];
$points_earned = $total_price / 50;

// แทรกข้อมูลการจองลงในฐานข้อมูล
$sql_insert_booking = "INSERT INTO Bookings (UsersID, MovieName, ShowtimeDate, ShowtimeTime, SelectedSeats, TotalPrice, RoomName, RoomID, Quantity,Point) 
VALUES ('$user_id', '$movie_name', '$date', '$time', '$selected_seats', '$total_price', '$room_name', '$room_id', '$selectedSeatsCount','$points_earned')";

if ($conn->query($sql_insert_booking) === TRUE) {
    // ดึงข้อมูลการจองทั้งหมดจากฐานข้อมูล
    $sql_select_bookings = "SELECT * FROM Bookings WHERE UsersID = '$user_id' ORDER BY BookingDate DESC";
    $result_select_bookings = $conn->query($sql_select_bookings);

    // แสดงผลข้อมูลการจอง
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>รายการจอง</title>
    </head>
    <body>
        <h1>รายการจองของคุณ</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ชื่อภาพยนตร์</th>
                    <th>วันที่และเวลา</th>
                    <th>ที่นั่งที่เลือก</th>
                    <th>ราคาทั้งหมด (บาท)</th>
                    <th>ห้อง</th>
                    <th>จำนวนที่นั่ง</th>
                    <th>แต้มที่ได้</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result_select_bookings->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $row['MovieName']; ?></td>
                        <td><?php echo $row['ShowtimeDate'] . ' ' . $row['ShowtimeTime']; ?></td>
                        <td><?php echo $row['SelectedSeats']; ?></td>
                        <td><?php echo $row['TotalPrice']; ?></td>
                        <td><?php echo $row['RoomName']; ?></td>
                        <td><?php echo $row['Quantity']; ?></td>
                        <td><?php echo $row['Point']; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </body>
    </html>
    <?php
} else {
    echo "เกิดข้อผิดพลาดในการบันทึกข้อมูล: " . $conn->error;
}

// ปิดการเชื่อมต่อฐานข้อมูล
$conn->close();
?>
