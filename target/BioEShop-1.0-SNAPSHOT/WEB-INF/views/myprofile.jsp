<%-- 
    Document   : myprofile
    Created on : Jul 24, 2019, 11:10:03 PM
    Author     : giorgos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' />" rel="stylesheet"></link>
    </head>
    <body>
        <%@include file="authheader.jsp" %>
        <%@include file="menu.jsp" %>
        <h1>Hello World!</h1>
        <div class="generic-container">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><span class="lead">My Profile </span></div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Phone number</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${customer.fname}</td>
                            <td>${customer.lname}</td>
                            <td>${customer.email}</td>
                            <td>${customer.address}</td>
                            <td>${customer.phoneNumber}</td>
                        </tr>
                    </tbody>
                </table>
                <sec:authorize access="hasRole('ADMIN')">
                    <div><a href="<c:url value='/admin/customers/update/${customer.customerId}' />" class="btn btn-success custom-width">Update info</a></div>
                    <div><a href="<c:url value='/admin/customers/delete/${customer.customerId}' />" class="btn btn-success custom-width">Delete customer</a></div>
                </sec:authorize>
                <sec:authorize access="hasRole('USER')">
                    <div><a href="<c:url value='/profile/update/${customer.customerId}' />" class="btn btn-danger custom-width">Update info</a></div>
                </sec:authorize>
            </div>
        </div>
    </body>
</html>
