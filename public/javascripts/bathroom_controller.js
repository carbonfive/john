window.john.controllers.BathroomController = function($scope, $resource) {
  var BathroomResource = $resource('/bathroom');
  setInterval(function() {
    var bathroom = BathroomResource.get({}, function () {
      if (bathroom.occupied) {
        $scope.currentStatus = 'occupied';
      } else {
        $scope.currentStatus = 'not-occupied';
      }
    });
  }, 2000);
};
