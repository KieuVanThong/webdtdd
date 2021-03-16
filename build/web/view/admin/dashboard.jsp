<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Dashboard</title>
        <c:url value="/static/admin/css/admin.css" var="dashboard"></c:url>
        <link href="${dashboard}" rel="stylesheet" type="text/css" media="all">
        <script src="https://use.fontawesome.com/0cc436713d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="admin">
                    <a href="http://localhost:8084/Smartphone/DashboardAdminServlet"><i class="fa fa-wrench"></i> TrueMart</a>
                </div>
                <div class="dropdown">
                    <button class="dropbtn"><span style="color: cyan">Hello</span>${sessionScope.name}<i class="fa fa-caret-down"></i></button>
                    <div class="dropdown-content">
                        <a href="http://localhost:8084/Smartphone/LogoutServlet">Log out</a>
                    </div>
                </div>
            </div>
            <div class="sidenav">
                <a href="http://localhost:8084/Smartphone/view/admin/user/UserServletList"><div><p class="nav-text">User <i class="ikon fa fa-user"></i></p></div></a>                  
                <a href="http://localhost:8084/Smartphone/view/admin/category/CategoryServlet"><div><p class="nav-text">Category <i class="ikon fa fa-list-alt" aria-hidden="true"></i></p></div></a> 
                <a href="http://localhost:8084/Smartphone/view/admin/product/ProductServlet"><div><p class="nav-text">Product <i class="ikon fa fa-product-hunt"></i></p></div></a>  
                <a href="http://localhost:8084/Smartphone/view/admin/bill/BillServlet"><div><p class="nav-text">Bill <i class="ikon fa fa-shopping-cart"></i></p></div></a>
                <div class="content">
                </div>
            </div>
        </div>
    </body>
</html>