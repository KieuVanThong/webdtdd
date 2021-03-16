<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Category List</title>
        <c:url value="/static/admin/css/admin.css" var="bootstrap"></c:url>
        <link href="${bootstrap}" rel="stylesheet" type="text/css" media="all">

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
                    <i class="fa fa-caret-down"></i>
                    </button>
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
            </div>
            <div class="content">
                <div class="table-container">
                    <div class="title">
                        <h3>List Category</h3>
                    </div>
                    <div class="table">
                        <table id="table"border = "1" style = "border-collapse: collapse;" width = "80%" align="center">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th colspan="2"><a href = "/Smartphone/view/admin/category/add-category.jsp">ADD NEW Category</a></th>
                            </tr>
                            <c:forEach items="${listCategory}" var="category" >
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.name}</td>
                                    <td><a href="http://localhost:8084/Smartphone/view/admin/category/CategoryServletEdit?categoryId=${category.id}"><i class="fa fa-edit"></i></a></td>
                                    <td><a href="http://localhost:8084/Smartphone/view/admin/category/CategoryServletRemove?categoryId=${category.id}"><i class="fa fa-remove"></i></a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>