package cn.edu.just.zjg.te.pojo;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * 测评数据实体类
 */
public class Evaluation {

    private Integer id;
    private String ip;
    private Integer teacherId;
    private Integer teacherType;
    private Integer t1;
    private Integer t2;
    private Integer t3;
    private Integer t4;
    private Integer t5;
    private Integer t6;
    private Integer t7;
    private Integer t8;
    private Integer t9;
    private Integer t10;
    private String advice;
    private Timestamp time;
    private Teacher teacher;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getTeacherType() {
        return teacherType;
    }

    public void setTeacherType(Integer teacherType) {
        this.teacherType = teacherType;
    }

    public Integer getT1() {
        return t1;
    }

    public void setT1(Integer t1) {
        this.t1 = t1;
    }

    public Integer getT2() {
        return t2;
    }

    public void setT2(Integer t2) {
        this.t2 = t2;
    }

    public Integer getT3() {
        return t3;
    }

    public void setT3(Integer t3) {
        this.t3 = t3;
    }

    public Integer getT4() {
        return t4;
    }

    public void setT4(Integer t4) {
        this.t4 = t4;
    }

    public Integer getT5() {
        return t5;
    }

    public void setT5(Integer t5) {
        this.t5 = t5;
    }

    public Integer getT6() {
        return t6;
    }

    public void setT6(Integer t6) {
        this.t6 = t6;
    }

    public Integer getT7() {
        return t7;
    }

    public void setT7(Integer t7) {
        this.t7 = t7;
    }

    public Integer getT8() {
        return t8;
    }

    public void setT8(Integer t8) {
        this.t8 = t8;
    }

    public Integer getT9() {
        return t9;
    }

    public void setT9(Integer t9) {
        this.t9 = t9;
    }

    public Integer getT10() {
        return t10;
    }

    public void setT10(Integer t10) {
        this.t10 = t10;
    }

    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

}
