<!DOCTYPE html>
<?php
session_start();
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
if(isset($_SESSION["user_id"])){
  $userid = $_SESSION["user_id"];
  if(isset($_POST['season'])){
    $sql = "UPDATE watchlist SET SeasonID = ? WHERE AccountID = ? AND SeriesID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss",htmlspecialchars($_POST['season']), $userid, $SeriesID);
    if ($stmt->execute()) {
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
  }
  if(isset($_POST['selectedepisode'])){
    $sql = "UPDATE watchlist SET EpisodeID = ?, Time_code = '0:0:0' WHERE AccountID = ? AND SeriesID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", htmlspecialchars($_POST['selectedepisode']), $userid, $SeriesID);
    if ($stmt->execute()) {
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
  }
    $sql = "SELECT * FROM watchlist WHERE AccountID = {$_SESSION["user_id"]} AND SeriesID = $SeriesID";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $SeasonID = $row["SeasonID"];
        $EpisodeID = $row["EpisodeID"];
        $playbackPosition = $row["Time_code"];
        $selected = $SeasonID;
        $selectedep = $EpisodeID;
      }
    } else {
      $playbackPosition =  "0:0:0";
      if(isset($_POST['season'])){
        $selected = htmlspecialchars($_POST['season']);
      } else {
        $selected = 1;
      }
      $SeasonID = $selected;
      if(isset($_POST['selectedepisode'])){
        $selectedep = htmlspecialchars($_POST['selectedepisode']);
        $EpisodeID = $selectedep;
      } else {
        $selectedep = 1;
        $EpisodeID = $selectedep;
      }
    }
  } else {
    $playbackPosition =  "0:0:0";
    if(isset($_POST['season'])){
      $selected = htmlspecialchars($_POST['season']);
    } else {
      $selected = 1;
    }
    $SeasonID = $selected;
    if(isset($_POST['selectedepisode'])){
      $selectedep = htmlspecialchars($_POST['selectedepisode']);
      $EpisodeID = $selectedep;
    } else {
      $selectedep = 1;
      $EpisodeID = $selectedep;
    }
  }
  $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $title = $row["Title"];
      $description = $row["Description"];
      $releaseyear = $row["ReleaseYear"];
      $length = $row["Length"];
      $poster = $row["Poster"];
    }
  } else {//echo "0 results";
  }
  $sql = "SELECT * FROM episode WHERE SeriesID = $SeriesID AND SeasonID = $SeasonID AND EpisodeID = $EpisodeID";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $available = $row["Available"];
      $URL = $row["URL"];
    }
  } else {//echo "0 results";
  }
  $conn->close();
?>
<html lang="en" class="moviepage">
  <head>
    <title><?php echo $title; ?></title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="movie1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/" href="http://notflix.com/css/general.css">
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
    if (!isset($URL)){$URL = "http://Notflix.com";}
      echo ('<video poster='.$poster.' src="'.$URL.'" id="videoPlayer" controls>Sad Face :(</video> ');
      if(isset($_SESSION["user_id"])){
        ?>
          <script>
            const videoPlayer = document.getElementById("videoPlayer");
            videoPlayer.currentTime = convertTimeToSeconds("<?php echo "$playbackPosition"; ?>");
            function convertTimeToSeconds(time) {
              const parts = time.split(':');
              return parseInt(parts[0]) * 3600 + parseInt(parts[1]) * 60 + parseInt(parts[2]);
            }
            let lastSaveTime = Date.now();
            function savePlaybackPosition() {
              const currentTime = videoPlayer.currentTime;
              const formattedTime = formatTime(currentTime);
              const bodyData = `time=${formattedTime}&user_id=${"<?php echo "$userid"; ?>"}&series=${<?php echo "$SeriesID"; ?>}&season=${<?php echo "$SeasonID"; ?>}&episode=${<?php echo "$EpisodeID"; ?>}`;
              fetch('http://notflix.com/template/processseriesplayback.php', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: bodyData
              })
              .then(response => {})
              .catch(error => {
                console.error('Error saving playback position:', error);
              });
            }
            function formatTime(seconds) {
              const hours = Math.floor(seconds / 3600);
              const minutes = Math.floor((seconds % 3600) / 60);
              const remainingSeconds = Math.floor(seconds % 60);
              return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
            }
            videoPlayer.addEventListener('timeupdate', () => {
              const currentTime = Date.now();
              if (currentTime - lastSaveTime >= 60000) {
                savePlaybackPosition();
                lastSaveTime = currentTime;
              }
            });
          </script>`
        <?php
      };
    echo ('
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
      <form method="POST" action="'.$topurl.'" id="selection" class="test">
    ');
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM season WHERE SeriesID = $SeriesID";
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
    } else {}
    $conn->close();
    echo ('
      </div>
      </div>
      <div><p>Season '.$selected.'</p></div>
      </div>
      <div class="episodes-outer">
    ');
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM episode WHERE SeriesID = $SeriesID AND SeasonID = $selected";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
      $eptitle = $row["EpisodeTitle"];
      $EpisodeID = $row["EpisodeID"];
      $avai = $row["Available"];
      echo '
      <label class="episode">
      <input type="radio" name="selectedepisode" value="'.$EpisodeID.'"';
      if($EpisodeID == $selectedep){echo "checked";};
      echo '
        required onchange="this.form.submit()">
        <div class="eplable"';  if($avai == 0){echo 'style="background-color: #005000;"';}; echo '>Ep '.$EpisodeID.': '.$eptitle.'</div>
        </label>
      ';
      }
    } else {//echo "0 results";
    }
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
    include($_SERVER["DOCUMENT_ROOT"] . "/template/comments.php");
    ?>
  </main>
  <footer>
    <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
    ?>
  </footer>
  </body>
</html>
