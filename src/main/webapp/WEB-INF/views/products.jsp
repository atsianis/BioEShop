<%-- 
    Document   : products
    Created on : Jul 25, 2019, 9:08:32 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <sec:authorize access="hasRole('ADMIN')">
            <a href="/BioEShop/admin/products/${category}/add">Add a new product for this category</a>
        </sec:authorize>



        <div class="container">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4">
                    <figure class="card card-product">
                        <div class="img-wrap"><img width="300px" height="400px" src="${product.path}"></div>
                        <figcaption class="info-wrap">
                            <h4 class="title">${product.title}</h4>
                            <p class="desc">${product.descr}</p>
                            <div class="rating-wrap">
                                <div class="label-rating">${product.stock}</div>
                                <!--                                <div class="label-rating">154 orders </div>-->
                            </div> <!-- rating-wrap.// -->
                        </figcaption>





                        <div class="bottom-wrap">

                            
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="/BioEShop/admin/products/edit/${product.productId}" class="btn btn-sm btn-primary float-right">Edit</a>
                                <a href="/BioEShop/admin/products/delete/${product.productId}" class="btn btn-sm btn-primary float-right">Delete</a>
                                
                            </sec:authorize>
                            <sec:authorize access="!hasRole('ADMIN')">
                                <a href="/buy/product/${product.productId}" class="btn btn-sm btn-primary float-right">Order Now</a>
                            </sec:authorize>



                            <div class="price-wrap h5">
                                <span class="price-new">${product.price}</span> <del class="price-old">$1980</del>
                            </div> <!-- price-wrap.// -->
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> 
            </c:forEach>
        </div>


        <div class="container">
            <form action="" class="col-md-2">
                <div class="form-group">
                    <label id="priceLabel" for="price">50$</label>
                    <input id="price" type="range" class="form-control" min="${minPrice}" max="${maxPrice}" step="${step}">
                </div>
                <div class="form-group">
                    <label for="color">Color</label>
                    <select class="form-control form-control-sm" id="color">
                        <c:forEach var="color" items="${colors}">
                            <option>${color}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="size">Size</label>
                    <select class="form-control form-control-sm" id="size">
                        <c:forEach var="size" items="${sizes}">
                            <option>${size}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="material">Material</label>
                    <select class="form-control form-control-sm" id="material">
                        <c:forEach var="material" items="${materials}">
                            <option>${material}</option>
                        </c:forEach>
                    </select>
                </div>
            </form>
        </div>


<!-- jQuery 4 -->
        <script type="text/javascript" src="<c:url value='https://code.jquery.com/jquery-3.4.1.min.js' />"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script type="text/javascript">
            jQuery(document).ready(init($));

            function init($) {
                let $priceInput = $("#price");

                $priceInput.on("input", handleChange);

                function handleChange() {
                    console.log($priceInput.val());
                    $("#priceLabel").html(`${$priceInput.val()}$`);
                }
            }
        </script>
        

    </body>
</html>
