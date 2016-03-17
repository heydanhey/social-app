$('#flashModal').modal({ show: false})

// document.onkeydown = function(e) {
//     var idNumber = gon.post.id;
//     var idString = idNumber.toString();
//     switch (e.keyCode) {
//         case 37:
//             //alert(idString);
//             document.location = "/posts/" + idString + "?annoyed=id";
//             break;
//         case 38:
//             // alert('up');
//             document.location = "/posts/" + idString + "?excited=id";
//             break;
//         case 39:
//             // alert('right');
//             document.location = "/posts/" + idString + "?amused=id";
//             break;
//         case 40:
//             // alert('down');
//             document.location = "/posts/" + idString + "?sympathetic=id";
//             break;
//     }
// };


// var animateThis = function() {
//     $(".box").stop().animate({backgroundColor: '#ff0004'}, 500);
//     $(".box").animate({backgroundColor: '#ff0004'}, 500);
// }


$(document).ready(function(e){
    $(".box").fadeIn();
    $(".create-post").fadeIn();
    $(".user").fadeIn();
    $(".stat-box").fadeIn(500);
});


// $(document).keydown(function(e){
//     var idNumber = gon.post.id;
//     var stats = gon.stats;
//     var idString = idNumber.toString();
//     switch (e.which){
//     case 37:    //left arrow key
//         $(".box").finish().animate({
//             backgroundColor: '#ff0004',
//             left: "-=1500"
//         });
//         $(".stat-box .value").html(stats[3] + "%");
//         $(".stat-box").css('color', '#E08484');
//         $(".stat-box .value").append('<img src="/assets/4.png" >');
//         // document.location = "/posts/" + idString + "?annoyed=id";
//         angular.element(document.getElementById('postCtrl')).scope().getNextPost("/posts/" + idString + "?annoyed=id");
//         break;
//     case 38:    //up arrow key
//         $(".box").finish().animate({
//             backgroundColor: '#02f90e',
//             top: "-=1500"
//         });
//         $(".stat-box .value").html(stats[0] + "%");
//         $(".stat-box").css('color', '#70C04B');
//         $(".stat-box .value").append('<img src="/assets/1.png" >');
//         // document.location = "/posts/" + idString + "?excited=id";
//         break;
//     case 39:    //right arrow key
//         $(".box").finish().animate({
//             backgroundColor: '#fc6635',
//             left: "+=2000"
//         }, 500);
//         $(".stat-box .value").html(stats[1] + "%");
//         $(".stat-box").css('color', '#F8AF46');
//         $(".stat-box .value").append('<img src="/assets/2.png" >');
//         // document.location = "/posts/" + idString + "?amused=id";
//         break;
//     case 40:    //bottom arrow key
//         $(".box").finish().animate({
//             backgroundColor: '#02c8ff',
//             top: "+=1500"
//         });
//         $(".stat-box .value").html(stats[2] + "%");
//         $(".stat-box").css('color', '#2EC6DC');
//         $(".stat-box .value").append('<img src="/assets/3.png" >');
//         // document.location = "/posts/" + idString + "?sympathetic=id";
//         break;
//     }
// });






// var animateThis = function(e, direction) {
//     var idNumber = gon.post.id;
//     var stats = gon.stats;
//     var idString = idNumber.toString();
//     switch (direction){
//     case 'left':    //left arrow key
//         $(".box").finish().animate({
//             left: "-=1500",
//             // backgroundColor: '#ff0004'
//         });
//         $(".stat-box .value").html(stats[3]);
//         document.location = "/posts/" + idString + "?annoyed=id";
//         break;
//     case 'up':    //up arrow key
//         $(".box").finish().animate({
//             top: "-=1500",
//             // backgroundColor: '#02f90e'
//         });
//         $(".stat-box .value").html(stats[0]);
//         document.location = "/posts/" + idString + "?excited=id";
//         break;
//     case 'right':    //right arrow key
//         $(".box").finish().animate({
//             left: "+=1500",
//             // backgroundColor: '#fc6635'
//         });
//         $(".stat-box .value").html(stats[1]);
//         document.location = "/posts/" + idString + "?amused=id";
//         break;
//     case 'down':    //bottom arrow key
//         $(".box").finish().animate({
//             top: "+=1500",
//             // backgroundColor: '#02c8ff'
//         });
//         $(".stat-box .value").html(stats[2]);
//         document.location = "/posts/" + idString + "?sympathetic=id";
//         break;
//     }
// }












// function swipedetect(el, callback){
  
