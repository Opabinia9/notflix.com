<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>web</title>
  </head>
  <body>
      <form action="example19.php" method="post">
        <input type="password" name="password">
        <input type="submit">
      </form>

      <?php
      $arrayName = array(1,2,3,4,5);
        $arrayName[10] = "aasfadsf";
        echo count($arrayName);
        echo $arrayName[10];
        echo $_POST["password"];
       ?>

  </body>
</html>
