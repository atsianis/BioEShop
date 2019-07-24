<%-- 
    Document   : home
    Created on : Jul 24, 2019, 8:22:49 PM
    Author     : giorgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        
        <c:if test="${loggedinuser != "anonymousUser"}">
            <jsp:include page="authheader.jsp" flush="true"/>
        </c:if>
        
        
        <h1>Homepage</h1>
        
        
    </body>
</html>
