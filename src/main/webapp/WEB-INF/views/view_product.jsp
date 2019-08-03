<%-- 
    Document   : products
    Created on : Jul 25, 2019, 9:08:32 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <!-- Our CSS -->
    <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
    <%@include file="z2HTML_Head.jsp" %>
    </head>
    <body ng-app="App" ng-controller="MainCtrl" ng-cloak>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <sec:authorize access="hasRole('ADMIN')">
            <a href="/BioEShop/admin/products/create">Add a new product</a>
        </sec:authorize>


        <!-- SIDEBAR -->
        <aside class="bg-primary">
            <ul>
                <li id="cups">Cups</li>
                <li id="straws">Straws</li>
                <li id="tooth">Toothbrushes</li>
            </ul>

        </aside>


        <!-- CONTENT -->
        <main class="bg-secondary container">

            <h1>{{categoryMessage}}</h1>

            <!-- PRODUCTS FILTERS -->
            <form>
                <label for="titleFilter">Search in title</label>
                <input id="titleFilter" type="text" ng-model="titleFilter">
                <label for="descrFilter">Search in description</label>
                <input id="descrFilter" type="text" ng-model="descrFilter">
                <label for="sizeFilter">Size</label>
                <select id="sizeFilter" ng-model="sizeFilter">
                    <option ng-repeat="size in sizes" value="{{size}}">
                        {{size}}
                    </option>
                </select>
                <label for="colorFilter">Color</label>
                <select id="colorFilter" ng-model="colorFilter">
                    <option ng-repeat="color in colors" value="{{color}}">
                        {{color}}
                    </option>
                </select>
                <label for="materialFilter">Material</label>
                <select id="materialFilter" ng-model="materialFilter">
                    <option ng-repeat="material in materials" value="{{material}}">
                        {{material}}
                    </option>
                </select>
                <label for="orderbyFilter">Order by</label>
                <select id="orderbyFilter" class="filter" ng-model="orderBy">
                    <option value=""></option>
                    <option value="price">Price (-/+)</option>
                    <option value="-price">Price (+/-)</option>
                    <option value="stock">Availability (-/+)</option>
                    <option value="-stock">Availability (+/-)</option>
                </select>
            </form>


            <!-- PRODUCTS GRID -->
            <div class="card-columns">
                <div class="card" ng-repeat="product in products | orderBy: orderBy | 
                        filter:{title:titleFilter, descr:descrFilter, size:sizeFilter, color:colorFilter, material:materialFilter}">
                    <a id="productLink" href="/BioEShop/products/{{product.productId}}">
                        <img class="card-img-top img-fluid" src="{{product.path}}" alt="Card image" style="width:100%">
                    </a>
                    <div class="card-body">

                        <h4 class="card-title">{{product.title}}</h4>
                        <p class="card-text">{{product.descr}}</p>
                        <h6>Color: {{product.color}}</h6>
                        <h6>Size: {{product.size}}</h6>
                        <h6>Material: {{product.material}}</h6>
                        <h5>{{product.stock}} pieces left!</h5>
                        <h5>Order now for {{product.price| currency: "&euro;" : 2}}</h5>

                        <sec:authorize access="hasRole('ADMIN')">
                            <a href="/BioEShop/admin/products/edit/{{product.productId}}"
                               class="btn btn-primary">Edit</a>
                            <a href="/BioEShop/admin/products/delete/{{product.productId}}"
                               class="btn btn-primary">Delete</a>
                        </sec:authorize>
                        <sec:authorize access="!hasRole('ADMIN')">
                            <a href="/BioEShop/order/buy/{{product.productId}}"
                               class="btn btn-primary">Order now!</a>
                        </sec:authorize>

                    </div>
                </div>
            </div>
        </main>


        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script src="${pageContext.request.contextPath}/static/scripts/products.js"></script>


    </body>
</html>
