<html>
  <link rel="stylesheet" type="text/css" href="http://notflix.com/css/navbar.css">
  <script src="http://notflix.com/js/navbar.js"></script>
  <button class="hamburger" onclick="toggleMenu()">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
  </button>
  <button class="home-button"><a href="http://notflix.com/index.php"><img src="http://notflix.com/imgs/notflixnav.png" alt="Home"></img></a></button>
<form method="POST" action="http://notflix.com/search.php" id="fitlers" class="search-container">
    <input type="text" placeholder="Search..." name="searchTerm">
    <button type="submit">Search</button>
</form>

<button class="watchlist-button" onclick="window.location.href='http://notflix.com/accounts/watchlist.php';">Watchlist</button>
<button class="account-button" onclick="window.location.href='http://notflix.com/accounts/account.php';">Account</button>
  <div id="dropdown" class="dropdown-content">
      <a href="#link1">Request</a>
      <a href="#link2">Report</a>
      <a href="#link3">Message</a>
  </div>
</html>