//     var touchsurface = el,
//     swipedir,
//     startX,
//     startY,
//     distX,
//     distY,
//     threshold = 150, //required min distance traveled to be considered swipe
//     restraint = 100, // maximum distance allowed at the same time in perpendicular direction
//     allowedTime = 300, // maximum time allowed to travel that distance
//     elapsedTime,
//     startTime,
//     handleswipe = callback || function(swipedir){}
  
//     touchsurface.addEventListener('touchstart', function(e){
//         var touchobj = e.changedTouches[0]
//         swipedir = 'none'
//         dist = 0
//         startX = touchobj.pageX
//         startY = touchobj.pageY
//         startTime = new Date().getTime() // record time when finger first makes contact with surface
//         e.preventDefault()
//     }, false)
  
//     touchsurface.addEventListener('touchmove', function(e){
//         e.preventDefault() // prevent scrolling when inside DIV
//     }, false)
  
//     touchsurface.addEventListener('touchend', function(e){
//         var touchobj = e.changedTouches[0]
//         distX = touchobj.pageX - startX // get horizontal dist traveled by finger while in contact with surface
//         distY = touchobj.pageY - startY // get vertical dist traveled by finger while in contact with surface
//         elapsedTime = new Date().getTime() - startTime // get time elapsed
//         if (elapsedTime <= allowedTime){ // first condition for swipe met
//             if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint){ // 2nd condition for horizontal swipe met
//                 swipedir = (distX < 0)? 'left' : 'right' // if dist traveled is negative, it indicates left swipe
//             }
//             else if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint){ // 2nd condition for vertical swipe met
//                 swipedir = (distY < 0)? 'up' : 'down' // if dist traveled is negative, it indicates up swipe
//             }
//         }
//         handleswipe(swipedir)
//         e.preventDefault()
//     }, false)
// }

// window.addEventListener('load', function(){
//     var idNumber = gon.post.id;
//     var idString = idNumber.toString();
//     var el = document.getElementById('touchsurface2')
//     var inner = document.getElementById('inner')
//     var hidetimer = null
//     swipedetect(el, function(swipedir){
//         if (swipedir != 'none'){
//             clearTimeout(hidetimer)
//             // alert("SWIPE detected!");
//             switch (swipedir) {
//         case "left":
//             //alert(idString);
//             animateThis(el, 'left');
//             // document.location = "/posts/" + idString + "?annoyed=id";
//             // break;
//         case "up":
//             // alert('up');
//             animateThis(el, 'up');
//             // document.location = "/posts/" + idString + "?excited=id";
//             // break;
//         case "right":
//             // alert('right');
//             animateThis(el, 'right');
//             // document.location = "/posts/" + idString + "?amused=id";
//             // break;
//         case "down":
//             // alert('down');
//             animateThis(el, 'down');
//             // document.location = "/posts/" + idString + "?sympathetic=id";
//             // break;
//     }
//             // hidetimer = setTimeout(function(){ // reset background image after 1 second
//             //     inner.style.background = ''
//             // }, 1000)
//         }
//     })
// }, false)








// window.addEventListener('load', function(){
//     var mousePosition;
//     var offset = [0,0];
//     var startCoords = [0,0];
//     var div;
//     var isDown = false;

//     div = document.getElementById('touchsurface2');

//     div.addEventListener('mousedown', function(e) {
//         isDown = true;
//         offset = [
//             div.offsetLeft - e.clientX,
//             div.offsetTop - e.clientY
//         ];
//         startCoords = [
//             e.clientX,
//             e.clientY
//         ];

//     }, true);

//     document.addEventListener('mouseup', function() {
//         isDown = false;
//     }, true);

//     document.addEventListener('mousemove', function(event) {
//         event.preventDefault();
//         if (isDown) {
//             mousePosition = {
        
//                 x : event.clientX,
//                 y : event.clientY
        
//             };
//             // console.log(startCoords);
//             // console.log(mousePosition);



//             div.style.top  = (mousePosition.y + offset[1]) + 'px';

//             div.style.left = (mousePosition.x + offset[0]) + 'px';


//             if (mousePosition.x > (startCoords[0]+300)) {
//                 animateThis(div, 'right');
//                 console.log("MOVE RIGHT");
//             };
//             if (mousePosition.x < (startCoords[0]-300)) {
//                 animateThis(div, 'left');
//                 console.log("MOVE LEFT");
//             };
//             if (mousePosition.y > 200) {
//                 animateThis(div, 'down');
//                 console.log("MOVE DOWN");
//             };
//             if (mousePosition.y < (-10)) {
//                 animateThis(div, 'up');
//                 console.log("MOVE UP");
//             };


//         }
//     }, true);
// });

//dropdown




