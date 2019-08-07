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
            <h2 class="title">Edit Profile</h2>
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
                                <label class="text-success font-weight-bold" for="fname">First Name</label>
                                <form:input type="text" path="fname" id="fname" class="form-control"
                                            required="true" placeholder="Maria" minlength="3"/>
                                <div class="has-error">
                                    <form:errors path="fname" class="help-inline"/>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="text-success font-weight-bold" for="lname">Last Name</label>
                                <form:input type="text" path="lname" id="lname" class="form-control"
                                            required="true" placeholder="Papadopoulou" minlength="3"/>
                                <div class="has-error">
                                    <form:errors path="lname" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="text-success font-weight-bold" for="email">Email</label>
                                <input hidden="true" type="text" name="oldemail" value="${customer.email}"/>
                                <form:input type="email" path="email" id="email" class="form-control"
                                            required="true" placeholder="maria.pap@example.com" minlength="3"/>
                                <div class="has-error">
                                    <form:errors path="email" class="help-inline"/>
                                    <span class="help-inline">${emailnotUnique}</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="text-success font-weight-bold" for="address">Address</label>
                                <form:input type="text" path="address" id="address" class="form-control" 
                                            required="true" placeholder="Somewhere in the universe str, 17854, City, Country, Wolrd" minlength="10"/>
                                <div class="has-error">
                                    <form:errors path="address" class="help-inline"/>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="text-success font-weight-bold" for="number">Phone Number</label>
                                <form:input type="number" path="phoneNumber" id="number" class="form-control"
                                            required="true" min="6950000000" max="6999999999" placeholder="6979696969"/>
                                <div class="has-error">
                                    <form:errors path="phoneNumber" class="help-inline"/>
                                </div>
                            </div>
                        </div>
                            
                        
                        <div class="form-group">
                            <div class="form-actions floatRight">
                                <form:button type="submit" value="save" class="btn btn-success">Save</form:button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
        </div>
        <%@include file="z5HTML_Footer.jsp" %>
    </body>
</html>