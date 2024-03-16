<?php


$host = 'localhost';
$dbname = 'Scinema';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

// Check if image data is received
if (isset($_FILES['imageData'])) {
    // Get image data
    $imageData = $_FILES['imageData'];

    // Check for errors in uploaded file
    if ($imageData['error'] === 0) {
        // Define the file path where the image will be saved
        $filePath = 'ticket_images/' . $imageData['name'];

        // Save the image to the specified file path
        if (move_uploaded_file($imageData['tmp_name'], $filePath)) {
            // Image saved successfully
            echo json_encode(array("status" => "success", "message" => "ภาพถูกบันทึกแล้ว", "fileName" => $imageData['name']));
        } else {
            // Error saving image
            echo json_encode(array("status" => "error", "message" => "เกิดข้อผิดพลาดในการบันทึกภาพ"));
        }
    } else {
        // Error uploading image
        echo json_encode(array("status" => "error", "message" => "เกิดข้อผิดพลาดในการอัพโหลดภาพ"));
    }
} else {
    // No image data received
    echo json_encode(array("status" => "error", "message" => "ไม่ได้รับข้อมูลภาพ"));
}
?>
