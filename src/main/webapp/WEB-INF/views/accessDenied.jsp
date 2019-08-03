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
	<div class="generic-container">
		<div class="authbar">
			<span>Dear <strong>${loggedinuser}</strong>, You are not authorized to access this page.</span> <span class="floatRight"><a href="<c:url value="/logout" />">Logout</a></span>
		</div>
	</div>
</body>
</html>