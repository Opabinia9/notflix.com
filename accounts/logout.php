<?php
session_start();
session_destroy();
header("Location: http://notflix.com/index.php");
exit;
