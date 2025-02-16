<?php
echo '
<label class="episode">
<input type="radio" name="selectedepisode" value="'.$EpisodeID.'"';
if($EpisodeID == $selectedep){echo "checked";};
echo '
required onchange="this.form.submit()">
<div class="eplable">Ep '.$EpisodeID.': '.$title.'</div>
</label>
';
 ?>
