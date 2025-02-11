<?php
$videoPath = '\videos\Heavenly Headquarters Year 2024_ Part IV.mp4'; // Adjust the path as needed

//if (file_exists($videoPath)) {
    header('Content-Type: video/mp4');
//    header('Content-Length: ' . filesize($videoPath));
    readfile($videoPath);
//} else {
//    echo "Video file not found.";
//}
?>
