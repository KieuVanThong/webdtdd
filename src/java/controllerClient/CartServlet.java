/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerClient;

import controller.CartImpl;
import controller.CategoryImpl;
import controller.ProCartImpl;
import controller.ProductImpl;
import controller.UserImpl;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.ProCart;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
public class CartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        String productId = request.getParameter("productId");
        if (name == null) {
            RequestDispatcher view = request.getRequestDispatcher("/view/admin/login.jsp");
            view.forward(request, response);
        } else if (name != null) {
            ProCart procart = new ProCart();
            ProCartImpl daoProCart = new ProCartImpl();

            Cart cart = new Cart();
            CartImpl daoCart = new CartImpl();
            cart = daoCart.getCartByUser(name);
            //         User user = new User();
            //         UserImpl daoUser = new UserImpl();
            //          user = daoUser.getUserByName(name);
            //          cart.setUser(user);

            procart.setCart(cart);

//            Category category = new Category();
//            CategoryImpl daoCategory = new CategoryImpl();
//            category = daoCategory.getCategoryByProduct(Integer.parseInt(productId));
            Product product = new Product();
            ProductImpl daoProduct = new ProductImpl();

//            product.setCategory(category);
            product = daoProduct.getProductById(Integer.parseInt(productId));
            procart.setProduct(product);

            ProCart pro = new ProCart();
            pro = daoProCart.getProCartByProductId(Integer.parseInt(productId), name);
            if (pro.getAmount() >= 1) {
                procart.setId(pro.getId());
                if (pro.getAmount() == pro.getProduct().getAmount()) {
                    session.setAttribute("error1", "Products in stock have been exhausted!");
                } else {
                    procart.setAmount(pro.getAmount() + 1);
                    daoProCart.editProCartByProductId(procart);
                }
            } else {
                procart.setAmount(1);
                daoProCart.addProCart(procart);
            }
            RequestDispatcher view = request.getRequestDispatcher("/ProductList");
            view.forward(request, response);
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
