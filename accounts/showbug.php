<h3>Your Features</h3>
<?php
$sql = "SELECT * FROM Bugrep WHERE AccountID = $AccountID ORDER BY ReportDate DESC;";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
$queryresults = mysqli_num_rows($result);
if ($queryresults > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $Bug = $row["Bug"];
    $ReportDate = $row["ReportDate"];
    echo ('
    <div class="featbub">
      '.$ReportDate.'
      <br>
      '.$Bug.'
    </div>
    ');
    }
  }
 ?>
