// $(document).ready(initGallery);
// function initGallery() {
//   $('.gallery').touchSlider(
//     mode: 'index',
//     single: true,
//     prevLink: 'a.prev',
//     nextLink: 'a.next'

//     );
// }

var elem = document.getElementById('mySwipe');
window.mySwipe = Swipe(elem, {
  // startSlide: 4,
  // auto: 3000,
  // continuous: true,
  // disableScroll: true,
  // stopPropagation: true,
  // callback: function(index, element) {},
  // transitionEnd: function(index, element) {}
});
