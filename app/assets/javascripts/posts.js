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
