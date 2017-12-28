package cn.edu.just.zjg.te.dao;

import cn.edu.just.zjg.te.pojo.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherDao extends CommonDao {

    public Boolean add(Teacher teacher) {
        Boolean flag = false;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO teacher (teacher_type, first, second, name) VALUES (?, ?, ?, ?)");
            ps.setInt(1, teacher.getType());
            ps.setString(2, teacher.getFirst());
            ps.setString(3, teacher.getSecond());
            ps.setString(4, teacher.getName());
            flag = ps.executeUpdate() > 0;
            close(conn, ps, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Teacher getById(Integer id) {
        Teacher teacher = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM teacher WHERE teacher_id = ? LIMIT 1");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                teacher = generate(rs);
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }

    public ArrayList<Teacher> getByType(Integer type) {
        ArrayList<Teacher> teachers = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM teacher WHERE teacher_type = ?");
            ps.setInt(1, type);
            ResultSet rs = ps.executeQuery();
            teachers = new ArrayList<>();
            while (rs.next()) {
                teachers.add(generate(rs));
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public ArrayList<Teacher> getList(Integer page) {
        ArrayList<Teacher> teachers = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM teacher ORDER BY teacher_type ASC, teacher_id DESC LIMIT ?, 50");
            ps.setInt(1, (page - 1) * 50);
            ResultSet rs = ps.executeQuery();
            teachers = new ArrayList<>();
            while (rs.next()) {
                teachers.add(generate(rs));
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public ArrayList<Teacher> searchByName(String name) {
        ArrayList<Teacher> teachers = null;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM teacher WHERE name LIKE ?");
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            teachers = new ArrayList<>();
            while (rs.next()) {
                teachers.add(generate(rs));
            }
            close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    private Teacher generate(ResultSet rs) {
        Teacher teacher = null;
        try {
            teacher = new Teacher();
            teacher.setId(rs.getInt(1));
            teacher.setType(rs.getInt(2));
            teacher.setFirst(rs.getString(3));
            teacher.setSecond(rs.getString(4));
            teacher.setName(rs.getString(5));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }

}
