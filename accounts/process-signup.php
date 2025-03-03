<?php
    $username = htmlspecialchars($_POST["name"]);
    include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = "SELECT * FROM users WHERE AccountID = ?";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        die("SQL error: " . $stmt->error);
    }
    $stmt->bind_param("s", $username);
    if ($stmt->execute()) {
      $result = $stmt->get_result();
      $queryresults = mysqli_num_rows($result);
      if (!$queryresults > 0) {
        echo  "<script>alert('Username Unavailable');</script>";
        die("Username Unavailable");







    }
  }
echo "fsdfsdf<br>";
if (empty(htmlspecialchars($_POST["name"]))) {
    die("Name is required");
}
if (strlen(htmlspecialchars($_POST["password"])) < 8) {
    die("Password must be at least 8 characters");
}
if (!preg_match("/[a-z]/i", htmlspecialchars($_POST["password"]))) {
    die("Password must contain at least one letter");
}
if ( ! preg_match("/[0-9]/", htmlspecialchars($_POST["password"]))) {
    die("Password must contain at least one number");
}
if (htmlspecialchars($_POST["password"]) !== htmlspecialchars($_POST["password_confirmation"])) {
    die("Passwords must match");
}
$salt = random_bytes(16);
$saltedPassword = $salt . htmlspecialchars($_POST["password"]);
$password_hash = password_hash($saltedPassword, PASSWORD_DEFAULT);
include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
$sql = "INSERT INTO Users (Username, Password_hash, DateCreated, Salt)
        VALUES (?, ?, ?, ?)";
$stmt = $conn->stmt_init();
if (!$stmt->prepare($sql)) {
    die("SQL error: " . $stmt->error);
}
$name = htmlspecialchars($_POST["name"]);
$DateCreated = date("Y-m-d");
$stmt->bind_param("ssss", $name, $password_hash, $DateCreated, $salt);
if ($stmt->execute()) {
    header("Location: http://notflix.com/accounts/signup-success.html");
    exit;
} else {
    die($stmt->error . " " . $stmt->errno);
}
?>
