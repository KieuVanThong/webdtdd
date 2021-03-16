<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
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
                        <h3>List Product</h3>
                    </div>
                    <div class="table">
                        <table id="table">
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Description Short</th>
                                <th>Date Add</th>
                                <th colspan="2"><a href = "http://localhost:8084/Smartphone/ProductAdd">ADD Product</a></th>
                            </tr>
                            <c:forEach items="${listProduct}" var="product" >
                                <tr>
                                    <td>${product.id}</td>
                                    <td data-label="Hình ảnh" style="text-align: center;"><img style="width: 50px;height: 50px; border-radius: 100%; object-fit: cover;" src="/Smartphone/static/admin/images/products/${product.image}" alt=""></td>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.amount}</td>
                                    <td>${product.desShort}</td>
                                    <td>${product.dateAdd}</td>
                                    <td><a href="http://localhost:8084/Smartphone/view/admin/product/ProductServletEdit?productId=${product.id}"><i class="fa fa-edit"></i></a></td>
                                    <td><a href="http://localhost:8084/Smartphone/view/admin/product/ProductServletRemove?productId=${product.id}"><i class="fa fa-remove"></i></a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>