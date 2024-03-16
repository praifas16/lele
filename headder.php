<?php
    // เช็คว่ามี session ที่เกิดขึ้นหรือไม่
    session_start();

    // เช็คว่าผู้ใช้เข้าสู่ระบบหรือยัง
    if (!isset($_SESSION['user_id'])) {
        // ถ้ายังไม่ได้เข้าสู่ระบบให้ redirect ไปที่หน้า login
        header("Location: login.php");
        exit();
    }

    // ติดต่อฐานข้อมูล
    $host = 'localhost';
    $dbname = 'Scinema';
    $username = 'root';
    $password = 'root';

    $conn = new mysqli($host, $username, $password, $dbname);

    // เช็คการเชื่อมต่อ
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // ดึงข้อมูลผู้ใช้จาก session
    $user_id = $_SESSION['user_id'];

    /// คำสั่ง SQL เพื่อดึงข้อมูลผู้ใช้
    $sql_user = "SELECT * FROM Users WHERE UsersID = $user_id";
    $result_user = $conn->query($sql_user);

    // ตรวจสอบว่ามีข้อมูลผู้ใช้หรือไม่
    if ($result_user->num_rows > 0) {
        $user = $result_user->fetch_assoc();

        // URL ของหน้าก่อนหน้า
        $previous_page_url = "moviemore.php?user_id=" . $user['UsersID'] . '&name=' . urlencode($user['Name']) . '&movie_id=' . $row_movie_details["MovieID"];
    }

    // คำสั่ง SQL เพื่อดึงข้อมูลภาพยนตร์
    $sql_movies = "SELECT Movie.MovieID, Movie.NameMovie, Movie.ReleaseDate, Genre.Genre, Movie.Poster, Movie.LinkVDO, Movie.LeavingDate 
                FROM Movie
                JOIN Genre ON Movie.GenreID = Genre.GenreID
                WHERE Movie.ReleaseDate > CURDATE()";
    $result_movies = $conn->query($sql_movies);

?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>S-Cinima - Naresuann</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* สไตล์ CSS ที่ใช้ในหน้า homepage.php */
        body {
            background-color: #000;
            color: #FFF;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        nav {
            background-color: #212121;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: #FFF;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }

        section {
            padding: 20px;
        }

        footer {
            background-color: #212121;
            padding: 10px;
            text-align: center;
        }

        .movie-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .movie-card {
            background-color: #333;
            color: #FFF;
            padding: 10px;
            margin: 10px;
            text-align: center;
            width: 200px;
        }

        /* เพิ่มสไตล์ปุ่ม */
        .btn-more {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            
        }
        
        .secondary-nav {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px; /* ปรับ margin-top ตามต้องการ */
        }

        .secondary-nav a {
            display: inline-block;
            padding: 15px 30px;
            background-color: #2c3e50; /* สีเทาๆ */
            color: #FFF;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .secondary-nav a:hover {
            background-color: #555; /* เปลี่ยนสีเมื่อนำเมาส์ hover */
        }
        .secondary-nav a:nth-child(2) {
            background-color: #808080;/* เปลี่ยนสีตามที่คุณต้องการ */
        }


        section {
            padding: 20px;
            margin-top: 10px; /* เพิ่ม margin-top เพื่อห่างจากบาร์ด้านบน */
        }

        footer {
            background-color: #212121;
            padding: 10px;
            text-align: center;
        }

        .movie-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .movie-card {
            background-color: #333;
            color: #FFF;
            padding: 10px;
            margin: 10px;
            text-align: center;
            width: 200px;
        }

        /* เพิ่มสไตล์ปุ่ม */
        .btn-more {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        /* เมื่อนำเมาส์ไปวัตถุแล้วปรากฏเอฟเฟกต์ */
        .btn-more:hover {
            background-color: #2980b9;
        }
        .image-container {
            display: flex;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
            white-space: nowrap;
        }

        .image-container img {
            width: 100%;
            max-width: 10000px;
            margin-right: 10px;
            scroll-snap-align: start;
        }


    </style>
</head>
<body>

<nav>
    <a href="headder.php">Homepage</a>
    <a href="homepage.php">Movie</a>
    <a href="#">Promotion</a>
</nav>

<div class="secondary-nav">
    <a href="homepage.php">หนังที่ฉาย</a> <!-- เพิ่มปุ่มนี้ -->
    <a href="headder.php">โปรแกรมหน้า</a> <!-- เพิ่มปุ่มนี้ -->
</div>


<section>
    <div class="container">
        <section>
            <div class="image-container" id="slideshow-container">
                <?php
                    // Query to fetch images with specific PosterID from database
                    $posterIds = ['0000001', '0000002']; // เพิ่ม PosterID ที่ต้องการ
                    foreach ($posterIds as $posterId) {
                        $sql = "SELECT Poster FROM Poster_Promotion WHERE PosterID = ?";
                        $stmt = $conn->prepare($sql);
                        $stmt->bind_param('s', $posterId);
                        $stmt->execute();
                        $result = $stmt->get_result();

                        // Display images
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo '<img src="data:image/png;base64,' . base64_encode($row['Poster']) . '" />';
                            }
                        }

                        // Close statement
                        $stmt->close();
                    }

                    // Close connection
                    $conn->close();
                ?>
            </div>
        </section>
    </div>
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;About to enter the movie theater</h2>
    <div class="movie-container">
        <?php
        // แสดงผลภาพยนตร์
        if ($result_movies->num_rows > 0) {
            $count = 0; // ตัวแปรนับจำนวนหนัง
            while ($row_movies = $result_movies->fetch_assoc()) {
                if ($count % 5 == 0) {
                    echo '</div>'; // ปิดแถวก่อนหนังที่ 6, 11, ...
                    echo '<div class="movie-container">';
                }
                echo '<div class="movie-card">';
                echo '<img src="' . $row_movies["Poster"] . '" alt="' . $row_movies["NameMovie"] . '" style="width: 100%;">';
                echo '<h3>' . $row_movies["NameMovie"] . '</h3>';
                echo '<p>วันที่เข้าฉาย: ' . $row_movies["ReleaseDate"] . '</p>';
                echo '<p>ประเภท: ' . $row_movies["Genre"] . '</p>';
                echo '<a class="btn-more" href="moviemore.php?user_id=' . $user_id . '&name=' . urlencode($user['Name']) . '&movie_id=' . $row_movies["MovieID"] . '">ดูรายละเอียด</a>';
                echo '</div>';
                $count++;
            }
            // ปิดแถวสุดท้าย (กรณีที่ไม่ได้ปิดแถวในการวน loop)
            echo '</div>';
        } else {
            echo "No movies available";
        }
        ?>
    </div>
</section>

<script>
        // JavaScript for automatic slideshow
        const slideshowContainer = document.getElementById('slideshow-container');
        const images = document.querySelectorAll('.image-container img');
        let currentImageIndex = 0;

        function nextImage() {
            currentImageIndex = (currentImageIndex + 1) % images.length;
            slideshowContainer.scrollLeft = images[currentImageIndex].offsetLeft;
        }

        // Set timeout to wait for 5 seconds before starting slideshow
        setTimeout(function() {
            setInterval(nextImage, 1000); // เลื่อนภาพทุก 1 วินาที
        }, 1000); // 1 seconds timeout before starting
</script>

<footer>
    <p>&copy; S-Cinima - Naresuann</p>
</footer>

</body>
</html>

<?php
// ปิดการเชื่อมต่อฐานข้อมูล
$conn->close();
?>
