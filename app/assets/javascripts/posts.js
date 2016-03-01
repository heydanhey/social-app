document.onkeydown = function(e) {
    var idNumber = gon.post.id;
    var idString = idNumber.toString();
    switch (e.keyCode) {
        case 37:
            //alert(idString);
            document.location = "/posts/" + idString + "?annoyed=id";
            break;
        case 38:
            // alert('up');
            document.location = "/posts/" + idString + "?excited=id";
            break;
        case 39:
            // alert('right');
            document.location = "/posts/" + idString + "?amused=id";
            break;
        case 40:
            // alert('down');
            document.location = "/posts/" + idString + "?sympathetic=id";
            break;
    }
};

function swipedetect(el, callback){
  
    var touchsurface = el,
    swipedir,
    startX,
    startY,
    distX,
    distY,
    threshold = 150, //required min distance traveled to be considered swipe
    restraint = 100, // maximum distance allowed at the same time in perpendicular direction
    allowedTime = 300, // maximum time allowed to travel that distance
    elapsedTime,
    startTime,
    handleswipe = callback || function(swipedir){}
  
    touchsurface.addEventListener('touchstart', function(e){
        var touchobj = e.changedTouches[0]
        swipedir = 'none'
        dist = 0
        startX = touchobj.pageX
        startY = touchobj.pageY
        startTime = new Date().getTime() // record time when finger first makes contact with surface
        e.preventDefault()
    }, false)
  
    touchsurface.addEventListener('touchmove', function(e){
        e.preventDefault() // prevent scrolling when inside DIV
    }, false)
  
    touchsurface.addEventListener('touchend', function(e){
        var touchobj = e.changedTouches[0]
        distX = touchobj.pageX - startX // get horizontal dist traveled by finger while in contact with surface
        distY = touchobj.pageY - startY // get vertical dist traveled by finger while in contact with surface
        elapsedTime = new Date().getTime() - startTime // get time elapsed
        if (elapsedTime <= allowedTime){ // first condition for awipe met
            if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint){ // 2nd condition for horizontal swipe met
                swipedir = (distX < 0)? 'left' : 'right' // if dist traveled is negative, it indicates left swipe
            }
            else if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint){ // 2nd condition for vertical swipe met
                swipedir = (distY < 0)? 'up' : 'down' // if dist traveled is negative, it indicates up swipe
            }
        }
        handleswipe(swipedir)
        e.preventDefault()
    }, false)
}

window.addEventListener('load', function(){
    var el = document.getElementById('touchsurface2')
    var inner = document.getElementById('inner')
    var hidetimer = null
    swipedetect(el, function(swipedir){
        if (swipedir != 'none'){
            clearTimeout(hidetimer)
            alert("SWIPE detected!");
            switch (swipedir) {
        case "left":
            //alert(idString);
            document.location = "/posts/" + idString + "?annoyed=id";
            break;
        case "up":
            // alert('up');
            document.location = "/posts/" + idString + "?excited=id";
            break;
        case "right":
            // alert('right');
            document.location = "/posts/" + idString + "?amused=id";
            break;
        case "down":
            // alert('down');
            document.location = "/posts/" + idString + "?sympathetic=id";
            break;
    }
            hidetimer = setTimeout(function(){ // reset background image after 1 second
                inner.style.background = ''
            }, 1000)
        }
    })
}, false)

