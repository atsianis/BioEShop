<%-- 
    Document   : editproduct
    Created on : 26 ???? 2019, 12:24:34 ??
    Author     : samsung np350
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
    <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <div class="generic-container">
            <div class="well lead">${act} product </div>
            <form:form action="/BioEShop/admin/products/save" method="POST" modelAttribute="p" class="form-horizontal">
                <form:input type="hidden" path="productId" id="id"/>
                <c:choose>
                    <c:when test="${edit}">
                        <div class="row">
                            <img width="300px" height="400px" src="${p.path}"/>
                        </div>
                    </c:when>
                </c:choose>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="path">Path</label>
                        <div class="col-md-7">
                            <form:input type="text" path="path" id="path" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="path" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="descr">Description</label>
                        <div class="col-md-7">
                            <form:input type="text" path="descr" id="descr" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="descr" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="stock">Stock</label>
                        <div class="col-md-7">
                            <form:input type="number" path="stock" id="stock" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="stock" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="title">Title</label>
                        <div class="col-md-7">
                            <form:input type="text" path="title" id="title" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="title" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="price">Price</label>
                        <div class="col-md-7">
                            <form:input type="number" step="0.1" path="price" id="price" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="price" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${!edit}">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-3 control-lable" for="category">Category</label>
                                <div class="col-md-7">
                                    <form:select id="category" type="text" path="category" class="form-control input-sm">
                                        <form:option value="Cup">Cup</form:option>
                                        <form:option value="Straw">Straw</form:option>
                                        <form:option value="Toothbrush">Toothbrush</form:option>
                                    </form:select>
                                    <div class="has-error">
                                        <form:errors path="category" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <form:input type="text" hidden="true" path="category" id="category" class="form-control input-sm" />
                    </c:otherwise>
                </c:choose>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="color">Color</label>
                        <div class="col-md-7">
                            <form:input type="text" path="color" id="color" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="color" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="color">Size</label>
                        <div class="col-md-7">
                            <c:choose>
                                <c:when test="{edit}">
                                    <c:choose>
                                        <c:when test="${category =='Cup'}">
                                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                                <form:option value="0.5L">0.5L</form:option>
                                                <form:option value="0.75L">0.75L</form:option>
                                                <form:option value="1L">1L</form:option>
                                            </form:select>
                                        </c:when>
                                        <c:when test="${category == "Straw"}">
                                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                                <form:option value="3 inches">3"</form:option>
                                                <form:option value="5 inches">5"</form:option>
                                                <form:option value="7 inches">7"</form:option>
                                            </form:select>
                                        </c:when>
                                        <c:when test="${category == "Toothbrush"}">
                                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                                <form:option value="kid">kids</form:option>
                                                <form:option value="adult">adult</form:option>
                                            </form:select>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <form:select path="size" id="size">

                                    </form:select>
                                </c:otherwise>
                            </c:choose>
                            <div class="has-error">
                                <form:errors path="size" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="material">Material</label>
                        <div class="col-md-7">
                            <c:choose>
                                <c:when test='{edit}'>
                                    <c:choose>
                                        <c:when test="${category == "Cup"}">
                                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                                <form:option value="bamboo">Bamboo</form:option>
                                                <form:option value="steel">Steel</form:option>
                                                <form:option value="hard paper">Hard paper</form:option>
                                            </form:select>
                                        </c:when>
                                        <c:when test="${category == "Straw"}">
                                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                                <form:option value="bamboo">Bamboo</form:option>
                                                <form:option value="steel">Steel</form:option>
                                            </form:select>
                                        </c:when>
                                        <c:when test="${category == "Toothbrush"}">
                                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                                <form:option value="bamboo">Bamboo</form:option>
                                                <form:option value="wood">Wood</form:option>
                                            </form:select>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <form:select path="material" id="material">

                                    </form:select>
                                </c:otherwise>
                            </c:choose>
                            <div class="has-error">
                                <form:errors path="material" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-actions">
                        <input type="submit" value="Save" class="btn btn-primary btn-sm"/>
                    </div>
                </div>
            </form:form>
        </div>
        <script>
            let CupArray = [
                {
                    material1: "Bamboo",
                    material2: "Steel",
                    material3: "Hard Paper"
                },
                {
                    size1: "0.5L",
                    size2: "0.75L",
                    size3: "1L"
                }
            ]
            let StrawArray = [
                {
                    material1: "Bamboo",
                    material2: "Steel"
                },
                {
                    size1: '3"',
                    size2: '5"',
                    size3: '7"'
                }
            ]
            let ToothbrushArray = [
                {
                    material1: "Bamboo",
                    material2: "Wood"
                },
                {
                    size1: "kids",
                    size2: "adult"
                }
            ]
            let category = document.querySelector("#category");
            let material = document.querySelector("#material");
            let size = document.querySelector("#size");
            console.log(material);
            console.log(size);
            // let selected = category.options[category.selectedIndex].value;
            let handleChange = (e) => {
                if (category.options[category.selectedIndex].value === "Cup") {
                    material.options.length = 0;
                    size.options.length = 0;
                    for (index in CupArray[0]) {
                        material.options[material.options.length] = new Option(CupArray[0][index], CupArray[0][index]);
                    }
                    for (index in CupArray[1]) {
                        size.options[size.options.length] = new Option(CupArray[1][index], CupArray[1][index]);
                    }
                } else if (category.options[category.selectedIndex].value === "Straw") {
                    material.options.length = 0;
                    size.options.length = 0;
                    for (index in StrawArray[0]) {
                        material.options[material.options.length] = new Option(StrawArray[0][index], StrawArray[0][index]);
                    }
                    for (index in StrawArray[1]) {
                        size.options[size.options.length] = new Option(StrawArray[1][index], StrawArray[1][index]);
                    }
                } else {
                    material.options.length = 0;
                    size.options.length = 0;
                    for (index in ToothbrushArray[0]) {
                        material.options[material.options.length] = new Option(ToothbrushArray[0][index], ToothbrushArray[0][index]);
                    }
                    for (index in ToothbrushArray[1]) {
                        size.options[size.options.length] = new Option(ToothbrushArray[1][index], ToothbrushArray[0][index]);
                    }
                }
            }

            category.addEventListener("change", handleChange);


        </script>
    </body>
</html>



