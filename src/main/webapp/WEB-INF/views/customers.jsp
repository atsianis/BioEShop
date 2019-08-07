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
            .disabled{
                color: currentColor;
                cursor: not-allowed;
                opacity: 0.5;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">Customers</h1>
        <div class="container">
            <div class="row">
                <div class="col">
                    <table class="table table-hover">
                        <thead class="bg-success text-light">
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${customers}">
                            <tr>
                                <td>${c.fname}</td>
                                <td>${c.lname}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <td>${c.phoneNumber}</td>
                                <td><a href="/BioEShop/admin/customers/update/${c.customerId}" class="update btn btn-warning btn-sm"></a>
                                    <c:if test="${c.customerId==1}">
                                        </td><td><a href="/BioEShop/admin/customers/delete/${c.customerId}" class="delete btn btn-danger btn-sm disabled"></a></td>
                                    </c:if>
                                    <c:if test="${c.customerId!=1}">
                                        </td><td><a href="/BioEShop/admin/customers/delete/${c.customerId}" class="delete btn btn-danger btn-sm"></a></td>
                                    </c:if>
                            </tr>
                    </c:forEach>
                        </tbody>
                </div>
            </div>
            <%@include file="z4scriptsBeforeBody.jsp" %>
            </body>
            </html>
