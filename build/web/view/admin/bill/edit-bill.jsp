<%-- 
    Document   : edit-bill
    Created on : Dec 9, 2020, 5:58:43 PM
    Author     : ADMIN
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Bill</title>
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
                <button class="dropbtn"><span style="color: cyan">Hello</span>${sessionScope.name}
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
                    <h3>Edit Bill</h3>
                </div>
                <div class="table">
                    <form method="POST" action="EditBillAction">
                        <h1 align="center">Edit Bill</h1>
                        <table>
                            <tr>
                                <td>ID</td>
                                <td><input type="text" name="id" value = "${billUpdate.id}" readonly="true"></td>
                            </tr>

                            <tr>
                                <td>IDUser </td>
                                <td><input type="text" name="userId" value = "${billUpdate.user.getId()}" readonly="true"></td>
                            </tr>
                            <tr>
                                <td>IdOrder </td>
                                <td><input type="text" name="orderId" value = "${billUpdate.order.getId()}" readonly="true"></td>
                            </tr>
                            <tr>
                                <td>Code </td>
                                <td><input type="text" name="code" value = "${billUpdate.code}" readonly="true"></td>
                            </tr>

                            <tr>
                                <td>Date Pay </td>
                                <td><input type="text" name="datePay" value = "${billUpdate.datePay}" readonly="true"</td>
                            </tr>

                            <tr>
                                <td>Status </td>
                                <td><input type="text" name="status" value = "${billUpdate.status}" ></td>
                            </tr>
                        </table>
                        <input align="center" type="submit" value="Edit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
