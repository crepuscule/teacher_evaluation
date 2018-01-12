package cn.edu.just.zjg.te.controller;

import cn.edu.just.zjg.te.dao.AdminDao;
import cn.edu.just.zjg.te.dao.EvaluationDao;
import cn.edu.just.zjg.te.dao.TeacherDao;
import cn.edu.just.zjg.te.pojo.Admin;
import cn.edu.just.zjg.te.pojo.Evaluation;
import cn.edu.just.zjg.te.pojo.Teacher;
import cn.edu.just.zjg.te.util.CommonUtil;
import cn.edu.just.zjg.te.util.RedisUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

@Controller
public class AdminController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String showLogin(HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            return "forward:/admin/evaluation";
        } else {
            return "admin/login";
        }
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> doLogin(String username, String password, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();
        Jedis jedis = RedisUtil.getJedis();
        String ip = CommonUtil.getIp(request);
        jedis.set(ip, "0", "NX", "EX", 600);
        if (Integer.parseInt(jedis.get(ip)) >= 3) {
            map.put("code", "-1");
            map.put("message", "登录失败次数过多，请10分钟之后再试");
            return map;
        }
        AdminDao dao = new AdminDao();
        Admin admin = dao.getByUsername(username);
        if (username.length() > 5 && password.length() > 5 && admin != null &&
            admin.getPassword().equals(CommonUtil.encodePassword(password))) {
            request.getSession().setAttribute("id", admin.getId());
            request.getSession().setAttribute("username", admin.getUsername());
            map.put("code", "1");
            map.put("message", "登录成功");
            return map;
        }
        jedis.incr(ip);
        map.put("code", "0");
        map.put("message", "账号或密码错误");
        return map;
    }

    @RequestMapping(value = "admin/evaluation", method = RequestMethod.GET)
    public String showEvaluation(ModelMap map, HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            String page = request.getParameter("page");
            EvaluationDao dao = new EvaluationDao();
            map.put("evaluations", dao.getList(Integer.parseInt(page != null ? page : "1")));
            map.put("total", dao.countAll());
            return "admin/evaluation";
        } else {
            return "forward:/admin";
        }
    }

    @RequestMapping(value = "admin/evaluation/export", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> exportEvaluation(String start, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();
        Timestamp timestamp;
        try {
            timestamp = new Timestamp((new SimpleDateFormat("yyyy-MM-dd")).parse(start).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            map.put("code", "-1");
            map.put("message", "日期格式错误");
            return map;
        }
        TeacherDao dao1 = new TeacherDao();
        EvaluationDao dao2 = new EvaluationDao();
        ArrayList<Teacher> teachers = dao1.getAll();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet0 = workbook.createSheet("测评总览");
        HSSFSheet sheet1 = workbook.createSheet("详细测评数据");
        HSSFRow row0 = sheet0.createRow(0);
        row0.createCell(0).setCellValue("班导师 辅导员");
        row0.createCell(1).setCellValue("一级分类");
        row0.createCell(2).setCellValue("二级分类");
        row0.createCell(3).setCellValue("姓名");
        row0.createCell(4).setCellValue("测评总数");
        row0.createCell(5).setCellValue("测评均分");
        HSSFRow row1 = sheet1.createRow(0);
        row1.createCell(0).setCellValue("班导师 辅导员");
        row1.createCell(1).setCellValue("一级分类");
        row1.createCell(2).setCellValue("二级分类");
        row1.createCell(3).setCellValue("姓名");
        row1.createCell(4).setCellValue("T1");
        row1.createCell(5).setCellValue("T2");
        row1.createCell(6).setCellValue("T3");
        row1.createCell(7).setCellValue("T4");
        row1.createCell(8).setCellValue("T5");
        row1.createCell(9).setCellValue("T6");
        row1.createCell(10).setCellValue("T7");
        row1.createCell(11).setCellValue("T8");
        row1.createCell(12).setCellValue("T9");
        row1.createCell(13).setCellValue("T10");
        row1.createCell(14).setCellValue("留言");
        row1.createCell(15).setCellValue("测评时间");
        Integer rowNumber0 = 1;
        Integer rowNumber1 = 1;
        for (Teacher teacher : teachers) {
            row0 = sheet0.createRow(rowNumber0);
            row0.createCell(0).setCellValue(teacher.getType() == 1 ? "班导师" : "辅导员");
            row0.createCell(1).setCellValue(teacher.getFirst());
            row0.createCell(2).setCellValue(teacher.getSecond());
            row0.createCell(3).setCellValue(teacher.getName());
            row0.createCell(4).setCellValue(dao2.countByTeacherAndTime(teacher.getId(), timestamp));
            row0.createCell(5).setCellValue(dao2.averageOfScoreByTeacherAndTime(teacher.getId(), timestamp));
            ArrayList<Evaluation> evaluations = dao2.getByTeacherAndTime(teacher.getId(), timestamp);
            for (Evaluation evaluation : evaluations) {
                row1 = sheet1.createRow(rowNumber1);
                row1.createCell(0).setCellValue(teacher.getType() == 1 ? "班导师" : "辅导员");
                row1.createCell(1).setCellValue(teacher.getFirst());
                row1.createCell(2).setCellValue(teacher.getSecond());
                row1.createCell(3).setCellValue(teacher.getName());
                row1.createCell(4).setCellValue(evaluation.getT1());
                row1.createCell(5).setCellValue(evaluation.getT2());
                row1.createCell(6).setCellValue(evaluation.getT3());
                row1.createCell(7).setCellValue(evaluation.getT4());
                row1.createCell(8).setCellValue(evaluation.getT5());
                row1.createCell(9).setCellValue(evaluation.getT6());
                row1.createCell(10).setCellValue(evaluation.getT7());
                row1.createCell(11).setCellValue(evaluation.getT8());
                row1.createCell(12).setCellValue(evaluation.getT9());
                row1.createCell(13).setCellValue(evaluation.getT10());
                row1.createCell(14).setCellValue(evaluation.getAdvice());
                row1.createCell(15).setCellValue((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(evaluation.getTime()));
                rowNumber1++;
            }
            rowNumber0++;
        }
        String filename = UUID.randomUUID().toString() + ".xls";
        try {
            String path = request.getServletContext().getRealPath("/export/" + filename);
            FileOutputStream output = new FileOutputStream(path);
            workbook.write(output);
            output.close();
            workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        map.put("code", "1");
        map.put("message", "导出成功");
        map.put("url", request.getContextPath() + "/export/" + filename);
        return map;
    }

    @RequestMapping(value = "admin/teacher", method = RequestMethod.GET)
    public String showTeacher(ModelMap map, HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            String page = request.getParameter("page");
            TeacherDao dao = new TeacherDao();
            map.put("teachers", dao.getList(Integer.parseInt(page != null ? page : "1")));
            map.put("total", dao.countAll());
            return "admin/teacher";
        } else {
            return "forward:/admin";
        }
    }

    @RequestMapping(value = "admin/teacher", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> changeTeacher(String method, Integer type, Integer id, String first, String second, String name) {
        HashMap<String, String> map = new HashMap<>();
        TeacherDao dao = new TeacherDao();
        switch (method) {
            case "add":
                if (first.equals("") || second.equals("") || name.equals("")) {
                    map.put("code", "-1");
                    map.put("message", "信息填写不完整");
                }
                Teacher teacher1 = new Teacher();
                teacher1.setType(type);
                teacher1.setFirst(first);
                teacher1.setSecond(second);
                teacher1.setName(name);
                if (dao.add(teacher1)) {
                    map.put("code", "1");
                    map.put("message", "新增成功");
                } else {
                    map.put("code", "0");
                    map.put("message", "新增失败");
                }
                break;
            case "delete":
                if (dao.delete(id)) {
                    map.put("code", "1");
                    map.put("message", "删除成功");
                } else {
                    map.put("code", "0");
                    map.put("message", "删除失败");
                }
                break;
        }
        return map;
    }

    @RequestMapping(value = "admin/setting", method = RequestMethod.GET)
    public String showSetting(ModelMap map, HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            map.put("enable", CommonUtil.canEvaluate(request) ? "开启" : "关闭");
            return "admin/setting";
        } else {
            return "forward:/admin";
        }
    }

    @RequestMapping(value = "admin/setting", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> changeSetting(Boolean enable, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();
        if (CommonUtil.changeEvaluate(enable, request) == enable) {
            map.put("code", "1");
            map.put("message", "成功");
        } else {
            map.put("code", "0");
            map.put("message", "失败");
        }
        return map;
    }
}
