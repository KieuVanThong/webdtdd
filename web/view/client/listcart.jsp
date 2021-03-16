<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart</title>
        <script src="https://use.fontawesome.com/0cc436713d.js" crossorigin="anonymous"></script>

        <c:url value="/static/client/css/listorder.css" var="bootstrap"></c:url>
        <link href="${bootstrap}" rel="stylesheet" type="text/css" media="all">
    </head>

    <body>		
        <div class="popup_banner">
            <div class="banner_popup_area">
                <c:url value="/static/client/images/banners/pop-banner.jpg" var="bootstrap"></c:url>
                <img src="${bootstrap}" alt="" width="100%"/>
            </div>
        </div>
        <nav>
            <div class="img-nav">
                <a href="http://localhost:8084/Smartphone/DashboardServlet">
                    <c:url value="/static/client/images/logos/logo.png" var="bootstrap"></c:url>
                    <img style="height: 40px; margin-left: 100px;" src="${bootstrap}">
                </a>
            </div>
            <div class="content-nav">
                <ul>
                    <li><a href="http://localhost:8084/Smartphone/DashboardServlet">Home</a></li>
                    <li><a href="http://localhost:8084/Smartphone/ProductList">Shop</a></li>
                    <li><a href="http://localhost:8084/Smartphone/DashboardServlet">About us</a></li>
                    <li> <a href="http://localhost:8084/Smartphone/ListCartServlet">
                            <c:url value="/static/client/images/shopping-cart.png" var="bootstrap"></c:url>
                            <img  style="height: 20px;"src="${bootstrap}"/>
                        </a></li>
                </ul>
                <form action="ProductSearch" method="post">
                    <input type="text" name="txtSearch" placeholder="Search..." />
                    <input type="submit" value="Search">
                </form>
            </div>
            <div class="shop_option">
                <a  class="link" href="http://localhost:8084/Smartphone/LoginServlet">
                    <%
                        String name = (String) session.getAttribute("name");
                        if (name == null) {
                            out.print("Login");
                        }
                    %>
                </a>
                <a class="link" href="http://localhost:8084/Smartphone/SignUp">
                    <%
                        if (name == null) {
                            out.print("Sign up");
                        }
                    %>
                </a>
                <a class="link" href="">
                    <%
                        if (name != null) {
                            out.print("Xin chào:" + name);
                        }
                    %>
                </a>
                <a class="link" href="http://localhost:8084/Smartphone/LogoutServlet">
                    <%
                        if (name != null) {
                            out.print("Log out");
                        }
                    %>
                </a>
            </div> 
        </nav>
        <div class="banner">
            <div class="cart-text">
                <h3>CART</h3>
            </div>
        </div>
        <hr>

        <div class="table-block" style="overflow-x:auto;">
            <table class="table">
                <tr>
                    <th class="product-img">PRODUCT NAME </th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Amount</th>
                    <th></th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${listCart}" var="cart">
                    <tr>
                        <td>
                            <div>${cart.product.getName()}</div>
                        </td>
                        <td>
                            <div><img style="width: 50px;height: 50px; border-radius: 100%; object-fit: cover;" src="/Smartphone/static/admin/images/products/${cart.product.getImage()}" alt=""></div>
                        </td>
                        <td>
                            <div>${cart.product.getDesShort()}</div>
                        </td>
                        <td>
                            <div>${cart.product.getPrice()} VND</div>
                        </td>
                        <td>
                            <div><a href="http://localhost:8084/Smartphone/MinusServlet?procartId=${cart.id}" style="margin-right: 10px;">
                                    <i class="fa fa-minus"></i></a> ${cart.amount}
                                <a href="http://localhost:8084/Smartphone/PlusServlet?procartId=${cart.id}" style="margin-left: 10px;"><i class="fa fa-plus"></i></a></div>   
                        </td>
                        <td style="opacity: 0.5; color: red;">Still:${cart.product.getAmount()}</td>
                        
                        <td><a href="http://localhost:8084/Smartphone/ProCartRemoveServlet?procartId=${cart.id}"><i class="fa fa-close" ></i></a></td>
                    </tr>
                </c:forEach>
                <div style="color: red; font-size: 20px;">
                    <%
                        String wrong = (String) session.getAttribute("error");
                        if (wrong != null) {
                            out.print(wrong);
                        }
                        session.removeAttribute("error");
                    %>
                </div>
            </table>
        </div>
        <div class="payment">
            <div class="payment-price">
                <div class="payment-table">
                    <table style="width:60%;">
                        <tr style="height: 40px;">
                            <th>Sub total</th>
                            <td>${total} VND</td>
                        </tr>
                        <tr style="height: 40px;">
                            <th>Shipping</th>
                            <td>Free Shiping</td>
                        </tr>
                        <tr style="height: 40px;">
                            <th>Total:</th>
                            <td>${total} VND</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="payment-btn">
                <a href="http://localhost:8084/Smartphone/OrderServlet"><button>Order</button></a>
            </div>
        </div>
        <div class="footer">
            <div class="footer-content">
                <a href="http://localhost:8084/Smartphone/ListCartServlet">
                    <p>Payment</p>
                </a>

                <a href="http://localhost:8084/Smartphone/ProductList">
                    <p>Shipping</p>
                </a>

                <a href="http://localhost:8084/Smartphone/DashboardServlet">
                    <p>About</p>
                </a>

            </div>
            <div class="footer-content">
                <h4>Stay Connected</h4>
                <a href="https://www.facebook.com/"><p>Facebook<p></a>
                <a href="https://www.instagram.com/"><p>Instagram<p></a>
            </div>
            <div class="footer-content">
                <h5>&copy;QDND</h5>
            </div>
        </div>
    </body>
</html>