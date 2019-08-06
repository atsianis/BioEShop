// PENDING ORDERS
// http://localhost:8084/BioEShop/admin/api/orders/pending
// https://api.myjson.com/bins/tjez1

// DONE ORDERS
// http://localhost:8084/BioEShop/admin/api/orders/done
// https://api.myjson.com/bins/6z359

// ID of ORDER
// http://localhost:8084/BioEShop/admin/api/orders/{ID}
// https://api.myjson.com/bins/1d8v3h


const EcoShopApp = angular.module("App", []);
EcoShopApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

function MainCtrl($scope, $http) {
    $scope.custom = true;
    

    window.addEventListener("load", handleWindowLoad);

    /* Parsing the URL to find if it's for pending, done or id of order*/
    function handleWindowLoad() {
        const URL = "http://localhost:8084/BioEShop/user/api/orders";

        $http.get(URL).then(handleJson);

        function handleJson(response) {
            $scope.orders = response.data.orders;
        }
    }
    }


