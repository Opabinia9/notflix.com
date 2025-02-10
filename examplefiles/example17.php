<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>web</title>
  </head>
  <body>

      <form action="example17.php" method="get">
        Name: <input type="text" name="name">
        <input type="submit">
      </form>
      <br>
      <?php
      echo $_GET["name"]
       ?>

  </body>
</html>
