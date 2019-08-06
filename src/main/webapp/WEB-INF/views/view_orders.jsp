<%-- 
    Document   : view_orders
    Created on : Aug 4, 2019, 1:18:41 AM
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
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">View Order List</h1>
            <div class="container">
                <div class="row">

                    <!-- SIDE BAR-->
                    <div class="col-md-3 col-sm-12">
                        <div class="row">
                            <div class="card poside" style="width:100%;">
                                <h5 class="text-center">Options</h5>
                                <a href="/BioEShop/admin/products/create" class="btn btn-outline-dark "> Add New Product</a>
                            </div>
                            <input type="text" placeholder="Search on orders" ng-model="selected">
                            <img src="${pageContext.request.contextPath}/static/img/pandacoollike.jpg" alt="cool like" style="width: 100%; height: 100%;object-fit:cover;">
                        </div>
                    </div>



                    <!-- TABLE -->
                    <div class="col-md-9 col-sm-12">
                        <table class="table table-hover">
                            <thead class="bg-success text-light">
                                <tr>
                                    <th>Order id</th>
                                    <th>Date</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Price</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody ng-repeat="order in orders| filter:selected">
                                <!-- ORDER ITEM-->
                                <!-- Order overview -->
                                <tr scope="row" class="order-leader" ng-click="custom = !custom">
                                    <td>{{order.orderId}}</td>
                                    <td>{{order.date}}</td>
                                    <td>{{order.customer.fname}}</td>
                                    <td>{{order.customer.lname}}</td>
                                    <td>00.00</td>
                                    <td>
                                        <a ng-href="/BioEShop/admin/order/edit/{{order.orderId}}" class="update btn btn-warning btn-sm">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                        </a>
                                    </td>
                                    <td>
                                        <a ng-href="/BioEShop/admin/order/delete/{{order.orderId}}" class="delete btn btn-danger btn-sm" ng-click="alert($event, order.orderId)">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
                                </tr>
                                <!-- Customer details -->
                                <tr scope="row" class="order-sub" ng-hide="custom" ng-click="custom = !custom">
                                    <td colspan="7">
                                        <table class="table m-0">
                                            <thead>
                                                <tr class="text-success">
                                                    <th>Email</th>
                                                    <th>Address</th>
                                                    <th>Phone number</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr scope="row">
                                                    <td>{{order.customer.email}}</td>
                                                    <td>{{order.customer.address}}</td>
                                                    <td>{{order.customer.phoneNumber}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <!-- Comments -->
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

        <footer></footer>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script src="${pageContext.request.contextPath}/static/scripts/orders.js"></script>
    </body>
</html>
