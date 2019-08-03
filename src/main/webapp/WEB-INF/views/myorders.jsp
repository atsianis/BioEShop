<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
    <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <div class="container">
        <table border="1">
            <thead
                <tr><th>Date</th><th>Order #</th><th>Status</th><th>Details</th><th hidden="true">Total Price</th></tr>
            </thead>
            <c:forEach var="o" items="${orders}">
                <tr><td>${o.date}</td><td>${o.orderId}</td><td><c:choose><c:when test="${o.pending ==1}"><i>Pending</i></c:when><c:otherwise><i>Sent</i></c:otherwise></c:choose></td>
                <td>
                    <table border="1">
                <c:forEach var="d" items="${o.orderDetailsList}">
                        <tr><th>Product</th><th>Quantity</td><th>Price</th></tr>
                        <tr><td>${d.product.title}--${d.product.size}--${d.product.color}</td><td>${d.quantity}</td><td>${d.product.price}</td></tr>
                </c:forEach>
                    </table>
                        </td>
                        <td hidden="true"></td>
                </tr>
            </c:forEach>
        
                    
        </table>
        </div>
        <p>${message}</p><br>
    </body>
</html>
