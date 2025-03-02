<?php
if (isset($_SESSION["user_id"])) {
  $uid = $_SESSION["user_id"];
  include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
  $sql = "SELECT * FROM users WHERE AccountID = $uid";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  $result = $stmt->get_result();
  $queryresults = mysqli_num_rows($result);
  if ($queryresults > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
      $name = $row["Username"];
    }
  }
  echo "
  <div class='addcommentdiv'>
    <div class='profile'>
      <div class='pic'>
       $name
      </div>
      <div class='name'>
      </div>
    </div>
    <form class='addcom' action='http://notflix.com/template/proccesscomment.php' method='post' id='signup'>
    <input type='hidden' name='uid' value='$uid'>
    <input type='hidden' name='sid' value='$SeriesID'>
    <input type='hidden' name='url' value='".$_SERVER['PHP_SELF']."'>
    <textarea name='message' class='comtext'></textarea><br>
    <button type='submit' name='submit'>Comment</button>
    </form>
  </div>
  ";
} else {
  echo "
  <div class='addcommentdiv'>
    <div class='profile'>
      <div class='pic'>
       anon
      </div>
      <div class='name'>
      </div>
    </div>
    <form class='addcom'>
    <textarea class='comtext'></textarea><br>
    <button type='submit' name='submit'>Login to comment</button>
    </form>
  </div>
  ";
}
  ?>
