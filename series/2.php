<?php
$topurl = $_SERVER['PHP_SELF'];
$SeriesID = (int) pathinfo(basename(__FILE__), PATHINFO_FILENAME);
include($_SERVER["DOCUMENT_ROOT"] . "/template/seriespage.php");
 ?>
