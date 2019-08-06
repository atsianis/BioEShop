<%-- 
    Document   : view_landing_page
    Created on : Aug 5, 2019, 10:46:26 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>
            body {
                background-color: green;
            }

            .color {
                background-color: lightgreen;
            }

            .gr {
                background-color: greenyellow;
            }
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu_FLUID.jsp" %>
        <main>
            <div class="row gr" style="margin-right: -15px!important; margin-left: -15px!important;">

                <section class="hero">

                    <div class="hero-inner">
                        <h1>Eco Believer</h1>
                        <h2>And I'm an Eco-Shop</h2>
                        <h1>Pand-Eco</h1>
                        <a href="/BioEShop/categories/" class="btn">Buy now</a>
                    </div>
                </section>

            </div>
            <div class="row color"></div>
        </main>
        
        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
