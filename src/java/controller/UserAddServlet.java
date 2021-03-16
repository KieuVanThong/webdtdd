/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerClient.MD5Hashing;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserAddServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String position = "admin";
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String hash_pws = MD5Hashing.getMD5(password);
        try (PrintWriter out = response.getWriter()) {
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setAddress(address);
            user.setPosition(position);
            user.setUsername(username);
            user.setPassword(hash_pws);

            UserImpl dao = new UserImpl();
            List<User> list = new ArrayList<User>();
            boolean check = false;
            list = dao.getAllUser();
            for (int i = 0; i < list.size(); i++) {
                if (user.getUsername().equalsIgnoreCase(list.get(i).getUsername()) || user.getEmail().equalsIgnoreCase(list.get(i).getEmail())) {
                    session.setAttribute("wronger", "Username or Gmail da ton tai!");
                    RequestDispatcher view = request.getRequestDispatcher("/view/admin/user/add-user.jsp");
                    view.forward(request, response);
                } else {
                    check = true;
                }
            }
            if (check) {
                dao.addUser(user);
                Cart cart = new Cart();
                CartImpl daoCart = new CartImpl();
                cart.setUser(user);
                daoCart.addCart(cart);
                session.setAttribute("thanh_cong", "Thêm User thành công!");
                RequestDispatcher view = request.getRequestDispatcher("/view/admin/user/add-user.jsp");
                view.forward(request, response);
            }
        }
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
