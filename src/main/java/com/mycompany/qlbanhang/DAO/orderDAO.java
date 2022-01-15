/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.qlbanhang.DAO;

import com.mycompany.qlbanhang.Model.order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author The Bigger
 */
public class orderDAO {

    public static int themOrder(Connection conn, order od) throws SQLException {
        PreparedStatement stmt = null;
        String sql = "INSERT INTO order (`name`, `phone`, `address`, `email`, `note` , `total`) VALUES (?, ?, ?, ?, ?, ?);";
        try {
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, od.getName());
            stmt.setString(2, od.getPhone());
            stmt.setString(3, od.getAddress());
            stmt.setString(4, od.getEmail());
            stmt.setString(4, od.getNote());
            stmt.setInt(4, od.getTotal());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

}
