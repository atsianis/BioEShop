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
        
        <table border="1" id="example" class="stripe order-column hover cell-border display myTable" style="width:100%">
            <tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Address</th><th>Phone Number</th><th>Update</th><th>Delete</th></tr>
            <c:forEach var="c" items="${customers}">
                <tr><td>${c.fname}</td><td>${c.lname}</td><td>${c.email}</td><td>${c.address}</td><td>${c.phoneNumber}</td><td><a href="/BioEShop/admin/customers/update/${c.customerId}">Edit</a></td><td><a href="/BioEShop/admin/customers/delete/${c.customerId}">Delete</a></td></tr>
            </c:forEach>
        </table>
        <p>${message}</p><br>
    </body>
</html>
