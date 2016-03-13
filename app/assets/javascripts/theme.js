    //Slideup and slidedown
      $(document).ready(function(){
        
        $(".ui-head a").click(function(e){
          e.preventDefault();
          var content = $(".ui-content");
          if(content.hasClass("open")){
            content.removeClass("open");
            content.slideUp(300);
          }
          else{
            content.slideDown(300);
            content.addClass("open");
          }
          });
        });