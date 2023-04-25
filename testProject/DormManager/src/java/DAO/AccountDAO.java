/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO extends DBConnect {

    ResultSet rs;
    PreparedStatement ps;

    public Account login(String email, String pass) throws SQLException {
        String sql = "SELECT accountId,email,fullname,gender,balance,rollNumber FROM [OCD_DB].[dbo].[Account] where email='" + email + "' and password='" + pass + "'";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4) == true ? "Male" : "Female", rs.getLong(5), rs.getString(6));
        }
        return null;
    }
    public Account getAccount(int aid) throws SQLException {
        String sql = "SELECT accountId,email,fullname,gender,balance,rollNumber FROM [OCD_DB].[dbo].[Account] where accountId=?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, aid);
        rs = ps.executeQuery();
        if (rs.next()) {
            return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4) == true ? "Male" : "Female", rs.getLong(5), rs.getString(6));
        }
        return null;
    }

    public boolean register(String email, String password, String fullname, boolean gender) {
        String sql = "INSERT INTO [dbo].[Account]([email],[password],[fullname],[gender],[balance])\n"
                + "     VALUES(?,?,?,?,0)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setBoolean(4, gender);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            return false;
        }
    }
}
