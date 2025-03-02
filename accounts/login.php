<?php
$is_invalid = false;
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  include($_SERVER["DOCUMENT_ROOT"] . "/template/dbconnect.php");
    $sql = sprintf("SELECT * FROM Users
                    WHERE Username = '%s'",
                   $conn->real_escape_string($_POST["username"]));
    $result = $conn->query($sql);
    $user = $result->fetch_assoc();
    if ($user) {
        $saltedPassword = $user["Salt"] . htmlspecialchars($_POST["password"]);
        if (password_verify($saltedPassword, $user["Password_hash"])) {
            session_start();
            session_regenerate_id();
            $_SESSION["user_id"] = $user["AccountID"];
            header("Location: http://notflix.com/index.php");
            exit;
        }
    }
    $is_invalid = true;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Login</h1>
    <?php if ($is_invalid): ?>
        <em>Invalid login</em>
    <?php endif; ?>
    <form method="post">
        <label for="username">username</label>
        <input type="username" name="username" id="username"
               value="<?= htmlspecialchars($_POST["username"] ?? "") ?>">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <button>Log in</button>
    </form>
</body>
</html>
