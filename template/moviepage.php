<?php
  include($_SERVER["DOCUMENT_ROOT"] . "/template/moviedbq.php");
 ?>
 <html lang="en" class="moviepage">
  <head>
    <title><?php echo $title; ?></title>
    <link rel="icon" type="image/x-icon" href="http://notflix.com/imgs/notflixico.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="movie1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/general.css">
    <link rel="stylesheet" type="text/css" href="http://notflix.com/css/moviepage.css">
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
      echo ('
        <video poster='.$poster.' src='.$URL.' controls>Sad Face :(</video>
        <br/>
        <br/>
        <br/>
        <br/>
          <div class="mpouterdiv">
            <div class="mpmiddiv">
              <hr/>
              <div class="mpinnerdiv">
                <div class="mpleftdiv"><img src='.$poster.'></img></div>
                <div class="mprightdiv">
                  <div class="mptitlediv"><h2>'.$title.'</h2></div>
                  <div class="mptriplediv">
                    <div class="mpavailable"><h6>'.$available.'</h6></div>
                    <div class="mpreleaseyear"><h6>'.$releaseyear.'</h6></div>
                    <div class="mplength"><h6>'.$length.'</h6></div>
                  </div>
                  <div class="mpdescriptiondiv"><p>'.$description.'</p></div>
                </div>
              </div>
            </div>
          </div>
          ');
       ?>
    </main>
    <footer>
      <?php
      include($_SERVER["DOCUMENT_ROOT"] . "/template/footer.php");
       ?>
    </footer>
    </body>
    </html>
