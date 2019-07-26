<%@include file="z1JSP_setup.jsp" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>User Registration Form</title>
        <link href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    </head>

    <body>
        <%@include file="menu.jsp" %>
        <div class="generic-container">
            <div class="well lead">User Registration Form</div>
            <form:form action="${action}" method="POST" modelAttribute="customer" class="form-horizontal">
                <form:input type="hidden" path="customerId" id="id"/>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="firstName">First Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="fname" id="firstName" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="fname" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="lastName">Last Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="lname" id="lastName" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="lname" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="email">Email</label>
                        <div class="col-md-7">
                            <form:input type="text" path="email" id="email" class="form-control input-sm" />
                            <input type="text" name="oldemail" value="${customer.email}" hidden="true"/>
                            <div class="has-error">
                                <form:errors path="email" class="help-inline"/>
                                <span class="help-inline">${emailnotUnique}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="address">Address</label>
                        <div class="col-md-7">
                            <form:input type="text" path="address" id="address" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="address" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="phoneNumber">Phone Number</label>
                        <div class="col-md-7">
                            <form:input type="text" path="phoneNumber" id="phoneNumber" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="phoneNumber" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="save" class="btn btn-primary btn-sm"/> or <a href="<c:url value='${cancel}' />">Cancel</a>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>