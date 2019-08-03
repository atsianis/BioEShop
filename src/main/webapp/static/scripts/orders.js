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
    $scope.alert = function (event, id) {
        event.preventDefault();
        let choise = confirm("Are you sure?");
        if (choise === true) {
            window.location.href = 'http://localhost:8084/BioEShop/admin/order/delete/' + id;
        }
    }

    window.addEventListener("load", handleWindowLoad);

    /* Parsing the URL to find if it's for pending, done or id of order*/
    function handleWindowLoad() {
        let pathArray = window.location.pathname.split('/');
        console.log(pathArray);
        let lastElementOfPath = pathArray[pathArray.length - 1];
        let pathFragment = "";
        if (lastElementOfPath === "pending") {
            pathFragment = "pending";
            //pathFragment = "tjez1";
        } else if (lastElementOfPath === "done") {
            pathFragment = "done";
            //pathFragment = "6z359";
        } else {
            pathFragment = lastElementOfPath;
            //pathFragment = "1d8v3h";
        }
        console.log("URL to fetch: http://localhost:8084/BioEShop/admin/api/orders/" + pathFragment);

        //const URL = "http://localhost:8084/BioEShop/admin/api/orders/"+pathFragment;
        const URL = "http://localhost:8084/BioEShop/admin/api/orders/" + pathFragment;

        $http.get(URL).then(handleJson);

        function handleJson(response) {
            $scope.orders = response.data.orders;
            console.log($scope.orders[0].orderId);
        }
    }
}