(function() {
  "use strict";
  app.controller("postCtrl",["$scope", "$http", "$compile", function($scope, $http, $compile){

      $scope.setup = function(){
        $scope.activeId = gon.post.id;
        $scope.activeStat1 = gon.stats[0]
        $scope.activeStat2 = gon.stats[1]
        $scope.activeStat3 = gon.stats[2]
        $scope.activeStat4 = gon.stats[3]
        $http.get('../api/v1/posts/' + $scope.activeId + '.json').then(function(response){
          $scope.post = response.data;
          console.log($scope.post);
        });
      };

      $scope.getNextPost = function(thisPostPath){

        $http.get(thisPostPath).then(function(response){
          $scope.nextPost = response.data;
          $scope.activeId = $scope.nextPost.id
          $scope.activeStat1 = $scope.nextPost.stat_1
          $scope.activeStat2 = $scope.nextPost.stat_2
          $scope.activeStat3 = $scope.nextPost.stat_3
          $scope.activeStat4 = $scope.nextPost.stat_4
          console.log($scope.nextPost);

          var oldElement = angular.element(document.querySelector('#touchsurface2'));

          oldElement.remove();

          var newElement = "<div id='touchsurface2' class='jumbotron view-post box' style='display: block; width: 95%; max-width: 900px;'><div id='inner'><h1>{{nextPost.text}}</h1></div><div class='flags' style='display: inline-block'; float: right;><i class='fa fa-chevron-circle-down fa-2x'></i><i class='fa fa-chevron-circle-up fa-2x'></i><i class='fa fa-chevron-circle-left fa-2x'></i><i class='fa fa-chevron-circle-right fa-2x'></i><i class='fa fa-flag fa-2x'></i></div></div>"

          $('body').append($compile(newElement)($scope).fadeIn());
        });
      };

      $(document).keydown(function(e){
          switch (e.which){
          case 37:    //left arrow key
              $(".box").animate({
                  backgroundColor: '#ff0004',
                  left: "-=1500"
              }, 500, function(){$scope.getNextPost("/posts/" + $scope.activeId + "?annoyed=id")});
              $(".stat-box .value").html($scope.activeStat4 + "%");
              $(".stat-box").css('color', '#E08484');
              $(".stat-box .value").append('<img src="/assets/4.png" >');
              // document.location = "/posts/" + idString + "?annoyed=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?annoyed=id");

              break;
          case 38:    //up arrow key
              $(".box").animate({
                  backgroundColor: '#02f90e',
                  top: "-=1500"
              }, 500, function(){$scope.getNextPost("/posts/" + $scope.activeId + "?excited=id")});
              $(".stat-box .value").html($scope.activeStat1 + "%");
              $(".stat-box").css('color', '#70C04B');
              $(".stat-box .value").append('<img src="/assets/1.png" >');
              // document.location = "/posts/" + idString + "?excited=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?excited=id");
              break;
          case 39:    //right arrow key
              $(".box").animate({
                  backgroundColor: '#fc6635',
                  left: "+=2000"
              }, 500, function(){$scope.getNextPost("/posts/" + $scope.activeId + "?amused=id")});
              $(".stat-box .value").html($scope.activeStat2 + "%");
              $(".stat-box").css('color', '#F8AF46');
              $(".stat-box .value").append('<img src="/assets/2.png" >');
              // document.location = "/posts/" + idString + "?amused=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?amused=id");
              break;
          case 40:    //bottom arrow key
              $(".box").animate({
                  backgroundColor: '#02c8ff',
                  top: "+=1500"
              }, 500, function(){$scope.getNextPost("/posts/" + $scope.activeId + "?sympathetic=id")});
              $(".stat-box .value").html($scope.activeStat3 + "%");
              $(".stat-box").css('color', '#2EC6DC');
              $(".stat-box .value").append('<img src="/assets/3.png" >');
              // document.location = "/posts/" + idString + "?sympathetic=id";
              // $scope.getNextPost("/posts/" + $scope.activeId + "?sympathetic=id");
              break;
          }
      });


      

      window.scope = $scope; 
    }]);
}());