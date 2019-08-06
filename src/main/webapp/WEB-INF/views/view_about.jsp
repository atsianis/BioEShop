<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/animationabout.css' />" type="text/css" rel="stylesheet"></link>
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

            .containerrr {
                position: relative;
                text-align: center;
                

            }

            .ran {
                flex-grow: unset;
                background-color: rgb(219, 219, 130);
                color: rgb(6, 8, 6);
            }

            .card-deck {
                padding: 10px;
            }

            .textcoloringstyle {
                color: white;
                font-weight: bold;

            }

            .space {
                padding: 15px;
                background-color: black;
            }

            .block {
                background-color: black;
                line-height: 100%
            }

            .centered {

                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .tarea {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">About</h1>
            <div class="containerrr container ">
                <div class="row">
                    <div class=" container tarea">
                        <div class="tarea btn" style="color:white">
                            <img src="${pageContext.request.contextPath}/static/img/pandatransparent.jpg" alt="pandatransparent" class="poside" />

                            <p class="item-1">Everyhing we sell at Pand-Eco meets the highest level of
                                quality for your family and the environment, leaving you to shop with a clean conscious.</p>

                            <p class="item-2">Our children and our planet are our future, lets protect both so that our 'Mother
                                Earth' can sustain, govern & nurture their journey through life.</p>

                            <p class="item-3"> We do not inherit the earth from our ancestors, we borrow it
                                from our children.
                                ? Native American Quote
                                Begin your journey of change today!</p>
                        </div>
                        <h2 class="text-success">Pand-Eco is more than a lifelong dream, it's a way of life.</h2>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="z5HTML_Footer.jsp" %>
        <%@include file="z4scriptsBeforeBody.jsp" %>

    </body>
</html>
