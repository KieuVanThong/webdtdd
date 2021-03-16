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
import java.util.ArrayList;
import model.Bill;
import model.ProCart;
import model.User;

/**
 *
 * @author ADMIN
 */
public class BillImpl extends dao.DAO {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public BillImpl() {
        super();
    }

    public Bill getBillId(int key) {
        Bill bill = new Bill();
        String sql = "SELECT *from bill where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                bill.setId(rs.getInt("id"));
                User user = new User();
                UserImpl userImpl = new UserImpl();
                user = userImpl.getUserById(rs.getInt("userId"));
                bill.setUser(user);

                Order order = new Order();
                OrderImpl orderImpl = new OrderImpl();
                order = orderImpl.getOrderById(rs.getInt("orderId"));
                
                bill.setOrder(order);

                bill.setCode(rs.getString("code"));
                bill.setDatePay(rs.getDate("datePay"));
                bill.setStatus(rs.getString("status"));
                bill.setTotal(order.getTotal());
            }
        } catch (Exception e) {
        }
        return bill;
    }
    public ArrayList<model.Bill> getAllBill() {
        ArrayList<model.Bill> result = new ArrayList<model.Bill>();

        String sql = "SELECT * from bill"; 
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                model.Bill bill = new model.Bill();
                bill.setId(rs.getInt("id"));
                User user = new User();
                UserImpl userImpl = new UserImpl();
                user = userImpl.getUserById(rs.getInt("userId"));
                bill.setUser(user);
                
                Order order = new Order();
                OrderImpl orderImpl = new OrderImpl();
                order = orderImpl.getOrderById(rs.getInt("orderId"));
                bill.setOrder(order);
                
                bill.setCode(rs.getString("code"));
                bill.setDatePay(rs.getDate("datePay"));
                bill.setStatus(rs.getString("status"));
                bill.setTotal(order.getTotal());
                result.add(bill);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public void editBill(model.Bill Bill) {
        String sql = "UPDATE bill SET userId=?,orderId=?, code=?, datePay=?, status=? WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Bill.getUser().getId());
            ps.setInt(2, Bill.getOrder().getId());
            ps.setString(3, Bill.getCode());
            ps.setString(4, sdf.format(Bill.getDatePay()));
            ps.setString(5, Bill.getStatus());;
            ps.setInt(6, Bill.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addBill(Bill bill) {
        String sql = "INSERT INTO bill(userId, orderId, code,datePay,status) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, bill.getUser().getId());
            ps.setInt(2, bill.getOrder().getId());
            ps.setString(3, bill.getCode());
            ps.setDate(4, (Date) bill.getDatePay());
            ps.setString(5,bill.getStatus());

            ps.executeUpdate();

            //get id of the new inserted ProCart
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                bill.setId(generatedKeys.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
