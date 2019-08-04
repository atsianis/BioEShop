<%-- 
    Document   : home
    Created on : Jul 24, 2019, 8:22:49 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
    <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <%@include file="z3authheader.jsp" %>
        
       
            
        
        
        
        <h1>Homepage</h1>
        ${message}
        
        
    </body>
</html>
