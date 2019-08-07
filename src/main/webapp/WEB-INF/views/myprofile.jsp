<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>
            body {
                background-color: lightgoldenrodyellow;
            }

            nav {
                background-color: lightgoldenrodyellow;
            }

            .color {
                background-color: lightgreen;
            }

            h1 {
                background-color: black;
            }

            .gr {
                background-color: greenyellow;
            }
        </style>
    <body>
        <%@include file="authheader.jsp" %>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <h1>Hello World!</h1>
        <div class="generic-container">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><span class="lead">My Profile </span></div>
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
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
