(function() {
  "use strict";
  app.controller("postCtrl",["$scope", "$http", "$compile", function($scope, $http, $compile){

      $scope.setup = function(){
        $scope.activeId = gon.post.id;
        $scope.activeStat1 = gon.stats[0];
        $scope.activeStat2 = gon.stats[1];
        $scope.activeStat3 = gon.stats[2];
        $scope.activeStat4 = gon.stats[3];
        $http.get('../api/v1/posts/' + $scope.activeId + '.json').then(function(response){
          $scope.post = response.data;
        });
      };

      $scope.getNextPost = function(thisPostPath){
        $http.get(thisPostPath).then(function(response){
          $scope.nextPost = response.data;
          $scope.activeId = $scope.nextPost.id;
          $scope.activeStat1 = $scope.nextPost.stat_1;
          $scope.activeStat2 = $scope.nextPost.stat_2;
          $scope.activeStat3 = $scope.nextPost.stat_3;
          $scope.activeStat4 = $scope.nextPost.stat_4;
          $scope.weefResponse = $scope.nextPost.weef_response;
          $scope.weefId = $scope.nextPost.weef_id;
          console.log($scope.weefResponse);

          var oldElement = angular.element(document.querySelector('#touchsurface2'));

          oldElement.remove();

          var newElement = "<div id='touchsurface2' class='jumbotron view-post box' style='display: block; width: 95%; max-width: 900px;'><div id='inner'><h1>{{nextPost.text}}</h1></div><div class='flags' style='display: inline-block'; float: left;><img src='/assets/1-sm.png' style='width:50px; height:50px;'><img src='/assets/2-sm.png' style='width:50px; height:50px;'><img src='/assets/3-sm.png' style='width:50px; height:50px;'><img src='/assets/4-sm.png' style='width:50px; height:50px;'></div></div>"

          var flash = "<div class='alert'><h1>YOU WEEF'D</h1></div>"

          if($scope.weefResponse){

            $('#flashModal').modal('show');

          };

          $('#touchsurface3').append($compile(newElement)($scope).fadeIn());
        });
      };


      //This is the js for the keymapping of arrows

      $(document).keydown(function(e){
          switch (e.which){
          case 37:    //left arrow key
              $('html body').animate({backgroundColor: '#E08484'},500);
              $(".box").animate({
                  left: "-=1500"
              }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?annoyed=id")});
              $(".stat-box .value").html($scope.activeStat4 + "%");
              $(".stat-box").css('color', '#E08484');
              $(".stat-box .value").append('<img src="/assets/4.png" >');
              // document.location = "/posts/" + idString + "?annoyed=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?annoyed=id");

              break;
          case 38:    //up arrow key
              $('html body').animate({backgroundColor: '#70C04B'},500);
              $(".box").animate({
                  top: "-=1500"
              }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?excited=id")});
              $(".stat-box .value").html($scope.activeStat1 + "%");
              $(".stat-box").css('color', '#70C04B');
              $(".stat-box .value").append('<img src="/assets/1.png" >');
              // document.location = "/posts/" + idString + "?excited=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?excited=id");
              break;
          case 39:    //right arrow key
              $('html body').animate({backgroundColor: '#F8AF46'},500);
              $(".box").animate({
                  left: "+=1500"
              }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?amused=id")});
              $(".stat-box .value").html($scope.activeStat2 + "%");
              $(".stat-box").css('color', '#F8AF46');
              $(".stat-box .value").append('<img src="/assets/2.png" >');
              // document.location = "/posts/" + idString + "?amused=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?amused=id");
              break;
          case 40:    //bottom arrow key
              $('html body').animate({backgroundColor: '#2EC6DC'},500);
              $(".box").animate({
                  top: "+=1500"
              }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?sympathetic=id")});
              $(".stat-box .value").html($scope.activeStat3 + "%");
              $(".stat-box").css('color', '#2EC6DC');
              $(".stat-box .value").append('<img src="/assets/3.png" >');
              // document.location = "/posts/" + idString + "?sympathetic=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?sympathetic=id");
              break;
          }
      });

      //This is the js for the touch controls

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
            var dist = 0
            console.log("start");
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
            if (elapsedTime <= allowedTime){ // first condition for swipe met
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
        // var idNumber = gon.post.id;
        // var idString = idNumber.toString();
        console.log("jst before")
        // var el = document.getElementById('touchsurface2')
        var el = document.querySelector('#touchsurface3');
        console.log(el)
        var inner = document.getElementById('inner')
        var hidetimer = null
        swipedetect(el, function(swipedir){
            if (swipedir != 'none'){
                clearTimeout(hidetimer)
                console.log("swipe detectd");
                switch (swipedir) {

            case "left":

                $(".stat-box .value").html($scope.activeStat4 + "%");
                $(".stat-box").css('color', '#E08484');
                $(".stat-box .value").append('<img src="/assets/4.png" >');

                $(".box").animate({
                  left: "-=1500"
                }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?annoyed=id")});

                break;

            case "up":

                $(".stat-box .value").html($scope.activeStat1 + "%");
                $(".stat-box").css('color', '#70C04B');
                $(".stat-box .value").append('<img src="/assets/1.png" >');

                $(".box").animate({
                  top: "-=1500"
                }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?excited=id")});

                break;

            case "right":

                $(".stat-box .value").html($scope.activeStat2 + "%");
                $(".stat-box").css('color', '#F8AF46');
                $(".stat-box .value").append('<img src="/assets/2.png" >');

                $(".box").animate({
                    left: "+=2000"
                }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?amused=id")});

                break;

            case "down":

                $(".stat-box .value").html($scope.activeStat3 + "%");
                $(".stat-box").css('color', '#2EC6DC');
                $(".stat-box .value").append('<img src="/assets/3.png" >');

                $(".box").animate({
                  top: "+=1500"
                }, 500, function(){$scope.getNextPost("/api/v1/posts/" + $scope.activeId + "?sympathetic=id")});

                break;
        }

            }
        })
    }, false)


      

      window.scope = $scope; 
    }]);
}());