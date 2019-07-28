<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Order Success</title>
        <link href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="generic-container">
            <div class="alert alert-success lead">
                ${message}
            </div>

            <span class="well floatRight">
                <a href="<c:url value='/' />">Go to home page</a>
            </span>
            
        </div>
    </body>

</html>