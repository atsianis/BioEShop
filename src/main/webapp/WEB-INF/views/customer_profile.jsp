<%-- 
    Document   : myprofile
    Created on : Jul 24, 2019, 11:10:03 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>

<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <h1>Hello World!</h1>
        <div class="generic-container">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                
                
                <sec:authorize access="hasRole('ADMIN')">
                <div class="panel-heading"><span class="lead">Customer Profile </span></div>
                </sec:authorize>
                <sec:authorize access="hasRole('USER')">
                    <div class="panel-heading"><span class="lead">My Profile </span></div>
                </sec:authorize>
                
                <div>${success}</div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Phone number</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${customer.fname}</td>
                            <td>${customer.lname}</td>
                            <td>${customer.email}</td>
                            <td>${customer.address}</td>
                            <td>${customer.phoneNumber}</td>
                        </tr>
                    </tbody>
                </table>
                <sec:authorize access="hasRole('ADMIN')">
                    <div><a href="<c:url value='/admin/customers/update/${customer.customerId}' />" class="btn btn-success custom-width">Update info</a></div>
                    <div><a href="<c:url value='/admin/customers/delete/${customer.customerId}' />" class="btn btn-success custom-width">Delete customer</a></div>
                </sec:authorize>
                <sec:authorize access="hasRole('USER')">
                    <div><a href="<c:url value='/user/profile/update/${customer.customerId}' />" class="btn btn-danger custom-width">Update info</a></div>
                </sec:authorize>
            </div>
        </div>
    </body>
</html>
