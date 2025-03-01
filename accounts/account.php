<?php
session_start();
if (isset($_SESSION["user_id"])) {
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM users
            WHERE AccountID = {$_SESSION["user_id"]}";
    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
}
?>
<html lang="en">
  <head>
    <title>Account</title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/accountpg.css">

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
      <?php if (isset($user)): ?>
        <div class="yeslogout">
          <div class="yeslogin">
            <p>Hello <?= htmlspecialchars($user["Username"]) ?></p>
            <p><a href="http://notflix.com/accounts/logout.php">Log out</a></p>
          </div>
        </div>
      <?php else: ?>
        <div class="nologout">
          <div class="nologin">
            <h1>Sorry, You need to login first</h1>
            <p><a href="http://notflix.com/accounts/login.php">Log in</a> or <a href="http://notflix.com/accounts/signup.php">sign up</a></p>
          </div>
        </div>
      <?php endif; ?>
    </main>
    <footer>
      <?php
        include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
  </body>
</html>
