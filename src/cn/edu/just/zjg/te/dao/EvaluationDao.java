package cn.edu.just.zjg.te.dao;

import cn.edu.just.zjg.te.pojo.Evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EvaluationDao extends CommonDao {

    public Boolean add(Evaluation evaluation) {
        Boolean flag = false;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO evaluation (ip, teacher_id, teacher_type, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, advice, time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, evaluation.getIp());
            ps.setInt(2, evaluation.getTeacherId());
            ps.setInt(3, evaluation.getTeacherType());
            ps.setInt(4, evaluation.getT1());
            ps.setInt(5, evaluation.getT2());
            ps.setInt(6, evaluation.getT3());
            ps.setInt(7, evaluation.getT4());
            ps.setInt(8, evaluation.getT5());
            ps.setInt(9, evaluation.getT6());
            ps.setInt(10, evaluation.getT7());
            ps.setInt(11, evaluation.getT8());
            ps.setInt(12, evaluation.getT9());
            ps.setInt(13, evaluation.getT10());
            ps.setString(14, evaluation.getAdvice());
            ps.setTimestamp(15, evaluation.getTime());
            flag = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer countByIpAndType(String ip, Integer type) {
        Integer count = 0;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM evaluation WHERE ip = ? AND teacher_type = ?");
            ps.setString(1, ip);
            ps.setInt(2, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    private Evaluation generate(ResultSet rs) {
        Evaluation evaluation = null;
        try {
            evaluation = new Evaluation();
            evaluation.setId(rs.getInt(1));
            evaluation.setIp(rs.getString(2));
            evaluation.setTeacherId(rs.getInt(3));
            evaluation.setTeacherType(rs.getInt(4));
            evaluation.setT1(rs.getInt(5));
            evaluation.setT2(rs.getInt(6));
            evaluation.setT3(rs.getInt(7));
            evaluation.setT4(rs.getInt(8));
            evaluation.setT5(rs.getInt(9));
            evaluation.setT6(rs.getInt(10));
            evaluation.setT7(rs.getInt(11));
            evaluation.setT8(rs.getInt(12));
            evaluation.setT9(rs.getInt(13));
            evaluation.setT10(rs.getInt(14));
            evaluation.setAdvice(rs.getString(15));
            evaluation.setTime(rs.getTimestamp(16));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evaluation;
    }

}