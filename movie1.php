<html lang="en" class="moviepage">
  <head>
    <title>The X-files</title>
    <link rel="icon" type="image/x-icon" href="imgs\Notflix Logo 7.png">
    <meta charset="UTF-8">
    <meta name="descrpittion" content="move1">
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
    <main>
      <?php
      echo ('
        <video poster="imgs/thexfiles.jpg" src="videos\examplemovie.mp4" controls>Sad Face :(</video>
        <br/>
        <br/>
        <br/>
        <br/>
          <div class="mpouterdiv">
            <div class="mpmiddiv">
              <hr/>
              <div class="mpinnerdiv">
                <div class="mpleftdiv"><img src="imgs/xfiles.jpg"></img></div>
                <div class="mprightdiv">
                  <div class="mptitlediv"><h2>The X-Files</h2></div>
                  <div class="mptriplediv">
                    <div class="mphd"><h6>HD</h6></div>
                    <div class="mprating"><h6>6.5</h6></div>
                    <div class="mptime"><h6>91 min</h6></div>
                  </div>
                  <div class="mpdescriptiondiv"><p>The exploits of FBI Special Agents Fox Mulder and Dana Scully who investigate X-Files: marginalized, unsolved cases involving paranormal phenomena. Mulder believes in the existence of aliens and the paranormal while Scully, a skeptic, is assigned to make scientific analyses of Mulder\'s discoveries that debunk Mulder\'s work and thus return him to mainstream cases.</p></div>
                </div>
              </div>
            </div>
          </div>
          ')
         ?>
    </main>
    <footer>
      <?php
      include 'footer.php';
       ?>
    </footer>
    </body>
    </html>
