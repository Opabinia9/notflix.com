<h3>Your Features</h3>
<?php
$sql = "SELECT * FROM Features WHERE AccountID = $AccountID ORDER BY RequestDate DESC;";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
$queryresults = mysqli_num_rows($result);
if ($queryresults > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $Feature = $row["Feature"];
    $RequestDate = $row["RequestDate"];
    echo ('
    <div class="featbub">
      '.$RequestDate.'
      <br>
      '.$Feature.'
    </div>
    ');
    }
  }
 ?>
