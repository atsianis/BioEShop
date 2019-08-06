<%-- 
    Document   : view_contact
    Created on : Aug 6, 2019, 12:47:04 AM
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

            .card-deck {
                padding: 10px;
            }

            .space {
                padding: 15px;
                background-color: black;
            }

            .block {
                background-color: black;
                line-height: 100%
            }
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">Contact</h1>
            <!-- MAP -->
            <div class="container">
                <div class="row">
                    <iframe id="map"
                            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12579.367665195578!2d23.7321257!3d37.9808184!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd71dcf7d2b435255!2sPeopleCert!5e0!3m2!1sel!2sgr!4v1561739721026!5m2!1sel!2sgr"
                            width="0" height="0" frameborder="0" style="border:0"></iframe>
                </div></br>

                <div class="row">
                    <!-- details contact -->
                    <div class="col-md-6">
                        <h3 class="text-success text-center">Contact Details</h3>
                        <ul class="list-unstyled text-center">
                            <li style="width: 400px; margin: auto;"><i class="fa fa-envelope" style="padding-right: 20px;"></i>hello@afdemp.org</li>
                            <li style="width: 400px; margin: auto;"><i class="fa fa-phone" style="padding-right: 20px;"></i>+30 210 37 29 70</li>
                            <li style="width: 400px; margin: auto;"><i class="fa fa-map-marker" style="padding-right: 10px;"></i> Somewhere in the planet Av.,</br> 34A 32787, Country, World</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3 class="text-success text-center">Chat 24/7</h3>
                        <a href="/BioEShop/chat" target="_blank">
                            <img src="${pageContext.request.contextPath}/static/img/help-gray.svg" alt="chat icon" style="width: 100px; margin: auto; position: relative; display: block;">
                        </a>
                    </div>
                </div>


            </div>

        </main>
        <footer class="ran">

        </footer>
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
