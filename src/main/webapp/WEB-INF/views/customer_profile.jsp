<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        <!-- Our CSS -->
        <link href="<c:url value='/static/css/app.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/contact.css' />" type="text/css" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/style.css' />" type="text/css" rel="stylesheet"></link>
        <style>
            body {
                background-color: lightgoldenrodyellow;
            }
            .title{
                display:flex;
                justify-content: center;
            }
            .myinfo{
                background-color: lightgoldenrodyellow;
                display:flex;
                flex-direction: column;
                justify-content: center;
                align-items: stretch;
            }
            form{
                padding:10px;
                margin: 0 10px;
                border-radius:10px;
            }
        </style>
    </head>
    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <div class="container myinfo">
            <div style="padding: 15px 0;">
                <!-- Default panel contents -->
                <div>${success}</div>
                <div class='title'>

                    <sec:authorize access="hasRole('ADMIN')">
                        <c:if test="${adminForAdmin}">
                            <div class="row"><h2>My Profile </h2></div>
                        </c:if>
                        <c:if test="${!adminForAdmin}">
                            <div class="row"><h2>Customer Profile </h2></div>
                        </c:if>
                    </sec:authorize>
                    <sec:authorize access="hasRole('USER')">
                        <div class="row"><h2>My Profile </h2></div>
                    </sec:authorize> 
                </div>
                <div class='row'>
                    <div class='col-md-3'>
                        <div class="card">
                            <a href="/BioEShop/user/profile/myorders" class="btn btn-outline-dark ">My orders</a>
                            <a href="/BioEShop/products/" class="btn btn-outline-dark ">Shop now</a>
                            <a href="/BioEShop/chat" class="btn btn-outline-dark ">Chat</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <form>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-success font-weight-bold" for="fname">First Name</label>
                                    <input disabled="true" type="text" class="form-control" id="fname" value="${customer.fname}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="text-success font-weight-bold" for="lname">Last Name</label>
                                    <input disabled="true" type="text" class="form-control" id="lname" value="${customer.lname}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-success font-weight-bold" for="email">Email</label>
                                    <input disabled="true" type="email" class="form-control" id="email" value="${customer.email}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label class="text-success font-weight-bold" for="address">Address</label>
                                    <input disabled="true" type="text" class="form-control" id="address" value="${customer.address}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="text-success font-weight-bold" for="number">Phone Number</label>
                                    <input disabled="true" type="text" class="form-control" id="number" value="${customer.phoneNumber}">
                                </div>
                            </div>

                            <sec:authorize access="hasRole('ADMIN')">
                                <c:if test="${adminForAdmin}">
                                    <div><a href="<c:url value='/admin/profile/update'/>" class="btn btn-success custom-width">Edit info</a></div>
                                </c:if>
                                <c:if test="${!adminForAdmin}">
                                    <div><a href="<c:url value='/admin/customers/update/${customer.customerId}' />" class="btn btn-success custom-width">Edit info</a></div>
                                </c:if>

                            </sec:authorize>
                            <sec:authorize access="hasRole('USER')">
                                <div><a href="<c:url value='/user/profile/update'/>" class="btn btn-success custom-width">Edit info</a></div>
                            </sec:authorize>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="z5HTML_Footer.jsp" %>

        <%@include file="z4scriptsBeforeBody.jsp" %>
    </body>
</html>
