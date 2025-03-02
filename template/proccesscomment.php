<?php
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "INSERT INTO Comments (AccountID, SeriesID, Content)
        VALUES (?, ?, ?)";
$stmt = $conn->stmt_init();
if ( ! $stmt->prepare($sql)) {
    die("SQL error: " . $mysqli->error);
}
$stmt->bind_param("sss",
                  htmlspecialchars($_POST['uid']),
                  htmlspecialchars($_POST['sid']),
                  htmlspecialchars($_POST['message']));
if ($stmt->execute()) {
    header("Location: ".htmlspecialchars($_POST['url']));
    exit;
} else {die($mysqli->error . " " . $mysqli->errno);}
?>
