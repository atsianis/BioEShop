<%-- 
    Document   : view_order_success
    Created on : Aug 6, 2019, 5:19:52 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>
            h1 {
                background-color: black;
                color: lightgoldenrodyellow;
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
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <main>
            
            <div class="container">
                <div class="row ">

                    <div class="mx-auto d-block text-center" style="width:50%;">
                        <h2 class="text-danger">Not authorized access</h2>
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/static/img/access_denied.jpg" alt="Fuck off panda" class="card-img-top">
                        </div>
                    </div>
                </div>
        </main>
        <%@include file="z5HTML_Footer.jsp" %>
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
