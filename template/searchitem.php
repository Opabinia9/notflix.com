<?php
$link = "http://notflix.com/$type/$SeriesID.php";
echo '
<div class="catmovie" onclick="window.location=\''.$link.'\'">
  <div class="catposter"><img src="'.$poster.'"></img></div>
  <div class="catdeat">
    <div class="catname">'.$title.'</div>
  </div>
  <div class="catdeat">
    <div class="catyear">'.$releaseyear.'</div>
    <div class="catlength">'.$length.'</div>
    <div class="cattype">'.$type.'</div>
    <div class="catavailable" style="background-color:'.$avstat.'"></div>
  </div>
</div>
';
 ?>
