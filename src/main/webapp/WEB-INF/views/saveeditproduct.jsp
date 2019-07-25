<%-- 
    Document   : editproduct
    Created on : 26 ???? 2019, 12:24:34 ??
    Author     : samsung np350
--%>

<%@include file="z1JSP_setup.jsp" %>
<html>
    <%@include file="z2HTML_Head.jsp" %>
    <body>
        <%@include file="z3authheader.jsp" %>
        <%@include file="menu.jsp" %>

        <div class="well lead">${action} product </div>
        <form:form action="/BioEShop/admin/products/save" method="POST" modelAttribute="p" class="form-horizontal">
            <form:input type="hidden" path="productId" id="id"/>
            <c:when test="${edit}">
                <div class="row">
                    <img width="300px" height="400px" src="${p.path}"/>
                </div>
            </c:when>
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
                        <form:input type="text" path="stock" id="stock" class="form-control input-sm" />
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
                        <form:input type="text" path="price" id="price" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="price" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            <c:when test="${edit}">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="price">Price</label>
                        <div class="col-md-7">
                            <form:input type="text" path="price" id="price" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="price" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <form:input type="text" hidden="true" path="price" id="price" class="form-control input-sm" />
            </c:otherwise>
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
                        <c:when test="${p.category=="cup"}">
                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                <form:option value="0.5L">0.5L</form:option>
                                <form:option value="0.75L">0.75L</form:option>
                                <form:option value="1L">1L</form:option>
                            </form:select>
                        </c:when>
                        <c:when test="${p.category == "straw"}">
                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                <form:option value="3 inches">3"</form:option>
                                <form:option value="5 inches">5"</form:option>
                                <form:option value="7 inches">7"</form:option>
                            </form:select>
                        </c:when>
                        <c:when test="${p.category == "toothbrush"}">
                            <form:select type="text" path="size" id="size" class="form-control input-sm">
                                <form:option value="kid">kids</form:option>
                                <form:option value="adult">adult</form:option>
                            </form:select>
                        </c:when>
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
                        <c:when test="${p.category=="cup"}">
                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                <form:option value="bamboo">Bamboo</form:option>
                                <form:option value="steel">Steel</form:option>
                                <form:option value="hard paper">Hard paper</form:option>
                            </form:select>
                        </c:when>
                        <c:when test="${p.category == "straw"}">
                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                <form:option value="bamboo">Bamboo</form:option>
                                <form:option value="steel">Steel</form:option>
                            </form:select>
                        </c:when>
                        <c:when test="${p.category == "toothbrush"}">
                            <form:select type="text" path="material" id="material" class="form-control input-sm">
                                <form:option value="bamboo">Bamboo</form:option>
                                <form:option value="wood">Wood</form:option>
                            </form:select>
                        </c:when>
                        <div class="has-error">
                            <form:errors path="material" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-actions floatRight">
                    <input type="submit" value="${action}" class="btn btn-primary btn-sm"/>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>



