<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>
            h1 {
                background-color: black;
            }

            body {
                background-color: lightgoldenrodyellow;
            }

            nav {
                background-color: lightgoldenrodyellow;
            }

            .color {
                background-color: lightgreen;
            }

            .gr {
                background-color: greenyellow;
            }

            .ran {
                flex-grow: unset;
                background-color: rgb(219, 219, 130);
                color: rgb(6, 8, 6);
            }
        </style>
    </head>
    <body ng-app="App" ng-controller="MainCtrl as vm">
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        
        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">My orders</h1>
            <div class="container">
                <div class="row">

                    <!-- SIDE BAR-->
                    <div class="col-md-3 col-sm-12">
                        <div class="row">
                            <div class="card poside" style="width:100%;">
                                <h5 class="text-center">Options</h5>
                                <a href="/BioEShop/user/profile" class="btn btn-outline-dark ">My profile</a>
                            </div>
                            <input type="text" placeholder="Search on orders" ng-model="selected">
                            <img src="${pageContext.request.contextPath}/static/img/pandacoollike.jpg" alt="cool like" style="width: 100%; height: 100%;object-fit:cover;">
                        </div>
                    </div>
                        
                        <div class="col-md-9 col-sm-12">
                            <table class="table table-hover">
                                <thead class="bg-success text-light">
                                <tr>
                                    <th>Order id</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody ng-repeat="order in orders| filter:selected">
                                <!-- ORDER ITEM-->
                                <!-- Order overview -->
                                <tr scope="row" class="order-leader" ng-click="custom = !custom">
                                    <td>{{order.orderId}}</td>
                                    <td>{{order.date}}</td>
                                    <td ng-if="order.pending===1">Pending</td>
                                    <td ng-if="order.pending===0">Completed</td>
                                </tr>
                                <tr scope="row" class="order-sub" ng-hide="custom" ng-click="custom = !custom">
                                    <td colspan="7">
                                        <table class="table m-0">
                                            <thead>
                                                <tr class="text-success">
                                                    <th>Comments</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr scope="row">
                                                    <td>{{order.comments}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <!-- Products List -->
                                <tr scope="row" class="order-sub" ng-hide="custom" ng-click="custom = !custom">
                                    <td colspan="7">
                                        <table class="table m-0">
                                            <thead>
                                                <tr class="text-success">
                                                    <th>Product Id</th>
                                                    <th>Product</th>
                                                    <th>Details</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr scope="row" ng-repeat="orderDetails in order.orderDetailsList">
                                                    <td>{{orderDetails.product.productId}}</td>
                                                    <td>{{orderDetails.product.title}}</td>
                                                    <td>{{orderDetails.product.color}}, {{orderDetails.product.size}},
                                                        {{orderDetails.product.material}}</td>
                                                    <td>{{orderDetails.product.price| currency: "&euro;" : 2}}</td>
                                                    <td>{{orderDetails.quantity}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        </div>
            </div>
        </main>
                        <%@include file="z5HTML_Footer.jsp" %>
        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script src="${pageContext.request.contextPath}/static/scripts/myorders.js"></script>
    </body>
</html>
