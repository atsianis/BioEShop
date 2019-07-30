<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>

        <div class="generic-container">
            <div class="well lead">Buy Now</div>
            <form:form id="form" action="/BioEShop/${action}" method="POST" modelAttribute="order" class="form-horizontal">
                <form:input type="number" hidden="true" path="orderId"/>
                <form:input type="number" hidden="true" path="pending"/>
                <form:input type="number" hidden="true" path="customer.customerId"/>
                <form:input type="number" hidden="true" path="customer.phoneNumber"/>

                <!-- CUSTOMER'S INFO -->
                <strong>Your Info</strong>

                <!-- First Name -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="fname">First Name</label>
                        <div class="col-md-7">
                            <form:input readonly="true" type="text" path="customer.fname" id="fname" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="customer.fname" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Last Name -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="lname">Last Name</label>
                        <div class="col-md-7">
                            <form:input readonly="true" type="text" path="customer.lname" id="lname" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="customer.lname" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Address -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="address">Address</label>
                        <div class="col-md-7">
                            <form:input readonly="true" type="text" path="customer.address" id="address" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="customer.address" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Email -->
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="email">Email</label>
                        <div class="col-md-7">
                            <form:input readonly="true" type="text" path="customer.email" id="email" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="customer.email" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ORDER INFO -->
                <strong>Product</strong>
                <div class="container">
                    <table border="1" id="example" class="stripe order-column hover cell-border display myTable" style="width:50vw">
                        <tr>
                            <th hidden="true">ID</th>
                            <th>PHOTO</th>
                            <th>INFO</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                        </tr>
                        <c:forEach var="details" items="${order.orderDetailsList}">
                            <tr class="product">
                                <td>
                                    <input class="productId" name="pid" hidden="true" type="number" value="${details.product.productId}" /><!-- @RequestParam("pid") int pid ston controller ?!?!?-->
                                </td>
                                <td height="250px" width="250px">
                                    <img height="200px" width="200px" src="${details.product.path}" />
                                </td>
                                <td>
                                    ${details.product.material}-${details.product.category}-${details.product.color}-${details.product.title}
                                </td>
                                <td>
                                    <input type="number" class="price" disabled value="${details.product.price}" />
                                </td>
                                <td>
                                    <input id="q${details.product.productId}" onchange="updateQuantity(this)" class="quantity" name="quantity" type="number" min="1" max="${details.product.stock}" /> <!-- @RequestParam("quantity") ston controller ?!?!?-->
                                </td>
                            </tr>
                        </c:forEach>
                            <tr>
                                <td hidden="true"></td>
                                <td colspan="4" id="totalOutput">Total price: 0 euro</td><!-- Thano to id to eixes 'total'. Tsekare an soy xalaei tipota -->
                            </tr>
                    </table>
                    
                </div>
                <div id="paypal-button-container"></div>
                <form:button hidden="true" id="button" type="submit" value="Buy Now">Buy now</form:button>
            </form:form>
        </div>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <!-- Include the PayPal JavaScript SDK -->
        <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>
        <script src="${pageContext.request.contextPath}/static/scripts/buynow.js"></script>
    </body>
</html>
