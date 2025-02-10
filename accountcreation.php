<html lang="en">
  <head>
    <title>account</title>
    <link rel="icon" type="image/x-icon" href="imgs\Notflix Logo 7.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/general.css">
  </head>
  <body>
    <header>
      <nav>
      <?php
        include 'navbar.php';
       ?>
     </nav>
    </header>
    <main class="acountcb">
      <form class="acountcreate" action="">
        <div class="acountctitle">Create you account</div>
        <div class="acountcemail">Email<br/><input type="email"/></div>
        <div class="acountcusername">Username<br/><input type="username"/></div>
        <div class="acountcpassword">Password<br/><input type="password"/></div>
        <div class="acountcconfim">Confirm password<br/><input type="password"/></div>
        <div class="acountcsubscribe"><input type="checkbox"/>Subscribe</div>
        <div class="acountcsubmit"><input type="submit" value="Submit"></div>
        <div class="acountctext"><hr/>By creating an acount, you agree to our Terms of service and privacy policy</div>
      </form>
    </main>
    <footer>
      <?php
      include 'footer.php';
       ?>
    </footer>
  </body>
</html>
