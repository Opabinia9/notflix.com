<!DOCTYPE html>
<?php
session_start();
if (isset($_SESSION["user_id"])) {
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM users
            WHERE AccountID = {$_SESSION["user_id"]}";
    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
}

  if(isset($_POST['season'])){
    $selected = htmlspecialchars($_POST['season']);
  } else {
    $selected = 1;
  }
$SeasonID = $selected;
if(isset($_POST['selectedepisode'])){
$selectedep = htmlspecialchars($_POST['selectedepisode']);
} else {
$selectedep = 1;
}

$EpisodeID = $selectedep;
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
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
  $sql = "SELECT * FROM Watchlist WHERE AccountID = {$_SESSION["user_id"]} AND SeriesID = $SeriesID AND SeasonID = $SeasonID AND EpisodeID = $EpisodeID";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $playbackPosition = $row["Time_code"];
    }
  } else { $playbackPosition =  "0:0:0";}
} else { $playbackPosition =  "0:0:0";}

$conn->close();
?>
<html lang="en" class="moviepage">
<head>
<title><?php echo $title; ?></title>
<link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
<meta charset="UTF-8">
<meta name="descrpittion" content="movie1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
<link rel="stylesheet" type="text/css" href="http://notflix.com/css/seriespage.css">
<script src="http://notflix.com/js/seriespage.js"></script>
</head>
<body>
<header>
<nav>
<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/navbar.php");
?>
</nav>
</header>
<main>
<?php
echo ('
<video poster='.$poster.' src="'.$URL.'" id="videoPlayer" controls>Sad Face :(</video> ')?>
<script>
const videoPlayer = document.getElementById("videoPlayer");
videoPlayer.currentTime = convertTimeToSeconds("<?php echo "$playbackPosition"; ?>");
function convertTimeToSeconds(time) {
const parts = time.split(':');
return parseInt(parts[0]) * 3600 + parseInt(parts[1]) * 60 + parseInt(parts[2]);
}
</script>
<?php echo ('
<br/>
<br/>
<br/>
<div class="select-episode">
<div class="spselectseaon">
<div class="spselection">
<button class="seasonSelector" onclick="seasonMenu()">
<div class="line"></div>
<div class="line"></div>
<div class="line"></div>
</button>
<div id="seasonSelector" class="seasons">
<form method="POST" action="http://notflix.com/series/3.php" id="selection" class="test">
');
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "SELECT * FROM Season WHERE SeriesID = $SeriesID";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
$SeasonID = $row["SeasonID"];
echo ('
<label class="">
<input type="radio" name="season" value="'.$SeasonID.'"
');
if($selected == $SeasonID){echo "checked";};
echo ('
required onchange="this.form.submit()">
<span class="">Season '.$SeasonID.'</span>
</label>
');
}
} else {echo "0 results";}
$conn->close();
echo ('
</div>
</div>
<div><p>Season '.$selected.'</p></div>
</div>
<div class="episodes-outer">
<!-- <div class="episodes"> -->
');
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "SELECT * FROM Episode WHERE SeriesID = $SeriesID AND SeasonID = $selected";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
$eptitle = $row["EpisodeTitle"];
$EpisodeID = $row["EpisodeID"];
echo '
<label class="episode">
<input type="radio" name="selectedepisode" value="'.$EpisodeID.'"';
if($EpisodeID == $selectedep){echo "checked";};
echo '
required onchange="this.form.submit()">
<div class="eplable">Ep '.$EpisodeID.': '.$eptitle.'</div>
</label>
';
}
} else {echo "0 results";}
$conn->close();
echo ('
</form>
</div>
</div>
<br/>
<div class="spouterdiv">
<div class="spmiddiv">
<hr/>
<div class="spinnerdiv">
<div class="spleftdiv"><img src='.$poster.'></img></div>
<div class="sprightdiv">
<div class="sptitlediv"><h2>'.$title.'</h2></div>
<div class="sptriplediv">
<div class="spavailable"><h6>'.$available.'</h6></div>
<div class="spreleaseyear"><h6>'.$releaseyear.'</h6></div>
<div class="splength"><h6>'.$length.'</h6></div>
</div>
<div class="spdescriptiondiv"><p>'.$description.'</p></div>
</div>
</div>
</div>
</div>
');
?>
</main>
<footer>
<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
?>
</footer>
</body>
</html>
