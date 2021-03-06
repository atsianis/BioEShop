<%@include file="z1JSP_setup.jsp" %>
<html>
    <head>
        <%@include file="z2HTML_Head.jsp" %>
        
        <!-- Our CSS -->
        <style type="text/css">
            .login-form {
                width: 340px;
                margin: 50px auto;
            }

            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }

            .login-form h2 {
                margin: 0 0 15px;
            }

            .form-control,
            .btn {
                min-height: 38px;
                border-radius: 2px;
            }

            .btn {
                font-size: 15px;
                font-weight: bold;
            }

            body {
                background-image: url("${pageContext.request.contextPath}/static/img/tim-foster-CEoJe2ppaoo-unsplash.jpg");
                height: 500px;
                background-color: #cccccc;
                /* https://images.unsplash.com/photo-1513348948756-10ae41beac98?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80 */
            }
        </style>
    </head>
    <body>

        <!-- login form -->
        <div class="login-form">
            <c:url var="loginUrl" value="/login" />
            <form action="${loginUrl}" method="post">

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        <p>Invalid username and password.</p>
                    </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-success">
                        <p>You have been logged out successfully.</p>
                    </div>
                </c:if>

                <h2 class="text-center">Log in</h2>
                <div class="form-group">
                    <label class="input-group-addon" for="username"> <!-- <i class="fa fa-user"> --></i></label>
                    <input type="text" class="form-control" id="username" name="ssoId" placeholder="Username" required>
                </div>
                <div class="form-group">
                    <label class="input-group-addon" for="password"> <!-- <i class="fa fa-lock"> --></i></label> 
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-group input-sm">
                    <div class="checkbox">
                        <label><input type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />

                <div class="form-actions">
                    <input type="submit" class="btn btn-block btn-success btn-lg btn-default" value="Log in">
                </div>
                
                <div class="form-group">
                    <p class="text-center "><a style="color: #5cb85c" href="/BioEShop/register">Create an Account</a></p>
                </div>
                <div class="form-group">
                    <p class="text-center "><a style="color: #5cb85c" href="/BioEShop/categories/">Home</a></p>
                </div>




            </form>

        </div>
        <!-- end login form -->

    </body>
    
</html>