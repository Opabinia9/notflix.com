    function seasonMenu() {
        const seasonSelector = document.getElementById("seasonSelector");
        seasonSelector.classList.toggle("show");
    }

    // Close the seasonSelector if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.seasonSelector')) {
            const seasonSelector = document.getElementById("seasonSelector");
            if (seasonSelector.classList.contains('show')) {
                seasonSelector.classList.remove('show');
            }
        }
    };
