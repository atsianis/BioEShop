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
        <a href="/BioEShop/admin/products/${category}/add">Add a new product for this category</a>
    

        <div class="container">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4">
                    <figure class="card card-product">
                        <div class="img-wrap"><img src="${product.path}"></div>
                        <figcaption class="info-wrap">
                            <h4 class="title">${product.title}</h4>
                            <p class="desc">${product.descr}</p>
                            <div class="rating-wrap">
                                <div class="label-rating">${product.stock}</div>
                                <!--                                <div class="label-rating">154 orders </div>-->
                            </div> <!-- rating-wrap.// -->
                        </figcaption>





                        <div class="bottom-wrap">

                            <%! boolean isUser = true; %>
                            <sec:authorize access="hasRole('ADMIN')">
                                <a href="/admin/products/edit/${product.productId}" class="btn btn-sm btn-primary float-right">Edit</a>
                                <% isUser=false; %>
                            </sec:authorize>
                            <c:if test="${isUser = true}">
                                <a href="/buy/product/${product.productId}" class="btn btn-sm btn-primary float-right">Order Now</a>
                            </c:if>
                            


                            <div class="price-wrap h5">
                                <span class="price-new">${product.price}</span> <del class="price-old">$1980</del>
                            </div> <!-- price-wrap.// -->
                        </div> <!-- bottom-wrap.// -->
                    </figure>
                </div> 
            </c:forEach>
        </div>



        <p></p>
        <p>${product.color}</p>
        <p>${product.material}</p>





    </body>
</html>
