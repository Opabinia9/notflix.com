<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta name="descrpittion" content="Create Acount">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/accountcreation.css">
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
    <form class="acountcreate" action="http://notflix.com/accounts/process-signup.php" method="post" id="signup">
      <div class="acountctitle">Create you account</div>
      <div class="acountcusername"><br/>
        <label for="name">Username</label>
        <input  type="text" id="name" name="name"/>
      </div>
      <div class="acountcpassword"><br/>
        <label for="password">Password</label>
        <input type="password" id="password" name="password"/>
      </div>
      <div class="acountcconfim"><br/>
        <label for="password_confirmation">Confirm password</label>
        <input type="password" id="password_confirmation" name="password_confirmation"/>
      </div>
      <div class="acountcsubmit">
        <input type="submit" value="Sign up">
      </div>
    </main>
    <footer>
      <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
</body>
</html>
