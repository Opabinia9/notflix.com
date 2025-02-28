<?php
session_start();
if (isset($_SESSION["user_id"])) {
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM users
            WHERE AccountID = {$_SESSION["user_id"]}";
    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
}
  include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
  $SeasonID = 0;
  $EpisodeID = 1;
  $sql = "SELECT * FROM Media WHERE SeriesID = $SeriesID";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $title = $row["Title"];
        $description = $row["Description"];
        $releaseyear = $row["ReleaseYear"];
        $length = $row["Length"];
        $poster = $row["Poster"];
      }
  } else {echo "0 results";}
  $sql = "SELECT * FROM Episode WHERE SeriesID = $SeriesID AND SeasonID = $SeasonID AND EpisodeID = $EpisodeID";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $available = $row["Available"];
        $URL = $row["URL"];
      }
  } else {echo "0 results";}

  if(isset($_SESSION["user_id"])){
    $sql = "SELECT * FROM Watchlist WHERE AccountID = {$_SESSION["user_id"]} AND SeriesID = $SeriesID";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $playbackPosition = $row["Time_code"];
      }
    } else { $playbackPosition =  "0:0:0";}
  } else { $playbackPosition =  "0:0:0";}

  $conn->close();
 ?>
