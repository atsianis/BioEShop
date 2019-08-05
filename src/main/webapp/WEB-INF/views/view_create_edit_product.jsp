<%-- 
    Document   : view_create_edit_product
    Created on : Aug 4, 2019, 8:44:09 PM
    Author     : giorgos
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>

        </style>

    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>


        <main>
            <h1 style="text-align:center;text-shadow:0 0 3px black; color:lightgoldenrodyellow;">
                ${act} Product
            </h1>

            <div class="container">
                <div class="row">

                    <!-- ADD PRODUCT FORM -->
                    <form:form action="/BioEShop/admin/products/save" method="POST" modelAttribute="p" class="col-12">
                        <form:input type="hidden" path="productId" id="id"/>
                        <!-- Product title -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <label for="title" class="font-weight-bold text-success">Title of product</label>
                                    <form:input path="title" id="title" type="text" class="form-control" maxlength="45" required="true"/>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="description" class="font-weight-bold text-success">Description</label>
                                    <form:input path="descr" id="description" type="text" class="form-control" maxlength="200" required="true"/>
                                </div>
                            </div>
                        </div>
                        <!-- Product URL & Image -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <label for="path" class="font-weight-bold text-success">URL of image</label>
                                    <form:input path="path" id="path" type="text" class="form-control" maxlength="500"
                                                placeholder="Enter the URL of the product's image" 
                                                value="${p.path}" required="true"/>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="preview" class="font-weight-bold text-success">Preview</label></br>
                                    <img id="imagePreview" class="mx-auto d-block" style="width:50%;" src="" alt="preview of product">
                                </div>
                            </div>
                        </div>
                        <!-- Stock, Price, Category -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-4">
                                    <label for="category" class="font-weight-bold text-success">Category</label>
                                    <form:select path="category" id="category" class="form-control" required="true">
                                        <form:option selected="${p.category eq 'Cup' ? true : ''}" value="Cup">Cup</form:option>
                                        <form:option selected="${p.category eq 'Straw' ? true : ''}" value="Straw">Straw</form:option>
                                        <form:option selected="${p.category eq 'Toothbrush' ? true : ''}" value="Toothbrush">Toothbrush</form:option>
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="stock" class="font-weight-bold text-success">Stock</label>
                                    <form:input path="stock" id="stock" type="number" class="form-control" maxlength="200" min="1" step="1" required="true"/>
                                </div>
                                <div class="col-4">
                                    <label for="price" class="font-weight-bold text-success">Price</label>
                                    <form:input path="price" id="price" type="number" class="form-control" maxlength="200" step="0.1" min="1" required="true"/>
                                </div>
                            </div>
                        </div>
                        <!-- Color, Size, Material -->
                        <div class="form-group">
                            <div class="row">
                                <div class="col-4">
                                    <label for="color" class="font-weight-bold text-success">Color</label>
                                    <form:select path="color" id="color" class="form-control" required="true">
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="size" class="font-weight-bold text-success">Size</label>
                                    <form:select path="size" id="size" class="form-control" required="true">
                                    </form:select>
                                </div>
                                <div class="col-4">
                                    <label for="material" class="font-weight-bold text-success">Material</label>
                                    <form:select path="material" id="material" class="form-control" required="true">
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <!-- Submit -->
                        <button type="submit" class="btn btn-success mx-auto d-block">${button}</button>

                        <input hidden="true" type="text" id="colorInit" value="${p.color}">
                        <input hidden="true" type="text" id="sizeInit" value="${p.size}">
                        <input hidden="true" type="text" id="materialInit" value="${p.material}">

                    </form:form>

                </div>
            </div>

        </main>



        <footer></footer>

        <%@include file="z4scriptsBeforeBody.jsp" %>
        <script src="${pageContext.request.contextPath}/static/scripts/savaEditProducts.js"></script>

    </body>
</html>

