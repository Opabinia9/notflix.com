<?php
if (empty($_POST["name"])) {
    die("Name is required");
}
if (strlen($_POST["password"]) < 8) {
    die("Password must be at least 8 characters");
}
if (!preg_match("/[a-z]/i", $_POST["password"])) {
    die("Password must contain at least one letter");
}
if ( ! preg_match("/[0-9]/", $_POST["password"])) {
    die("Password must contain at least one number");
}
if ($_POST["password"] !== $_POST["password_confirmation"]) {
    die("Passwords must match");
}
$salt = random_bytes(16);
$saltedPassword = $salt . $_POST["password"];
$password_hash = password_hash($saltedPassword, PASSWORD_DEFAULT);
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "INSERT INTO Users (Username, Password_hash, DateCreated, Salt)
        VALUES (?, ?, ?, ?)";
$stmt = $conn->stmt_init();
if ( ! $stmt->prepare($sql)) {
    die("SQL error: " . $mysqli->error);
}
$DateCreated = date("Y-m-d");
$stmt->bind_param("ssss",
                  $_POST["name"],
                  $password_hash,
                  $DateCreated,
                  $salt);
if ($stmt->execute()) {
    header("Location: http://notflix.com/accounts/signup-success.html");
    exit;
} else {
    if ($mysqli->errno === 1062) {
        die("email already taken");
    } else {
        die($mysqli->error . " " . $mysqli->errno);
    }
}
