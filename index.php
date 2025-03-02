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
    <title>Notflix.com</title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="netflix but not">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
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
      // TODO:404 page, drop .php, check for htmlspecialchars, request, report, message
       ?>
      <h1 style="color:red; text-align:center;">
        Notflix
      </h1>
      <hr/>
      <p style="text-align: center; font-family: courier;">Welcome to notflix an offline streaming service just for us</p>
      <article>
        <section style="color:red; text-align: center;">
          <h2><b>Coming soon</b></h2>
        </section>
        <section style="text-align: center; font-family: Courier;">to the middle of nowhere near you</section>
        <br/>
        <section style="text-align: center;">
          <?php if (isset($user)): ?>
              <p>Hello <?= htmlspecialchars($user["Username"]) ?></p>
              <p><a href="http://notflix.com/accounts/logout.php">Log out</a></p>
          <?php else: ?>
              <p><a href="http://notflix.com/accounts/login.php">Log in</a> or <a href="http://notflix.com/accounts/signup.php">sign up</a></p>
          <?php endif; ?>
        </section>
      </article>
      <br/>
    </main>
    <footer>
      <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
  </body>
</html>
