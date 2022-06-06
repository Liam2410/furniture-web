function animateProgress(idProgressBar, percent) {
    const element = document.getElementById(idProgressBar);
    let width = 0;
    let id = setInterval(frame, 10);
    function frame() {
        if (width == percent) {
        clearInterval(id);
        } else {
        width++;
        element.style.width = width + '%';
        }
    }
}

function displayProgressBar(idProgressBar, percent) {
    const element = document.getElementById(idProgressBar);
    element.style.width = percent + '%';
}