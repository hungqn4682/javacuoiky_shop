/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.DAO;

import com.mycompany.qlbanhang.Model.order_detail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author The Bigger
 */
public class order_detailDAO {
 public static int themCthd(Connection conn, order_detail cthd) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO order_detail (`order_id`, `product_id` , `quantity`, `price`) VALUES (?, ?, ?, ?);";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cthd.getOrder_id());
            stmt.setInt(2, cthd.getProduct_id());
            stmt.setInt(3, cthd.getQuantity());
            stmt.setInt(4, cthd.getPrice());
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
     return 0;
    }
   
}
