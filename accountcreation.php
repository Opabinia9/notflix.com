<html lang="en">
  <head>
    <title>account</title>
    <link rel="icon" type="image/x-icon" href="imgs\notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="Create Acount">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/general.css">
    <link rel="stylesheet" type="text/css" href="css/accountcreation.css">
  </head>
  <body>
    <header>
      <nav>
      <?php
        include($_SERVER["DOCUMENT_ROOT"] . "/template/navbar.php");
       ?>
     </nav>
    </header>
    <main class="acountcb">
      <!-- <?php // TODO: fix item so centered and min heigth ?> -->
      <form class="acountcreate" action="">
        <div class="acountctitle">Create you account</div>
        <div class="acountcusername">Username<br/><input type="username"/></div>
        <div class="acountcpassword">Password<br/><input type="password"/></div>
        <div class="acountcconfim">Confirm password<br/><input type="password"/></div>
        <div class="acountcsubmit"><input type="submit" value="Submit"></div>
      </form>
    </main>
    <footer>
      <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
  </body>
</html>
