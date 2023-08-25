// app/assets/javascripts/review_modal.js
document.addEventListener('DOMContentLoaded', function () {
    const stars = document.querySelectorAll('.star');
    const ratingElement = document.querySelector('#rating'); // Get the rating element

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const count = countStars();
            setRating(count, ratingElement); // Pass the rating element to setRating
        });
    });

    function countStars() {
        const stars = document.querySelectorAll('.stars input[type="radio"]');
        let checked = null;
        stars.forEach(star => {
            if (star.checked) {
                checked = star.className.split('-')[1];
            }
        });
        return checked;
    }


    function setRating(count, element) {
        element.value = count;
    }
});
