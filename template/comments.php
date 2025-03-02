<link rel="stylesheet" type="text/css" href="http://notflix.com/css/comments.css">
<hr>
<div class="comheaderbox">
<h2 class="comheader">Comments</h2>
<hr>
</div>
<h3>0 Comments</h3>
<hr>
<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "SELECT * FROM Comments WHERE SeriesID = $SeriesID";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
$queryresults = mysqli_num_rows($result);
if ($queryresults > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $AccountID = $row["AccountID"];
    $Content = $row["Content"];
    $PostDate = $row["PostDate"];
    $sql2 = "SELECT * FROM users WHERE AccountID = $AccountID";
    $stmt2 = $conn->prepare($sql2);
    $stmt2->execute();
    $result2 = $stmt2->get_result();
    $queryresults2 = mysqli_num_rows($result2);
    if ($queryresults2 > 0) {
      while ($row2 = mysqli_fetch_assoc($result2)) {
        $name = $row2["Username"];
        include($_SERVER["DOCUMENT_ROOT"] . "/template/comment.php");
      }
    }
  }
}
include($_SERVER["DOCUMENT_ROOT"] . "/template/addcomment.php");

 ?>
<hr>
