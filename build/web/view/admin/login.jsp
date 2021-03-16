<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Welcome to shop</title>
        <c:url value="/static/client/css/login.css" var="logincss"></c:url>
        <link href="${logincss}" rel="stylesheet" type="text/css" media="all">

    </head>
    <body>
        <div class="main-container">
            <form method="post" action="UserServlet">
                <div class="imgcontainer" >
                    <c:url value="/static/client/images/slides/4.jpg" var="imagelogin"></c:url>
                    <img src="${imagelogin}" />
                    <h1>Welcome to !</h1>
                    <h3 style="color: red" style="padding: 20%">
                        <% 
                            String ses=(String)session.getAttribute("wrong");
                            if(ses!=null){
                                out.print(ses);
                            }
                            session.removeAttribute("wrong");
                        %>
                    </h3>
                </div>
                <div class="container">
                    <label ><b>Username</b></label>
                    <input type="text" placeholder="Username" id="usernameInput" name="username" required>

                    <label ><b>Password</b></label>
                    <input type="password" placeholder="Password" id="passwordInput" name="password" required>
                    
                    <div class="clearfix">
                        <button type="reset"class="cancelbtn">Cancel</button>
                        <button type="submit" class="signinbtn">Login</button>
                        <a href="http://localhost:8084/Smartphone/ForgotPassword" style="color: #f44336;text-decoration: none;">Forgot password</a>
                    </div>
                    <p>Quay lại trang chủ<a href="http://localhost:8084/Smartphone/DashboardServlet" style="color:red; size: 40px; text-decoration: none;">Exit</a></p>
                    <label>You do not an account? <a style="text-decoration: none;" href="http://localhost:8084/Smartphone/SignUp">Create now!</a></label>
                </div>
            </form>
        </div>
    </body>
</html>
