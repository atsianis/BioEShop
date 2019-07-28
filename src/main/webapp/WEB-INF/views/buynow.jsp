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
                
                <strong>Your Info</strong>
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
                <strong>Product</strong>
                <div class="container">
                <table border="1" id="example" class="stripe order-column hover cell-border display myTable" style="width:50vw">
                    <c:forEach var="details" items="${order.orderDetailsList}">
                        <input name="pid" hidden="true" type="int" value="${details.product.productId}"/><!-- @RequestParam("pid") int pid ston controller ?!?!?-->
                        <th>PHOTO</th><th>INFO</th><th>PRICE</th><th>QUANTITY</th>
                        <tr>
                            <td height="250px" width="250px"><img height="200px" width="200px" src="${details.product.path}"/></td>
                            <td>${details.product.material}-${details.product.category}-${details.product.color}-${details.product.title}</td>
                            <td>${details.product.price}</td>
                            <td><input name="quantity" type="number" min="1" max="${details.product.stock}"/></td> <!-- @RequestParam("quantity") ston controller ?!?!?-->
                        </tr>
                    </c:forEach>
                </table>
                    <div class="row">Total Price: <span id="total"></span></div>
                </div>
                <div id="paypal-button-container"></div>
                <form:button hidden="true" id="button" type="submit" value="Buy Now">Buy now</form:button>
            </form:form>
        </div>
        <!-- jQuery -->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous">
        </script>
        <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

    <script>
        
        let form = $("#form");
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '49.99'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                    // added by me
                    form.submit();
                });
            }


        }).render('#paypal-button-container');
    
    </script>
    </body>
</html>
