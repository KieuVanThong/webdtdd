<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
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
            <div class="add-content">

                <br>
                <h2 align="center">Edit Product</h2>
                <div class="add-table">
                    <div class="hr">
                        <hr>
                    </div>
                    <form method="POST" action="ProductServletAction">

                        <h1 align="center">Edit Product</h1>
                        <table>
                            <tr>
                                <td>ID: </td>
                                <td><input type="text" name="id" value = "${productUpdate.id}" readonly="true"></td>
                            </tr>
                            <tr>
                                <td>IDCategory: </td>
                                <td><input type="text" name="categoryId" value = "${productUpdate.category.getId()}"></td>
                            </tr>
                            <tr>
                                <td>Image </td>
                                <td><input type="text" name="image" value = "${productUpdate.image}"></td>
                            </tr>
                            <tr>
                                <td>Name: </td>
                                <td><input type="text" name="name" value = "${productUpdate.name}"></td>
                            </tr>
                            <tr>
                                <td>Amount: </td>
                                <td><input type="text" name="amount" value = "${productUpdate.amount}"</td>
                            </tr>
                            <tr>
                                <td>Price </td>
                                <td><input type="text" name="price" value = "${productUpdate.price}"></td>
                            </tr>
                            <tr>
                                <td>Description Short: </td>
                                <td><input type="text" name="desShort" value = "${productUpdate.desShort}"></td>
                            </tr>
                            <tr>
                                <td>Date Add </td>
                                <td><input type="text" name="dateAdd" value = "${productUpdate.dateAdd}"></td>
                            </tr>
                        </table>
                        <input type="submit" value="Edit">
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>