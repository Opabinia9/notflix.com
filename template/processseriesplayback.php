<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");

$playbackTime = $_POST['time'];
$AccountID = $_POST['user_id'];
$SeriesID = $_POST['series'];
$SeasonID = $_POST['season'];
$EpisodeID = $_POST['episode'];

$sql = "INSERT INTO Watchlist (AccountID,SeriesID,SeasonID,EpisodeID,Time_code)
        VALUES (?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE SeasonID = VALUES(SeasonID), EpisodeID = VALUES(EpisodeID), Time_code = VALUES(Time_code)";

$stmt = $conn->prepare($sql);

$stmt->bind_param("sssss", $AccountID, $SeriesID, $SeasonID, $EpisodeID, $playbackTime);

if ($stmt->execute()) {
    echo "Playback position saved successfully!";
} else {
    echo "Error: " . $stmt->error;
}
$stmt->close();
$conn->close();
}
?>
