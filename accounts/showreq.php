<h3>Your Requests</h3>
<?php
$sql = "SELECT * FROM Requests WHERE AccountID = $AccountID ORDER BY RequestDate DESC;";
$stmt = $conn->prepare($sql);
$stmt->execute();
$result = $stmt->get_result();
$queryresults = mysqli_num_rows($result);
if ($queryresults > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $Request = $row["Request"];
    $RequestDate = $row["RequestDate"];
    echo ('
    <div class="reqbub">
      '.$RequestDate.'
      <br>
      '.$Request.'
    </div>
    ');
    }
  }
 ?>
