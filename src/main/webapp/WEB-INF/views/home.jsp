<%-- 
    Document   : home
    Created on : Jul 24, 2019, 8:22:49 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="menu.jsp" %>
        
        <c:if test="${loggedinuser != "anonymousUser"}">
            <jsp:include page="z3authheader.jsp" flush="true"/>
        </c:if>
        
        
        <h1>Homepage</h1>
        ${message}
        
        
    </body>
</html>
