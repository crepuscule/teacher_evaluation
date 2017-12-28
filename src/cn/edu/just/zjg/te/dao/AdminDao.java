package cn.edu.just.zjg.te.dao;

import cn.edu.just.zjg.te.pojo.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao extends CommonDao {

    public Boolean add(String username, String password) {
        Boolean flag = false;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO admin (username, password) VALUES (?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Admin getById(Integer id) {
        Admin admin = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE admin_id = ? LIMIT 1");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                admin = generate(rs);
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public Admin getByUsername(String username) {
        Admin admin = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE username = ?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                admin = generate(rs);
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    private Admin generate(ResultSet rs) {
        Admin admin = null;
        try {
            admin = new Admin();
            admin.setId(rs.getInt(1));
            admin.setUsername(rs.getString(2));
            admin.setPassword(rs.getString(3));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

}
