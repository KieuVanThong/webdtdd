<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shop</title>
        <script src="https://use.fontawesome.com/0cc436713d.js"></script>
        <c:url value="/static/client/css/shop.css" var="bootstrap"></c:url>
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
                <a href="http://localhost:8084/Smartphone/view/client/dashboard.jsp">
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
        <div class="content">
            <div class="san-pham">
                <div class="loai-san-pham">
                    <br>
                    <a href="http://localhost:8084/Smartphone/ProductList">
                        <h2>LIST PRODUCT
                            <hr>
                        </h2>
                    </a>
                </div>
                <div class="ds-dien-thoai">
                    <c:forEach items="${search}" var="product">
                        <div class="dien-thoai ">
                            <div class="sub-dien-thoai ">
                                <div class="img-dien-thoai ">
                                    <img  class="img-prd"src="/Smartphone/static/admin/images/products/${product.image}" alt="">
                                </div>
                                <div class="ten-dien-thoai ">${product.name}</div>
                            </div>
                            <div class="gia "><b>${product.price}</b></div>
                            <div class="cart"> <a href="http://localhost:8084/Smartphone/CartServlet?productId=${product.id}">Cart</a></div>
                        </div>
                    </c:forEach>
                </div>
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
        </div>    </div>
</body>

</html>
