<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>web</title>
  </head>
  <body>

    <?php
      $variable = "dynamic";
      $variable = "not dynamic";
      echo strtolower("<h1>Website tests</h1>");
      echo strlen($variable);
      echo str_replace("not", "yes", $variable);
      echo substr($variable, 6, 4);
      echo "<p>this will be a variable called $variable</p>";
      echo "<hr>";
    ?>

  </body>
</html>
