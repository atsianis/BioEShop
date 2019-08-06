<%-- 
    Document   : view_edit_order
    Created on : Aug 4, 2019, 12:46:24 PM
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

                    <!-- SIDEBAR-->
                    <div class="col-md-3 col-sm-12">
                        <div class="row">
                            <div class="card poside" style="width:100%;">
                                <h5 class="text-center">Options</h5>
                                <a href="/BioEShop/products/" class="btn btn-outline-dark">Buy a product</a>
                            </div>
                            <img src="${pageContext.request.contextPath}/static/img/pandacoollike.jpg" alt="cool like" style="width: 100%; height: 100%;object-fit:cover;">
                        </div>
                    </div>



                    <!-- EDIT FORM -->

                    <div class="col-md-9 col-sm-12">
                        <form:form id="form" action="/BioEShop/${action}" method="POST" modelAttribute="order">
                            <!-- Order overview -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label for="orderId" class="font-weight-bold text-success">Order Id</label>
                                        <form:input id="orderId" type="number" class="form-control" value="${order.orderId}" path="orderId" required="true" readonly="true" />
                                    </div>
                                    <div class="col-md-3">
                                        <label for="date" class="font-weight-bold text-success">Date</label>
                                        <form:input id="date" type="date" class="form-control" value="${order.date}" path="date" readonly="true" required="true" />
                                    </div>
                                    <form:input type="number" hidden="true" path="customer.customerId" value="${order.customer.customerId}" />
                                    <div class="col-md-3">
                                        <label for="fname" class="font-weight-bold text-success">First Name</label>
                                        <form:input id="fname" type="text" class="form-control" value="${order.customer.fname}" path="customer.fname" maxlength="40" readonly="true" required="true" />
                                    </div>
                                    <div class="col-md-4">
                                        <label for="lname" class="font-weight-bold text-success">Last Name</label>
                                        <form:input id="lname" type="text" class="form-control" value="${order.customer.lname}" path="customer.lname" maxlength="40" readonly="true" required="true" />
                                    </div>
                                </div>
                            </div>

                            <!-- Customer contact details -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label for="email" class="font-weight-bold text-success">e-mail</label>
                                        <form:input id="email" type="email" class="form-control" value="${order.customer.email}" path="customer.email" maxlength="40" readonly="true" required="true" />
                                    </div>
                                    <div class="col-md-5">
                                        <label for="address" class="font-weight-bold text-success">Address</label>
                                        <form:input id="address" type="text" class="form-control" value="${order.customer.address}" path="customer.address" maxlength="60" readonly="true" required="true" />
                                    </div>
                                    <div class="col-md-3">
                                        <label for="phone" class="font-weight-bold text-success">Phone</label>
                                        <form:input id="phone" type="number" class="form-control" value="${order.customer.address}" 
                                                    path="customer.address" min="6900000000" max="6999999999" step="1" maxlength="10" readonly="true" required="true" />
                                    </div>
                                </div>
                            </div>

                            <!-- Comments -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="comments" class="font-weight-bold text-success">Comments</label>
                                        <form:input id="comments" type="text" class="form-control" value="${order.comments}" path="comments" 
                                                    maxlength="200" required="true" />
                                    </div>
                                </div>
                            </div>


                            <!-- Order Details -->
                            <div class="form-group">
                                <c:forEach items="${order.orderDetailsList}" var="item">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label for="productId" class="font-weight-bold text-success">Product Id</label>
                                            <input id="productId" type="number" class="form-control" name="pid" value="${item.product.productId}" 
                                                   min="1" step="1" maxlength="10" readonly="true" required="true" />
                                        </div>
                                        <div class="col">
                                            <label for="title" class="font-weight-bold text-success">Product</label>
                                            <input id="title" type="text" class="form-control" value="${item.product.descr}" name="description" 
                                                   maxlength="200" readonly="true" required="true" />
                                        </div>
                                        <div class="col">
                                            <label for="details" class="font-weight-bold text-success">Details</label>
                                            <input id="details" type="text" class="form-control" value="${item.product.color}, ${item.product.size}, ${item.product.material}"
                                                   maxlength="120" readonly="true" required="true" name="details" />
                                        </div>
                                        <div class="col-md-2">
                                            <label for="quantity" class="font-weight-bold text-success">Quantity</label>
                                            <input id="quantity" type="number" class="form-control" value="${item.quantity}" 
                                                   name="quantity" min="1" max="${item.product.stock}" step="1" maxlength="10" readonly="true" required="true" />
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>


                            <!-- Status -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="status" class="font-weight-bold text-success">Status</label>
                                        <form:select id="status" class="form-control" path="pending">
                                            <form:option selected="true" value="1">Pending</form:option>
                                            <form:option value="0">Completed</form:option>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <form:button type="submit" class="btn btn-success">Update order</form:button>
                        </form:form>



                        <!--
                        
                                                <form action="">
                                                     Order overview 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <label for="orderId" class="font-weight-bold text-success">Order Id</label>
                                                                <input id="orderId" type="number" class="form-control" value="100108" disabled>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label for="date" class="font-weight-bold text-success">Date</label>
                                                                <input id="date" type="date" class="form-control" value="14/11/1987" disabled>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label for="fname" class="font-weight-bold text-success">First Name</label>
                                                                <input id="fname" type="text" class="form-control" value="Giorgos">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label for="lname" class="font-weight-bold text-success">Last Name</label>
                                                                <input id="lname" type="text" class="form-control" value="Valamatsas">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     Customer contact details 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label for="email" class="font-weight-bold text-success">e-mail</label>
                                                                <input id="email" type="email" class="form-control" value="giorgos.valamats@gmail.com">
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label for="address" class="font-weight-bold text-success">Address</label>
                                                                <input id="address" type="text" class="form-control"
                                                                       value="Eptalophou 49A, 17778, Tavros, Athens, Greece">
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label for="phone" class="font-weight-bold text-success">Phone</label>
                                                                <input id="phone" type="text" class="form-control" value="6979814758">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     Comments 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col">
                                                                <label for="comments" class="font-weight-bold text-success">Comments</label>
                                                                <input id="comments" type="text" class="form-control" value="Please call me before shipping">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     Order Details 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <label for="productId" class="font-weight-bold text-success">Product Id</label>
                                                                <input id="productId" type="text" class="form-control" value="5">
                                                            </div>
                                                            <div class="col">
                                                                <label for="title" class="font-weight-bold text-success">Product</label>
                                                                <input id="title" type="text" class="form-control" value="Toothbrush set of 5" disabled>
                                                            </div>
                                                            <div class="col">
                                                                <label for="details" class="font-weight-bold text-success">Details</label>
                                                                <input id="details" type="text" class="form-control" value="Brown, medium, bamboo" disabled>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <label for="quantity" class="font-weight-bold text-success">Quantity</label>
                                                                <input id="quantity" type="number" class="form-control" value="5" min="1" max="100">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     Status 
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <label for="status" class="font-weight-bold text-success">Status</label>
                                                                <select id="status" class="form-control">
                                                                    <option selected>Pending</option>
                                                                    <option>Completed</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Update order</button>
                                                </form>-->







                    </div>
                </div>
            </div>
        </main>

        <%@include file="z5HTML_Footer.jsp" %>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script src="${pageContext.request.contextPath}/static/scripts/orders.js"></script>
    </body>
</html>
