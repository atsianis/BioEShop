<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registration Confirmation Page</title>
        <link href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <div class="generic-container">
            <div class="alert alert-success lead">
                ${success}
            </div>

            <span class="well floatRight">
                Go to <a href="<c:url value='/' />">Go to home page</a>
            </span>
            <%
                response.setHeader("Refresh", String.valueOf(request.getAttribute("path")));
            %>
        </div>
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>

</html>