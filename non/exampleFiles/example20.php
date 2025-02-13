<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>web</title>
  </head>
  <body>
      <form action="example20.php" method="post">
        <input type="checkbox" name="fruits[]" value="apples">
        <input type="checkbox" name="fruits[]" value="pear">
        <input type="checkbox" name="fruits[]" value="banana">

        <input type="submit">
      </form>

      <?php
      $fruits = $_POST["fruits"];
       ?>

  </body>
</html>
