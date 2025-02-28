<video id="videoPlayer" controls>
    <source src="your-video-file.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<script>
    const videoPlayer = document.getElementById("videoPlayer");

    videoPlayer.addEventListener("loadedmetadata", function() {
        // Set the playback position to 30 seconds
        videoPlayer.currentTime = 30;
    });

    // Debugging: Check current time
    videoPlayer.addEventListener("timeupdate", function() {
        console.log("Current Time: ", videoPlayer.currentTime);
    });
</script>
