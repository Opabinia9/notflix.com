<html lang="en">
  <head>
    <title></title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/request.css">
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
      session_start();
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
        <div class='main'>
          <h1>please submit your requested feature</h1>
          <h2>please provide any aditional details</h2>
          <div class='outdiv'>
            <form class='indiv' action='http://notflix.com/template/proccessfeat.php' method='post' id='featform'>
            <input type='hidden' name='uid' value='$uid'>
            <textarea name='feature' class='textbox'></textarea><br>
            <button type='submit' name='submit' class='textbutton'>Request</button>
            </form>
          </div>
      </div>
        ";
      } else { echo ('
        <div class="nologout">
          <div class="nologin">
            <h1>Sorry, You need to login first</h1>
            <p><a href="http://notflix.com/accounts/login.php">Log in</a> or <a href="http://notflix.com/accounts/signup.php">sign up</a></p>
          </div>
        </div>
      ');
      }
       ?>
    </main>
    <footer>
      <?php
        include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
  </body>
</html>
