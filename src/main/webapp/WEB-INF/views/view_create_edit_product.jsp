<%-- 
    Document   : view_create_edit_product
    Created on : Aug 4, 2019, 8:44:09 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>

        </style>

    </head>
    <body ng-app="App" ng-controller="MainCtrl" ng-cloak>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>


        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">
                ${act} Product
            </h1>

            <div class="container">
                <div class="row">
                    
                    <!-- ADD PRODUCT FORM -->
                    <form:form action="/BioEShop/admin/products/save" method="POST" modelAttribute="p" class="col-12">
                        <form:input type="hidden" path="productId" id="id"/>
                        <!-- Product title -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <label for="title" class="font-weight-bold text-success">Title of product</label>
                                    <form:input path="title" id="title" type="text" class="form-control" maxlength="200" required="true"/>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="description" class="font-weight-bold text-success">Description</label>
                                    <form:input path="descr" id="description" type="text" class="form-control" maxlength="200" required="true"/>
                                </div>
                            </div>
                        </div>
                        <!-- Product URL & Image -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <label for="path" class="font-weight-bold text-success">URL of image</label>
                                    <c:choose>
                                        <c:when test="${edit == true}">
                                            
                                            <input type="text" class="form-control" maxlength="200"
                                                    placeholder="Enter the URL of the product's image" 
                                                    value="${p.path}" readonly="true"/>
                                        </c:when>
                                    </c:choose>
                                        <form:input path="path" id="path" type="text" class="form-control" maxlength="200"
                                                    placeholder="Enter the URL of the product's image" 
                                                    ng-change="imagePreview()" ng-model="imageInput"
                                                    ng-value="${p.path}" required="true"/>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="preview" class="font-weight-bold text-success">Preview</label></br>
                                    <img class="mx-auto d-block" style="width:50%;" id="preview" src="{{url}}" alt="preview of product">
                                </div>
                            </div>
                        </div>
                        <!-- Stock, Price, Category -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-4">
                                    <label for="category" class="font-weight-bold text-success">Category</label>
                                    <c:choose>
                                        <c:when test="${edit == true}">
                                            
                                            <input id="categoryInit" type="text" class="form-control" maxlength="200" value="${p.category}" readonly="true"/>
                                        </c:when>
                                    </c:choose>
                                    <form:select path="category" id="category" class="form-control" 
                                                 ng-model="category" ng-change="categorySelector()" required="true">
                                        <form:option value=""></form:option>
                                        <form:option value="Cup">Cup</form:option>
                                        <form:option value="Straw">Straw</form:option>
                                        <form:option value="Toothbrush">Toothbrush</form:option>
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="stock" class="font-weight-bold text-success">Stock</label>
                                    <form:input path="stock" id="stock" type="number" class="form-control" maxlength="200" min="1" step="1" required="true"/>
                                </div>
                                <div class="col-4">
                                    <label for="price" class="font-weight-bold text-success">Price</label>
                                    <form:input path="price" id="price" type="number" class="form-control" maxlength="200" step="0.1" min="1" required="true"/>
                                </div>
                            </div>
                        </div>
                        <!-- Color, Size, Material -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-4">
                                    <label for="color" class="font-weight-bold text-success">Color</label>
                                    <c:choose>
                                        <c:when test="${edit == true}">
                                            <input type="text" class="form-control" maxlength="200" value="${p.color}" readonly="true"/>
                                        </c:when>
                                    </c:choose>
                                    <form:select path="color" id="color" class="form-control" ng-model="colors.model" required="true">
                                        <form:option value=""></form:option>
                                        <form:option ng-repeat="option in colors.availableOptions" value="{{option}}">{{option}}</form:option>
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="size" class="font-weight-bold text-success">Size</label>
                                    <c:choose>
                                        <c:when test="${edit == true}">  
                                            <input type="text" class="form-control" maxlength="200" value="${p.size}" readonly="true"/>
                                        </c:when>
                                    </c:choose>
                                    <form:select path="size" id="size" class="form-control" ng-model="sizes.model" required="true">
                                        <form:option value=""></form:option>
                                        <form:option ng-repeat="option in sizes.availableOptions" value="{{option}}">{{option}}</form:option>
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="material" class="font-weight-bold text-success">Material</label>
                                    <c:choose>
                                        <c:when test="${edit == true}">
                                            <input type="text" class="form-control" maxlength="200" value="${p.material}" readonly="true"/>
                                        </c:when>
                                    </c:choose>
                                    <form:select path="material" id="material" class="form-control" ng-model="materials.model" required="true">
                                        <form:option value=""></form:option>
                                        <form:option ng-repeat="option in materials.availableOptions" value="{{option}}">{{option}}</form:option>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <!-- Submit -->
                        <button type="submit" class="btn btn-success mx-auto d-block">${button}</button>
                    </form:form>

                </div>
            </div>

        </main>



        <footer></footer>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script>
    const EcoShopApp = angular.module("App", []);
    EcoShopApp.controller("MainCtrl", ['$scope', '$http', MainCtrl]);

    function MainCtrl($scope, $http) {

      let cupMaterials = ["Bamboo", "Steel", "Hard paper", "Wood"];
      let strawMaterials = ["Bamboo", "Steel", "Hard paper", "Glass"];
      let toothbrushMaterials = ["Bamboo", "Wood", "Plant-based plastic"];

      let cupSizes = ["100ml", "200ml", "250ml", "400ml", "500ml", "750ml", "1000ml"];
      let strawSizes = ["3'", "5'", "7'"];
      let toothbrushSizes = ["Kids", "Adults", "Pocket-size"];

      $scope.colors = {
        model: null,
        availableOptions: ["AliceBlue", "AntiqueWhite", "Aqua", "Aquamarine", "Azure", "Beige", "Bisque", "Black", "BlanchedAlmond", "Blue", "BlueViolet", "Brown", "BurlyWood", "CadetBlue", "Chartreuse", "Chocolate", "Coral", "CornflowerBlue", "Cornsilk", "Crimson", "Cyan", "DarkBlue", "DarkCyan", "DarkGoldenRod", "DarkGray", "DarkGrey", "DarkGreen", "DarkKhaki", "DarkMagenta", "DarkOliveGreen", "DarkOrange", "DarkOrchid", "DarkRed", "DarkSalmon", "DarkSeaGreen", "DarkSlateBlue", "DarkSlateGray", "DarkSlateGrey", "DarkTurquoise", "DarkViolet", "DeepPink", "DeepSkyBlue", "DimGray", "DimGrey", "DodgerBlue", "FireBrick", "FloralWhite", "ForestGreen", "Fuchsia", "Gainsboro", "GhostWhite", "Gold", "GoldenRod", "Gray", "Grey", "Green", "GreenYellow", "HoneyDew", "HotPink", "IndianRed", "Indigo", "Ivory", "Khaki", "Lavender", "LavenderBlush", "LawnGreen", "LemonChiffon", "LightBlue", "LightCoral", "LightCyan", "LightGoldenRodYellow", "LightGray", "LightGrey", "LightGreen", "LightPink", "LightSalmon", "LightSeaGreen", "LightSkyBlue", "LightSlateGray", "LightSlateGrey", "LightSteelBlue", "LightYellow", "Lime", "LimeGreen", "Linen", "Magenta", "Maroon", "MediumAquaMarine", "MediumBlue", "MediumOrchid", "MediumPurple", "MediumSeaGreen", "MediumSlateBlue", "MediumSpringGreen", "MediumTurquoise", "MediumVioletRed", "MidnightBlue", "MintCream", "MistyRose", "Moccasin", "NavajoWhite", "Navy", "OldLace", "Olive", "OliveDrab", "Orange", "OrangeRed", "Orchid", "PaleGoldenRod", "PaleGreen", "PaleTurquoise", "PaleVioletRed", "PapayaWhip", "PeachPuff", "Peru", "Pink", "Plum", "PowderBlue", "Purple", "RebeccaPurple", "Red", "RosyBrown", "RoyalBlue", "SaddleBrown", "Salmon", "SandyBrown", "SeaGreen", "SeaShell", "Sienna", "Silver", "SkyBlue", "SlateBlue", "SlateGray", "SlateGrey", "Snow", "SpringGreen", "SteelBlue", "Tan", "Teal", "Thistle", "Tomato", "Turquoise", "Violet", "Wheat", "White", "WhiteSmoke", "Yellow", "YellowGreen"]
      };



      $scope.categorySelector = function () {

        if ($scope.category === "Cup") {
          $scope.materials = {
            model: null,
            availableOptions: cupMaterials
          }
          $scope.sizes = {
            model: null,
            availableOptions: cupSizes
          }
        } else if ($scope.category === "Straw") {
          $scope.materials = {
            model: null,
            availableOptions: strawMaterials
          }
          $scope.sizes = {
            model: null,
            availableOptions: strawSizes
          }
        } else if ($scope.category === "Toothbrush") {
          $scope.materials = {
            model: null,
            availableOptions: toothbrushMaterials
          }
          $scope.sizes = {
            model: null,
            availableOptions: toothbrushSizes
          }
        } else {
          $scope.materials = {
            model: null,
            availableOptions: []
          }
          $scope.sizes = {
            model: null,
            availableOptions: []
          }
        }

      }

      $scope.imagePreview = function(){
        $scope.url = $scope.imageInput;
        console.log($scope.url);
      }
      

    }



  </script>
        
    </body>
</html>

