<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
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
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;"> New Order</h1>
            <div class="container">
                <div class="row">

                    <!-- SIDEBAR -->
                    <div class="col-md-3 left_content">
                        <div class="row">
                            <div class="card poside" style="width:100%;">
                                <h5 class="centertext">Options</h5>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <a href="/BioEShop/admin/products/create" class="btn btn-outline-dark "> Add New Product</a>
                                </sec:authorize>
                                    <a href="/BioEShop/products/" class="btn btn-outline-dark "> Back to products</a>

                            </div>
                            <img src="${pageContext.request.contextPath}/static/img/pandacoollike.jpg" alt="cool like" style="width: 100%; height: 100%;object-fit:cover;">
                        </div>
                    </div>


                    <div class="col-md-9 col-sm-12">
                        <form:form id="form" action="/BioEShop/${action}" method="POST" modelAttribute="order">
                            <form:input type="number" hidden="true" path="orderId"/>
                            <form:input type="number" hidden="true" path="pending"/>
                            <form:input type="number" hidden="true" path="customer.customerId"/>
                            <form:input type="number" hidden="true" path="customer.phoneNumber"/>
                            <c:choose>
                                <c:when test="${registered}">
                                    <strong class="text-secondary">Your Info</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong class="text-secondary">Please Insert your info</strong>
                                </c:otherwise>
                            </c:choose>




                            <!-- Customer name -->
                            <div class="form-group">
                                <div class="row">
                                    <!-- Name -->
                                    <div class="col-md-6">
                                        <label for="fname" class="font-weight-bold text-success">First Name</label>
                                        <form:input readonly="${registered}" required="true" type="text" path="customer.fname" id="fname" class="form-control" placeholder="Maria" minlength="3"/>
                                        <div class="has-error">
                                            <form:errors path="customer.fname" class="help-inline"/>
                                        </div>
                                    </div>
                                    <!-- Last Name -->
                                    <div class="col-md-6">
                                        <label for="lname" class="font-weight-bold text-success">Last Name</label>
                                        <form:input readonly="${registered}" required="true" type="text" path="customer.lname" id="lname" class="form-control" placeholder="Papadopoulou" minlength="3"/>
                                        <div class="has-error">
                                            <form:errors path="customer.lname" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Customer contact details -->
                            <div class="form-group">
                                <div class="row">
                                    <!-- Email -->
                                    <div class="col-md-4">
                                        <label for="email" class="font-weight-bold text-success">e-mail</label>
                                        <form:input readonly="${registered}" required="true" type="email" path="customer.email" id="email" class="form-control"
                                                    placeholder="maria.pap@example.com" minlength="3"/>
                                        <div class="has-error">
                                            <form:errors path="customer.email" class="help-inline"/>
                                        </div>
                                    </div>
                                    <!-- Address -->
                                    <div class="col-md-5">
                                        <label for="address" class="font-weight-bold text-success">Address</label>
                                        <form:input readonly="${registered}" required="true" type="text" path="customer.address" id="address" class="form-control"
                                                    placeholder="Somewhere in the universe str, 17854, City, Country, Wolrd" minlength="10"/>
                                        <div class="has-error">
                                            <form:errors path="customer.address" class="help-inline"/>
                                        </div>
                                    </div>
                                    <!-- Phone -->
                                    <div class="col-md-3">
                                        <label for="phone" class="font-weight-bold text-success">Phone</label>
                                        <form:input readonly="${registered}" required="true" type="number" path="customer.phoneNumber" id="phone" class="form-control"
                                                    min="6950000000" max="6999999999" placeholder="6979696969"/>
                                        <div class="has-error">
                                            <form:errors path="customer.phoneNumber" class="help-inline"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Comments -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col">
                                        <label for="comments" class="font-weight-bold text-success">Comments</label>
                                        <form:textarea path="comments" id="comments" cols="30" rows="5" class="form-control" maxlength="200"
                                                       placeholder="Please call me before shipping"></form:textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- Total Order Price -->
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="totalOutput" class="font-weight-bold text-success">Total price</label>
                                            <input id="totalOutput" class="form-control" value="Total price 0" disabled/>
                                        </div>
                                    </div>
                                </div>

                                <!-- Products list -->
                                <div class="form-group">
                                    <div class="table-responsive">
                                        <table id="example" class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" hidden="true" class="font-weight-bold text-success">Id</th>
                                                    <th scope="col" class="font-weight-bold text-success">Photo</th>
                                                    <th scope="col" class="font-weight-bold text-success">Info</th>
                                                    <th scope="col" class="font-weight-bold text-success">Price</th>
                                                    <th scope="col" class="font-weight-bold text-success">Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="details" items="${order.orderDetailsList}">
                                                <!-- Product -->
                                                <tr class="product">
                                                    <td scope="row" hidden="true">
                                                        <input class="productId" name="pid" hidden="true" type="number"
                                                               value="${details.product.productId}" />
                                                    </td>
                                                    <td>
                                                        <img height="150px" width="150px" src="${details.product.path}" />
                                                    </td>
                                                    <td>
                                                        <strong>${details.product.title}</strong>, ${details.product.category},
                                                        ${details.product.color}, ${details.product.size}, ${details.product.material}
                                                    </td>
                                                    <td>
                                                        <input type="text" class="price" size="10" disabled value="${details.product.price}" />
                                                    </td>
                                                    <td>
                                                        <input style="max-width: 100px;" id="q${details.product.productId}" onchange="updateQuantity(this)" class="quantity"
                                                               name="quantity" type="number" value="1" min="1" max="${details.product.stock}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Paypal -->
                            <div style="display:none;" class="container" id="paypal-button-container"></div>
                            <!-- CONFIRM BUTTON -->
                            <form:button hidden="true" id="button" type="submit" value="Place order" class="btn btn-primary">Place
                                order</form:button>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>

        <footer class="ran"></footer>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <!-- Include the PayPal JavaScript SDK -->
        <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>
        <script src="${pageContext.request.contextPath}/static/scripts/buynow.js"></script>
    </body>
</html>
