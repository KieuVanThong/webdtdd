<%-- 
    Document   : list-bill
    Created on : Dec 9, 2020, 5:58:10 PM
    Author     : ADMIN
--%>
<%@page import="controller.ProductImpl"%>
<%@page import="controller.CategoryImpl"%>
<%@page import="model.Category"%>
<%@page import="controller.BillImpl"%>
<%@page import="model.Bill"%>
<%@page import="model.User"%>
<%@page import="controller.UserImpl"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bill List</title>
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
                        <h3>List Bill</h3>
                    </div>
                    <div class="table">
                        <table id="table" border = "1" style = "border-collapse: collapse;" width = "80%" align="center">
                            <tr>
                                <th>STT</th>
                                <th>Code Bill</th>
                                <th>Name Customer</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Name Product</th>
                                <th>Image Product</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Date Pay</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Edit Bill</th>
                            </tr>
                            <c:forEach items="${listBill}" var="bill">
                                <tr>
                                    <td>${bill.id}</td>
                                    <td>${bill.code}</td>
                                    <td>${bill.user.getName()}</td>
                                    <td>${bill.user.getEmail()}</td>
                                    <td>${bill.user.getAddress()}</td>

                                    <td>
                                        <c:forEach items="${bill.order.cart.getListProCarts()}" var="procart" >
                                            <div> ${procart.product.getName()}</div>
                                        </c:forEach>
                                    </td>
                                    <td data-label="Hinh anh" style="text-align: center;">
                                        <c:forEach items="${bill.order.cart.getListProCarts()}" var="procart" >
                                            <div><img style="width: 50px;height: 50px; border-radius: 100%; object-fit: cover;" src="/Smartphone/static/admin/images/products/${procart.product.getImage()}" alt=""></div>
                                            </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${bill.order.cart.getListProCarts()}" var="procart" >
                                            <div> ${procart.product.getPrice()}</div>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${bill.order.cart.getListProCarts()}" var="procart" >
                                            <div> ${procart.amount}</div>
                                        </c:forEach>
                                    </td>
                                    <td>${bill.datePay}</td>
                                    <td>${bill.total}</td>
                                    <td>${bill.status}</td>
                                    <td><a href="http://localhost:8084/Smartphone/view/admin/bill/BillServletEdit?billId=${bill.id}"><i class="fa fa-edit"></i></a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
