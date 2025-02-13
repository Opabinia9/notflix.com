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
      // // TODO: ADD SEARCH SYSTEM, MAKE SEARCH BAR FUNCTIOAL, SERIES PAGE, ADD ACCOUNTS, comment section
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
          <a href="http://notflix.com/movielist1.php">explore</a>
          <a href="http://notflix.com/accountcreation.php">create acount</a>
          <a href="http://notflix.com/movies/001.php">movie</a>
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
