<!DOCTYPE html>
<?php
  $match = [];
  $termlist = [];
  if(isset($_POST['Available'])){
    $avai = htmlspecialchars($_POST['Available']);
  } else {
    $avai = "All";
  }
  if(isset($_POST['type'])){
    $typeset = htmlspecialchars($_POST['type']);
  } else {
    $typeset = "All";
  }
  if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $searchTerm = htmlspecialchars($_POST['searchTerm']);
    $searcharray = explode(" ", $searchTerm);
    foreach ($searcharray as $x) {
      $termlist[] = metaphone($x);
    }
  } else {
    $searchTerm = "";
    $searcharray = [];
  }
  include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
  $sql = "SELECT * FROM media";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  $result = $stmt->get_result();
  $queryresults = mysqli_num_rows($result);
  if ($queryresults > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
      $SeriesID = $row['SeriesID'];
      $title =  metaphone($row['Title']);
      $description =  metaphone($row['Description']);
      $releaseyear =  metaphone($row['ReleaseYear']);
      if (count($termlist) > 0) {
        foreach ($termlist as $x) {
          if (str_contains($title, $x) or str_contains($description, $x) or str_contains($releaseyear, $x)) {
            if (!isset($match[$SeriesID])) {
              $match[$SeriesID] = 0;
            }
            $match[$SeriesID]++;
          }
        }
      } else {
        $match[$SeriesID] = 0;
      }
    }
  } else {
    echo "dust to dust";
  }
  arsort($match);
 ?>
<html lang="en">
  <head>
    <title>Notflix.com</title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="Search Page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/search.css">
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
        <div class="catselect">
          <form method="POST" action="http://notflix.com/search.php" id="fitlers">
            <div class="opt">
              <label class="custom-toggle">
                <input type="checkbox" name="Available" value="Available" <?php if(isset($_POST['Available'])){echo "checked";}?> onchange="this.form.submit()">
                <div class="toggle-lable">Available</div>
                <div class="slider"><div class="slider-inner"></div></div>
              </label>
            </div>
            <div class="search-bar">
              <input type="text" name="searchTerm" value="<?php echo $searchTerm ?>" placeholder="Search...">
              <button type="submit">Search</button>
            </div>
            <div class="opt">
              <label class="custom">
                <input type="radio" name="type" value="Movies" <?php if(isset($_POST['type']) && $_POST['type'] =='Movies' ){echo "checked";}?> required onchange="this.form.submit()">
                <span class="filter">Movie</span>
              </label>
              <label class="custom catnew">
                <input type="radio" name="type" value="Series" <?php if(isset($_POST['type']) && $_POST['type'] =='Series' ){echo "checked";}?> required onchange="this.form.submit()">
                <span class="filter">Series</span>
              </label>
              <label class="custom catall">
                <input type="radio" name="type" value="All" <?php if(!isset($_POST['type']) || $_POST['type'] =='All' ){echo "checked";}?> required onchange="this.form.submit()">
                <span class="filter">All</span>
              </label>
            </div>
          </form>
        </div>
        <div class="results">
          <div class="num"><?php echo "<h3>".count($match)." results</h3><hr>";?></div>
          <div class="catmovies">
            <?php
              foreach ($match as $SeriesID => $terms) {
                include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
                if ($avai == "All"){
                  if ($typeset == "All") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID";
                  }elseif ($typeset == "Movies") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID AND NOS < 1";
                  }elseif ($typeset == "Series") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID AND NOS > 0";
                  }
                } elseif($avai == "Available") {
                  if ($typeset == "All") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID AND Available = 1";
                  }elseif ($typeset == "Movies") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID AND NOS < 1 AND Available = 1";
                  }elseif ($typeset == "Series") {
                    $sql = "SELECT * FROM media WHERE SeriesID = $SeriesID AND NOS > 0 AND Available = 1";
                  }
                }
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
                      $type = "movie";
                    } else {
                      $type = "series";
                    }
                    if ($available == 1){
                      $avstat = "darkgreen";
                    } else {
                      $avstat = "red";
                    }
                    include($_SERVER["DOCUMENT_ROOT"] . "/template/searchitem.php");
                  }
                }
              }
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
