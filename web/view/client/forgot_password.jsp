<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password</title>
        <c:url value="/static/client/css/login.css" var="logincss"></c:url>
        <link href="${logincss}" rel="stylesheet" type="text/css" media="all">
    </head>
    <body>
        <div class="main-container">
            <form method="post" action="SendMailPassword">
                <div class="imgcontainer" >
                    <c:url value="/static/client/images/slides/4.jpg" var="imagelogin"></c:url>
                    <img src="${imagelogin}" />
                    <h3 style="color: red" style="padding: 20%">${sessionScope.wrong}</h3>
                </div>
                <div class="container">
                    <label ><b>Nhập Email</b></label>
                    <input type="text" placeholder="Email" name="emailUser" required>
                    <div class="clearfix">
                        <button type="reset"class="cancelbtn">Cancel</button>
                        <button type="submit" class="signinbtn">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
