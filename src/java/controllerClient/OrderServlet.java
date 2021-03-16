/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerClient;

import controller.CartImpl;
import controller.OrderImpl;
import controller.ProCartImpl;
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
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderServlet extends HttpServlet {

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
            List<ProCart> listProCart = new ArrayList<ProCart>();
            ProCartImpl daoProCart = new ProCartImpl();

            listProCart = daoProCart.getListProCartByUser(name);
            request.setAttribute("listCart", listProCart);
            request.setAttribute("nameU", name);

            User user = new User();
            UserImpl daoUser = new UserImpl();
            user = daoUser.getUserByName(name);
            request.setAttribute("address", user.getAddress());

            Order order = new Order();
            OrderImpl daoOrder = new OrderImpl();

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            order.setDateOder(date);
            request.setAttribute("dateOrder", order.getDateOder());

            java.sql.Date datePay = new  java.sql.Date( millis +(24*60*60*1000*7));
            Bill bill=new Bill();
            bill.setDatePay(datePay);
            request.setAttribute("datePay", bill.getDatePay());

            Cart c = new Cart();
            c.setListProCarts(listProCart);
            long sum = 0;
            for (int i = 0; i < listProCart.size(); i++) {
                ProCart proCart = listProCart.get(i);
                sum += proCart.getAmount() * proCart.getProduct().getPrice();
            }
            request.setAttribute("total", sum);
        }
        RequestDispatcher view = request.getRequestDispatcher("/view/client/order.jsp");
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
