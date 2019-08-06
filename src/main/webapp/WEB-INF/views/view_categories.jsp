<%-- 
    Document   : view_categories
    Created on : Aug 5, 2019, 11:32:08 PM
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
            
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">Product Categories</h1>


            <!-- CAROUSEL -->
            <!--            <section>
                            <div class="container " style=" background-color: lightgoldenrodyellow;">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                    </ol>
                                    <div class="carousel-inner" style=" background-color: lightgoldenrodyellow;">
                                        <div class="carousel-item active">
                                            <img class="d-block w-25" src="pics/colglstr.jpg" alt="First slide">
                                            <div class="carousel-caption d-none d-md-block " style="color: black; ">
                                                <h5>New</h5>
                                                <p>Lorem, ipsum dolor sit amet </p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-25" src="pics/keepglcup.jpg" alt="Second slide">
                                            <div class="carousel-caption d-none d-md-block " style="color: black; ">
                                                <h5>New</h5>
                                                <p>Lorem, ipsum dolor sit amet </p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-25" src="pics/toothecbam.jpg" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block " style="color: black; ">
                                                <h5>New</h5>
                                                <p>Lorem, ipsum dolor sit amet </p>
                                            </div>
                                        </div>
            
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </section>-->
            <!-- PRODUCT CATEGORIES -->
            <div class="container">
                <section class="row" id="product-categories">
                    <div class="col-md-3 left_content">
                        <div class="row ">
                            <div class="card pos-side">
                                <img src="${pageContext.request.contextPath}/static/img/pandda.jpg" class="card-img-top" alt="Panda">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-9 right_content">
                        <div class="card-deck">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/static/img/desbamcup.jpg" class="card-img-top" style="" alt="Design Bamb Cups">
                                <div class="card-body">
                                    <h5 class="card-title">Cups</h5>
                                    <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>

                                </div>
                                <div class="card-footer">
                                    <small class="text-muted"> <a href="/BioEShop/products/cup" class="btn btn-outline-success "> See More</a></small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/static/img/beautyglasstraw.jpg" class="card-img-top" alt="Beauty Glass Straw ">
                                <div class="card-body">
                                    <h5 class="card-title">Straws</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                        content. This content is a little bit longer.</p>

                                </div>
                                <div class="card-footer">
                                    <small class="text-muted"> <a href="/BioEShop/products/straw" class="btn btn-outline-success "> See More</a></small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/static/img/toothwhitebam.jpg" class="card-img-top" style="" alt="tooth bamboo pic">
                                <div class="card-body">
                                    <h5 class="card-title">Toothbrushes</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                                        content. This card has even longer content than the first to show that equal height action.</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted"><a href="/BioEShop/products/toothbrush" class="btn btn-outline-success "> See More</a></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>


        </main>

        <footer class="ran footer"></footer>
            <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
