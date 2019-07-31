// https://api.myjson.com/bins/p87ml
// http://localhost:8084/BioEShop/api/products/cup

// https://api.myjson.com/bins/dwz4t
// http://localhost:8084/BioEShop/api/products/all

// https://api.myjson.com/bins/xzhxp
// http://localhost:8084/BioEShop/api/products/straw

// https://api.myjson.com/bins/z6d59
// http://localhost:8084/BioEShop/api/products/toothbrush


const EcoShopApp = angular.module("App", []);

// Βάζουμε το $http service component μέσα στον controller.
// Επειδή βάζουμε dependencies, πρέπει τώρα να δηλώσουμε όλα αυτά
// που θα χρησιμοποιήσουμε, άρα και το scope.
// CountryApp.controller("MainCtrl", MainCtrl);
EcoShopApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

function MainCtrl($scope, $http) {

    let cup = document.querySelector("#cups");
    let straw = document.querySelector("#straws");
    let tooth = document.querySelector("#tooth");
    // let priceInput = document.querySelector("#priceFilter");

    window.addEventListener("load", handleWindowLoad);
    cup.addEventListener("click", bringCups);
    straw.addEventListener("click", bringStraws);
    tooth.addEventListener("click", bringToothbrushes);
    // priceInput.addEventListener("submit", handlePriceFilter);

    /**
     * This method handles the fetch once the window loads. It checks if the
     * request comes by the path ../products/ or the path ../products/{id}.
     * In the first condition, fetches the URL ../products/api/all.
     * In the second condition, fecthes the URL ../products/api/{id}
     * @returns {undefined}
     */
    function handleWindowLoad() {
        let pathArray = window.location.pathname.split('/');
        let lastElementOfPath = pathArray[pathArray.length - 1];
        let pathFragment = "";
        if (lastElementOfPath === "") {
            pathFragment = "all";
        } else {
            pathFragment = lastElementOfPath;
        }

        const URL = "http://localhost:8084/BioEShop/products/api/" + pathFragment;

        $http.get(URL).then(handleJson);

        function handleJson(response) {
            $scope.products = response.data.products;
            $scope.categoryMessage = "Shoping eco products makes Pandas happy!";

            // creating custom filters for products
            $scope.colors = [];
            $scope.sizes = [];
            $scope.materials = [];
            createFilters($scope.products);
        }
    }

    function bringCups(e) {
        e.preventDefault();
        const URL = "http://localhost:8084/BioEShop/products/api/cup";
        $http.get(URL).then(handleJson);

        function handleJson(response) {
            $scope.products = response.data.products;
            $scope.categoryMessage = "Cups made by nature";
            // let prices = $scope.products.map(getPrices);
            // $scope.maxPrice = getMax(prices);

            // creating custom filters for products
            $scope.colors = [];
            $scope.sizes = [];
            $scope.materials = [];
            createFilters($scope.products);

        }
    }

    function bringStraws(e) {
        e.preventDefault();
        const URL = "http://localhost:8084/BioEShop/products/api/straw";

        $http.get(URL).then(handleJson);
        function handleJson(response) {
            $scope.products = response.data.products;
            $scope.categoryMessage = "No more plastic straws!";
            // let prices = $scope.products.map(getPrices);
            // $scope.maxPrice = getMax(prices);

            // creating custom filters for products
            $scope.colors = [];
            $scope.sizes = [];
            $scope.materials = [];
            createFilters($scope.products);
        }
    }

    function bringToothbrushes(e) {
        e.preventDefault();
        const URL = "http://localhost:8084/BioEShop/products/api/toothbrush";

        $http.get(URL).then(handleJson);
        function handleJson(response) {
            $scope.products = response.data.products;
            $scope.categoryMessage = "Shinny smiles, with these cool toothbrushes!";
            // let prices = $scope.products.map(getPrices);
            // $scope.maxPrice = getMax(prices);

            // creating custom filters for products
            $scope.colors = [];
            $scope.sizes = [];
            $scope.materials = [];
            createFilters($scope.products);
        }
    }

//    function getPrices(products) {
//        return products.price;
//    }
//
//    function getMax(prices) {
//        let max = 0;
//        prices.forEach(element => {
//            if (max < element) {
//                max = element;
//            }
//        });
//        return max;
//    }

    // function handlePriceFilter(){
    //    // $scope.maxPrice = getMax(prices);
    //     $scope.priceFilter = priceInput.value > $scope.maxPrice;
    //     priceInput.value = "";

    // }

    function capitalizeFirstLetter(string) {
        return string.toLowerCase().charAt(0).toUpperCase() + string.slice(1);
    }

    function createFilters(array) {
        $scope.colors.push("");
        $scope.sizes.push("");
        $scope.materials.push("");
        array.forEach(function (product) {
            let c = capitalizeFirstLetter(product.color);
            let s = capitalizeFirstLetter(product.size);
            let m = capitalizeFirstLetter(product.material);
            if (!($scope.colors.includes(c))) {
                $scope.colors.push(c);
                //console.log($scope.colors);
            }
            if (!($scope.sizes.includes(s))) {
                $scope.sizes.push(s);
                //console.log($scope.sizes);
            }
            if (!($scope.materials.includes(m))) {
                $scope.materials.push(m);
                //console.log($scope.materials);
            }
        });

    }





} 