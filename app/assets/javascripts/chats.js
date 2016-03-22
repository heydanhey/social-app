//alert fadeouts
$(document).ready (function(){
   $(".alert").fadeTo(2000, 500).slideUp(500, function(){
       $(".alert").alert('close');
   });   
});

$(document).ready (function(){
   $(".alert-dismissible").fadeTo(2000, 500).slideUp(500, function(){
       $(".alert-dismissible").alert('close');
   });   
});

$(document).ready (function(){
   $(".alert-warning").fadeTo(2000, 500).slideUp(500, function(){
       $(".alert-warning").alert('close');
   });   
});

$(document).ready (function(){
   $(".alert-container").fadeTo(2000, 500).slideUp(500, function(){
       $(".alert-container").alert('close');
   });   
});