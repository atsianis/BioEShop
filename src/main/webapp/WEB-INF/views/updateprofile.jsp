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
                border: 1px solid black;
                padding:10px;
                margin: 0 10px;
                border-radius:10px;
            }
        </style>
    </head>

    <body>
        <%@include file="z5HTML_NavBar_Menu.jsp" %>
        <div class="container myinfo">
            <div class="title">Edit Profile</div>
            <div class="row">
                <div class='col-md-3'>
                    <div class="card">
                        <a href="/BioEShop/user/profile/myorders" class="btn btn-outline-dark ">My orders</a>
                        <a href="/BioEShop/products/" class="btn btn-outline-dark ">Shop now</a>
                        <a href="/BioEShop/chat" class="btn btn-outline-dark ">Chat</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <form:form action="${action}" method="POST" modelAttribute="customer" class="form-horizontal">
                        <form:input type="hidden" path="customerId" id="id"/>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="fname">First Name</label>
                                <form:input type="text" path="fname" id="fname" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="fname" class="help-inline"/>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lname">Last Name</label>
                                <form:input type="text" path="lname" id="lname" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="lname" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="email">Email</label>
                                <input hidden="true" type="text" name="oldemail" value="${customer.email}"/>
                                <form:input type="text" path="email" id="email" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="email" class="help-inline"/>
                                    <span class="help-inline">${emailnotUnique}</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="address">Address</label>
                                <form:input type="text" path="address" id="address" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="address" class="help-inline"/>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="number">Phone Number</label>
                                <form:input type="text" path="phoneNumber" id="number" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="phoneNumber" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                            
                        
                        <div class="form-group">
                            <div class="form-actions floatRight">
                                <form:button type="submit" value="save" class="btn btn-primary btn-sm">Save</form:button> or <a href="<c:url value='${cancel}' />">Cancel</a>
                            </div>
                        </div>
                    </form:form>
                </div>

                

                <!--                        <div class="row">
                                            <div class="form-actions floatRight">
                                                <input type="submit" value="save" class="btn btn-primary btn-sm"/> or <a href="<c:url value='${cancel}' />">Cancel</a>
                                            </div>
                                        </div>-->

            </div>
        </div>
    </body>
</html>