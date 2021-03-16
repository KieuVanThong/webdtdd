<%-- 
    Document   : signup
    Created on : Nov 15, 2020, 2:15:08 AM
    Author     : Admin
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <c:url value="/static/client/css/signup.css" var="logincss"></c:url>
        <link href="${logincss}" rel="stylesheet" type="text/css" media="all">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    </head>
    <body>
        <form style="border:1px solid #ccc" action="signUpServlet" method="POST">
            <div class="container">
                <c:url value="/static/client/images/slides/4.jpg" var="imagelogin"></c:url>
                <img src="${imagelogin}" />
                <h1><span style="color: red"> Sign Up!</h1>
                <p>Please fill in your information!</p>
                <p style="color: #f44336; size: 30px;">                     <%
                    String wr=(String)session.getAttribute("wronger");
                    if(wr!=null){
                        out.print(wr);
                        session.removeAttribute("wronger");
                    }
                %></p>
                <hr>
                <label ><b>Username</b></label>
                <input id="usernameInput" type="text" placeholder="Tên đăng nhập" name="username" required>

                <label ><b>Password</b></label>
                <input id="passwordInput" type="password" placeholder="kí tự thường ,kí tự hoa,số,kí tự đặc biệt,ít nhất 8 kí tự" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">

                <label><b>Name</b></label>
                <input id="nameInput" type="text" placeholder="Họ tên" name="name" required>

                <label ><b>Address</b></label>
                <input id="addressInput" type="text" placeholder="Địa chỉ" name="address" required>

                <label ><b>Email</b></label>
                <input id="phoneInput" type="text" placeholder="a123@gmail.com" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                <p>Bằng việc đăng kí, Bạn đã đồng ý với Shop về <a href="http://localhost:8084/Smartphone/LoginServlet" style="color:red">Điều khoản dịch vụ & Chính sách bản mật</a>.</p>
                <p>Nếu bạn chưa đồng ý <a href="http://localhost:8084/Smartphone/DashboardServlet" style="color:red; size: 40px;">Exit</a>.</p>
                <div class="clearfix">
                    <button type="reset" class="cancelbtn" >Cancel</button>
                    <button type="submit" class="signupbtn" >Sign Up</button>
                </div>
            </div>
        </form>
    </body>
</html>
