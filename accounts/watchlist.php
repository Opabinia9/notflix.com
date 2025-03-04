<!DOCTYPE html>
<?php

 ?>
<html lang="en">
  <head>
    <title>Notflix.com</title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="Search Page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/watchlist.css">
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
      <div class="catouterdiv">
        <div class="results">
          <div class="catmovies">
            <?php
            session_start();
            if (isset($_SESSION["user_id"])) {
                include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
                $sql = "SELECT * FROM watchlist WHERE AccountID = {$_SESSION["user_id"]}";
                $result1 = $conn->query($sql);
                $queryresults1 = mysqli_num_rows($result1);
                if ($queryresults1 > 0) {
                  while ($row1 = mysqli_fetch_assoc($result1)) {
                    $AccountID = $row1['AccountID'];
                    $SeriesID = $row1['SeriesID'];
                    $SeasonID = $row1['SeasonID'];
                    $EpisodeID = $row1['EpisodeID'];
                    $Time_code = $row1['Time_code'];
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID";
                    $stmt = $conn->prepare($sql);
                    $stmt->execute();
                    $result = $stmt->get_result();
                    $queryresults = mysqli_num_rows($result);
                    if ($queryresults > 0) {
                      while ($row = mysqli_fetch_assoc($result)) {
                        $SeriesID = $row['SeriesID'];
                        $poster = $row['Poster'];
                        $title = $row['Title'];
                        $description = $row['Description'];
                        $releaseyear = $row['ReleaseYear'];
                        $length = $row['Length'];
                        $NOS = $row['NOS'];
                        $available = $row['Available'];
                        if ($NOS < 1) {
                          $type = "Movie";
                        } else {
                          $type = "Series";
                        }
                        if ($available = 1){
                          $avstat = "darkgreen";
                        } else {
                          $avstat = "red";
                        }
                        include($_SERVER["DOCUMENT_ROOT"] . "/template/watchlistitem.php");
                      }
                    }
                  }
                } else{}
            } else{ echo ('
              <div class="nologout">
                <div class="nologin">
                  <h1>Sorry, You need to login first</h1>
                  <p><a href="http://notflix.com/accounts/login.php">Log in</a> or <a href="http://notflix.com/accounts/signup.php">sign up</a></p>
                </div>
              </div>
            ');};
            ?>
          </div>
        </div>
      </div>
    </main>
    <footer>
      <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
  </body>
</html>
