/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerClient;

import controller.BillImpl;
import controller.CartImpl;
import controller.OrderImpl;
import controller.ProCartImpl;
import controller.ProductImpl;
import controller.UserImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.Cart;
import model.Order;
import model.ProCart;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BillAddServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        if (name == null) {
            RequestDispatcher view = request.getRequestDispatcher("/view/admin/login.jsp");
            view.forward(request, response);
        } else if (name != null) {
            Bill bill = new Bill();
            BillImpl daoBill = new BillImpl();

            User user = new User();
            UserImpl daoUser = new UserImpl();
            user = daoUser.getUserByName(name);
            bill.setUser(user);

            Cart cart = new Cart();
            CartImpl daoCart = new CartImpl();
            cart = daoCart.getCartByUser(name);
            cart.setUser(user);

            Order order = new Order();
            OrderImpl daoOrder = new OrderImpl();
            order.setCart(cart);
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            order.setDateOder(date);
            daoOrder.addOrder(order);

            //Order ord = new Order();
            //ord = daoOrder.getOrderByUser(name);
            bill.setOrder(order);

            int cod = (int) Math.floor(((Math.random() * 899999) + 100000));
            String code = Integer.toString(cod);
            bill.setCode(code);

            String status = "chua thanh toan";
            bill.setStatus(status);

            long day = System.currentTimeMillis();
            java.sql.Date datePay = new java.sql.Date(day + (24 * 60 * 60 * 1000 * 7));
            bill.setDatePay(datePay);

            Product product = new Product();
            ProductImpl daoProduct = new ProductImpl();

            List<ProCart> listprocart = new ArrayList<ProCart>();
            ProCartImpl daoProCart = new ProCartImpl();
            listprocart = daoProCart.getListProCartByUser(name);
            
            for (int i = 0; i < listprocart.size(); i++) {
                ProCart procart = listprocart.get(i);
                int productId = procart.getProduct().getId();
                product = daoProduct.getProductById(productId);
                if (product.getAmount() > procart.getAmount()) {
                    product.setAmount(product.getAmount() - procart.getAmount()); 
                    daoProduct.editAmountProduct(product);
                }
            }
            daoBill.addBill(bill);
        }
        RequestDispatcher view = request.getRequestDispatcher("/OrderServlet");
        view.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
