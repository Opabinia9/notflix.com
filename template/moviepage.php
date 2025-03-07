<!DOCTYPE html>
<?php
  session_start();
  include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
  if(isset($_SESSION["user_id"])){
    $userid = $_SESSION["user_id"];
    $sql = "SELECT * FROM watchlist WHERE AccountID = {$_SESSION["user_id"]} AND SeriesID = $SeriesID";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $SeasonID = $row["SeasonID"];
        $EpisodeID = $row["EpisodeID"];
        $playbackPosition = $row["Time_code"];
      }
    } else {
      $playbackPosition =  "0:0:0";
    }
  } else {
    $playbackPosition =  "0:0:0";
  }
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $SeasonID = 0;
    $EpisodeID = 1;
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
    } else {echo "0 results";}
    $sql = "SELECT * FROM episode WHERE SeriesID = $SeriesID AND SeasonID = $SeasonID AND EpisodeID = $EpisodeID";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
          $available = $row["Available"];
          $URL = $row["URL"];
        }
    } else {}

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
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/moviepage.css">
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
        <video poster='.$poster.' src='.$URL.' id="videoPlayer" controls>Sad Face :(</video>') ?>
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
        <?php  echo ('
        <br/>
        <br/>
        <br/>
        <br/>
          <div class="mpouterdiv">
            <div class="mpmiddiv">
              <hr/>
              <div class="mpinnerdiv">
                <div class="mpleftdiv"><img src='.$poster.'></img></div>
                <div class="mprightdiv">
                  <div class="mptitlediv"><h2>'.$title.'</h2></div>
                  <div class="mptriplediv">
                    <div class="mpavailable"><h6>'.$available.'</h6></div>
                    <div class="mpreleaseyear"><h6>'.$releaseyear.'</h6></div>
                    <div class="mplength"><h6>'.$length.'</h6></div>
                  </div>
                  <div class="mpdescriptiondiv"><p>'.$description.'</p></div>
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
