/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static dao.DAO.con;
import java.sql.Date;
import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import model.Cart;

/**
 *
 * @author ADMIN
 */
public class OrderImpl extends dao.DAO {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public OrderImpl() {
        super();
    }

    public Order getOrderById(int key) {
        Order order = new Order();
        String sql = "SELECT * from `order` where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order.setId(rs.getInt("id"));
                Cart cart = new Cart();
                CartImpl cartImpl = new CartImpl();
                cart = cartImpl.getCartById(rs.getInt("cartId"));
                order.setCart(cart);
                order.setDateOder(rs.getDate("dateOrder"));
                order.setTotal(cart.getTotal());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public Order getOrderByUser(String key) {
        Order order = new Order();
        String sql = "SELECT ord.id,ord.cartId,ord.dateOrder FROM \n"
                + "mywebsite.order ord,cart c,user u where ord.cartId=c.id\n"
                + "and c.userId=u.id  and u.name='?' and ord.id=(SELECT Max(ord.id) from  mywebsite.order ord)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order.setId(rs.getInt("id"));
                Cart cart = new Cart();
                CartImpl cartImpl = new CartImpl();
                cart = cartImpl.getCartById(rs.getInt("cartId"));
                order.setCart(cart);
                order.setDateOder(rs.getDate("dateOrder"));
                order.setTotal(cart.getTotal());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    public void addOrder(Order order) {
        String sql = "INSERT INTO mywebsite.order(cartId,dateOrder) VALUES(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getCart().getId());
            ps.setDate(2, (Date) order.getDateOder());
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                order.setId(generatedKeys.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
