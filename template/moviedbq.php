<?php
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
  $conn->close();
 ?>
