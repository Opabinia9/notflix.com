<video id="videoPlayer" controls>
    <source src="http://notflix.com/videos/S1E1.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<script>

document.getElementById('videoPlayer').addEventListener('loadedmetadata', function() {
 this.currentTime = 120;
 console.log("Current Time: ase");
 console.log("Current Time: ", this.currentTime)
}, false);


    //const videoPlayer = document.getElementById("videoPlayer");

    //videoPlayer.addEventListener("loadedmetadata", function() {
        // Set the playback position to 30 seconds
    //    videoPlayer.currentTime = 30;
    //    console.log("Current Time: ase");
    //});

    // Debugging: Check current time
    //videoPlayer.addEventListener("timeupdate", function() {
    //    console.log("Current Time: ", videoPlayer.currentTime);
    //});
</script>
