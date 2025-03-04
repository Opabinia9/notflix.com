<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "INSERT INTO requests (AccountID, Request)
        VALUES (?, ?)";
$stmt = $conn->stmt_init();
if ( ! $stmt->prepare($sql)) {
    die("SQL error: " . $mysqli->error);
}
$stmt->bind_param("ss",
                  htmlspecialchars($_POST['uid']),
                  htmlspecialchars($_POST['request']));
if ($stmt->execute()) {
    header("Location: http://notflix.com/accounts/account.php");
    exit;
} else {die($mysqli->error . " " . $mysqli->errno);}
?>
