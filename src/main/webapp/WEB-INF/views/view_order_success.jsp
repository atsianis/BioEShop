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
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">Order Confirmation</h1>
            <div class="container">
                <div class="row ">

                    <div class="mx-auto d-block text-center" style="width:50%;">
                        <c:choose>
                            <c:when test="${update == false}">
                                <c:if test="${failure}">
                                    <h2>${message}</h2>
                                    <p>Feel free to contact with us in order to resolve the problem.</p>
                                </c:if>
                                    <c:if test="${!failure}">
                                        <h2>Dear ${customerName},<br>your Order is on its way.</h2>
                                        <h3>Order number: <span class="text-success">${orderNumber}</span></h3>
                                        <h4>Please allow 24 hours for arrival of your order.</h4>
                                        <p>
                                            Thank very much for your loyalty. We are very honor to have customer like you.
                                            As a matter of fact, we are looking forward to serve you in the following years.
                                        </p>
                                        <h5>THANK YOU BY PAND-ECO</h5>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <h2>${message}</h2>
                            </c:otherwise>
                        </c:choose>

                        <div class="card">
                            <img src="${pageContext.request.contextPath}/static/img/elegantpanda.JPG" alt="see you soon panda" class="card-img-top">
                        </div>
                    </div>
                </div>
        </main>
        <%@include file="z5HTML_Footer.jsp" %>
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
