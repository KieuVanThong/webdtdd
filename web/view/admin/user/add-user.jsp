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
        <!-- phai co link phia duoi nay nhe -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>

    </head>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="admin">
                    <a href="http://localhost:8084/Smartphone/DashboardAdminServlet"><i class="fa fa-wrench"></i> TrueMart</a>
                </div>

                <div class="dropdown">
                    <button class="dropbtn">Xin chào ${user.name} !
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
                <h2 align="center">Thêm User</h2>
                <div class="add-table">
                    <div class="hr">
                        <hr>
                    </div>
                    <form method="post" action="UserAddServlet">
                        <label >Name</label>
                        <input id="nameInput" type="text" name="name" required="">
                        <div class="hr">
                            <hr>
                        </div>
                        <label>Email</label>
                        <input id="phoneInput" placeholder="kí tự thường ,kí tự hoa,số,kí tự đặc biệt,ít nhất 8 kí tự" type="text" name="email" class="lock" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                        <div class="hr">
                            <hr>
                        </div>
                        <label>Address</label>
                        <input id="addressInput" type="text" name="address" class="lock">
                        <div class="hr">
                            <hr>
                        </div>
                        <label >Username</label>
                        <input id="usernameInput" type="text" name="username" required="">
                        <div class="hr">
                            <hr>
                        </div>
                        <label >Password</label>
                        <input id="passwordInput" placeholder="a123@gmail.com" type="password" name="password" class="lock" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                        <div class="hr">
                            <hr>
                        </div>
                        <p style="color: #f44336; size: 30px;">
                        <%
                            String ss=(String) session.getAttribute("wronger");
                            String tc=(String) session.getAttribute("thanh_cong");
                            if(ss!=null){
                                out.print(ss);
                                session.removeAttribute("wronger");
                            }
                            if(tc!=null){
                                out.print(tc);
                                 session.removeAttribute("thanh_cong");
                            }
                        %>
                        </p>
                        <input type="submit" id="submit" value="Add admin" >
                    </form>
                </div>

            </div>
        </div>
    </body>

</html>