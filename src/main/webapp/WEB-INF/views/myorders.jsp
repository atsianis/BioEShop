<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        
        <table border="1">
            <thead
                <tr><th>Date</th><th>Order #</th><th>Status</th><th>Details</th><th>Total Price</th></tr>
            </thead>
            <c:forEach var="o" items="${orders}">
                <tr><td>${o.date}</td><td>${o.orderId}</td><td><c:choose><c:when test="{o.pending=1}"><i>Pending</i></c:when><c:otherwise><i>Sent</i></c:otherwise></c:choose></td>
                <td>
                    <table border="1">
                <c:forEach var="d" items="${o.orderDetailsList}">
                        <tr><th>Product</th><th>Quantity</td><th>Price</th></tr>
                        <tr><td>${d.product.title}--${d.product.size}--${d.product.color}</td><td>${d.quantity}</td><td>${d.product.price}</td></tr>
                </c:forEach>
                    </table>
                        </td>
                        <td>JScript or SQL trigger</td>
                </tr>
            </c:forEach>
        
                    
        </table>
        <p>${message}</p><br>
    </body>
</html>
