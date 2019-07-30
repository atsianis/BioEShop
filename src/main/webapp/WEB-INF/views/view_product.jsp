<%-- 
    Document   : products
    Created on : Jul 25, 2019, 9:08:32 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
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

            <!-- FILTERS -->

            <label for="titleFilter">Filter by title</label>
            <input id="titleFilter" type="text" ng-model="title">
            <!-- <label for="priceFilter">Filter by price</label>
            <input id="priceFilter" type="number" ng-model="maxPrice"> -->

            <div>{{maxPrice}}</div>

            <h1>{{categoryMessage}}</h1>
            <div class="card-columns">
                <div class="card" ng-repeat="product in products| filter: title">
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
