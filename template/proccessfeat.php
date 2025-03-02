<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "INSERT INTO Features (AccountID, Feature)
        VALUES (?, ?)";
$stmt = $conn->stmt_init();
if ( ! $stmt->prepare($sql)) {
    die("SQL error: " . $mysqli->error);
}
$stmt->bind_param("ss",
                  $_POST['uid'],
                  $_POST['feature']);
if ($stmt->execute()) {
    header("Location: http://notflix.com/accounts/account.php");
    exit;
} else {die($mysqli->error . " " . $mysqli->errno);}
?>
