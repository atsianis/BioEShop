<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        
        <div class="generic-container">
            <div class="well lead">Buy Now</div>
            <form:form action="/BioEShop/${action}" method="POST" modelAttribute="order" class="form-horizontal">
                <form:input type="number" hidden="true" path="orderId" id="id"/>
                <form:input type="date" hidden="true" path="date" id="id"/>
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
                        <th>PHOTO</th><th>INFO</th><th>PRICE</th><th>QUANTITY</th>
                        <tr>
                            <td height="250px" width="250px"><img height="200px" width="200px" src="${details.product.path}"/></td>
                            <td>${details.product.material}-${details.product.category}-${details.product.color}-${details.product.title}</td>
                            <td>${details.product.price}</td>
                            <td><input type="number" value="${details.quantity}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                    <div class="row">Total Price: <span id="total"></span></div>
                </div>
                <form:button type="submit" value="Buy Now">Buy now</form:button>
            </form:form>
        </div>
    </body>
</html>
