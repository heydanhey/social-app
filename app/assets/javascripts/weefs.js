$(document).ready(initGallery);
function initGallery() {
  $('.gallery').touchSlider(
    mode: 'index',
    single: true,
    prevLink: 'a.prev',
    nextLink: 'a.next'

    );
}

