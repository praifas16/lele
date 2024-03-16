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

// ตรวจสอบว่ามีการส่ง MovieID และ user_id มาจากหน้า homepage.php หรือไม่
if (isset($_GET['user_id']) && isset($_GET['movie_id'])) {
    // ดึง MovieID และ user_id จาก parameter ที่ส่งมา
    $user_id = $_GET['user_id'];
    $user_name = $_SESSION['user_name'];
    $movie_id = $_GET['movie_id'];

    // URL หน้าก่อนหน้า
    $previous_page_url = "moviemore.php?user_id=" . $user_id . '&name=' . urlencode($user_name) . '&movie_id=' . $movie_id;

    // คำสั่ง SQL เพื่อดึงข้อมูลภาพยนตร์
    $sql_movie_details = "SELECT * FROM Movie WHERE MovieID = $movie_id";
    $result_movie_details = $conn->query($sql_movie_details);

    // ตรวจสอบว่ามีข้อมูลหรือไม่
    if ($result_movie_details->num_rows > 0) {
        $row_movie_details = $result_movie_details->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>S-Cinima - Naresuann</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* สไตล์ CSS ที่ใช้ในหน้า moviemore.php */
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
            text-align: center;
        }

        footer {
            background-color: #212121;
            padding: 10px;
            text-align: center;
        }

        .movie-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .movie-poster {
            width: 300px;
            margin-right: 20px;
        }

        .movie-details-text {
            flex: 1;
            text-align: left;
        }

        /* เพิ่มสไตล์ในการแสดงวิดีโอ YouTube */
        .youtube-video iframe {
            position: relative;
            text-align: left;
            width: 100%;
            height: 100%; /* ปรับเป็น 100% ของความสูง */
        }

        .youtube-video {
            position: relative;
            width: 100%;
            height: 0;
            padding-bottom: 56.25%; /* 16:9 aspect ratio */
            margin-bottom: 20px;
        }


        .youtube-video iframe {
            position: absolute;
            text-align: left;
            top: 50%;
            left: 0;
            width: 100%;
            height: 50%;
            transform: translateY(-50%); /* ใช้ transform เพื่อย้ายตำแหน่งตามความสูง */
        }

        .btn-book {
            display: inline-block;
            padding: 10px 30px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 250px;
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

        .btn-book:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<nav>
    <a href="homepage.php?user_id=<?php echo $user_id; ?>">Homepage</a>
    <a href="homepage.php">Movie</a>
    <a href="#">Promotion</a>
</nav>

<section>
    <h2>รายละเอียดภาพยนตร์</h2>
    <div class="movie-details">
        <div class="movie-poster">
            <img src="<?php echo $row_movie_details['Poster']; ?>" alt="<?php echo $row_movie_details['NameMovie']; ?>" style="width: 100%;">
        </div>
        <div class="movie-details-text">
            <h3><?php echo $row_movie_details['NameMovie']; ?></h3>
            <p>Release date : <?php echo $row_movie_details['ReleaseDate']; ?></p>
            <p>Price : <?php echo $row_movie_details['price']; ?> Baht</p>
            <p>Duration : <?php echo $row_movie_details['Duration']; ?></p>
            
            <!-- เพิ่มข้อมูลอื่น ๆ ตามต้องการ -->

            <?php
            $director_id = $row_movie_details['DirectorID'];
            $sql_director = "SELECT Director.NameDirector ,Director.ImageURL FROM Director WHERE Director.DirectorID = $director_id";
            $result_director = $conn->query($sql_director);

            if ($result_director->num_rows > 0) {
                echo "<p>Director : ";
                while ($row_director = $result_director->fetch_assoc()) {
                    echo $row_director['NameDirector'] . " ";
                    echo '<img src="' . $row_director['ImageURL'] . '" alt="' . $row_director['NameDirector'] . '" style="width: 100px; height: 150px; margin-right: 10px;">';
                }
                echo "</p>";
            } else {
                echo "<p>ไม่มีข้อมูลผู้กำกับ</p>";
            }
            ?>
            <?php
            $sql_actors = "SELECT Actors.ActorsID, Actors.NameActor, Actors.ImageURL
                        FROM Movie_Actors
                        JOIN Actors ON Movie_Actors.ActorsID = Actors.ActorsID
                        WHERE Movie_Actors.MovieID = $movie_id";

            $result_actors = $conn->query($sql_actors);

            // ตรวจสอบว่ามีข้อมูลหรือไม่
            if ($result_actors->num_rows > 0) {
                echo "<p>Actor : ";
                while ($row_actor = $result_actors->fetch_assoc()) {
                    $actor_id = $row_actor['ActorsID'];
                    echo '<img src="' . $row_actor['ImageURL'] . '" alt="' . $row_actor['NameActor'] . '" style="width: 100px; height: 150px; margin-right: 10px;">';
                    echo $row_actor['NameActor'] . '</a>';
                }
                echo "</p>";
            } else {
                echo "<p>ไม่มีข้อมูลนักแสดง</p>";
            }
            ?>

            <!-- แสดงตัวอย่างหนังผ่าน YouTube -->
            <?php
                $youtube_video_url = $row_movie_details['LinkVDO'];
                $video_id = getYouTubeVideoId($youtube_video_url);

                if ($video_id) {
                    echo '<div class="youtube-video">';
                    echo '<iframe src="https://www.youtube.com/embed/' . $video_id . '" frameborder="0" allowfullscreen></iframe>';
                    echo '</div>';
                }  
            ?>
            <?php
                $current_date = date("Y-m-d");

                if ($row_movie_details['ReleaseDate'] <= $current_date && ($row_movie_details['LeavingDate'] == null || $row_movie_details['LeavingDate'] >= $current_date)) {
                    $movie_name_encoded = urlencode($row_movie_details['NameMovie']);
                    $movie_name_formatted = str_replace(['+', '%28', '%29'], ['-', '', ''], $movie_name_encoded);
                    echo '<a class="btn-more" href="showetime.php?user_id=' . $user_id . '&name=' . urlencode($user_name) .'&movie_id=' . $movie_id . '&namemovie=' . $movie_name_formatted . '">กดเพื่อจอง</a>';
                    } else {
                    echo '<p>ไม่สามารถจองได้ในขณะนี้</p>';
                }                                                         
            ?>

        </div>
    </div>
</section>

<footer>
    <p>&copy; S-Cinima - Naresuann</p>
</footer>

</body>
</html>

<?php
    } else {
        echo "ไม่พบข้อมูลภาพยนตร์";
    }
} else {
    echo "ไม่ได้ระบุ MovieID";
}

// ปิดการเชื่อมต่อฐานข้อมูล
$conn->close();

// เรียกคลิปจาก YouTube มา
function getYouTubeVideoId($url) {
    $pattern = '/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/';
    preg_match($pattern, $url, $matches);
    return isset($matches[1]) ? $matches[1] : null;
}
?>