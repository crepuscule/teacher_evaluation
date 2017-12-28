package cn.edu.just.zjg.te.controller;

import cn.edu.just.zjg.te.dao.AdminDao;
import cn.edu.just.zjg.te.dao.EvaluationDao;
import cn.edu.just.zjg.te.dao.TeacherDao;
import cn.edu.just.zjg.te.pojo.Admin;
import cn.edu.just.zjg.te.util.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
public class AdminController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String showLogin(HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            return "redirect: " + request.getContextPath() + "/admin/evaluation";
        } else {
            return "admin/login";
        }
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> doLogin(String username, String password, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();
        AdminDao dao = new AdminDao();
        Admin admin = dao.getByUsername(username);
        if (username.length() > 5 && password.length() > 5 &&
            admin != null && admin.getPassword().equals(CommonUtil.encodePassword(password))) {
            request.getSession().setAttribute("id", admin.getId());
            request.getSession().setAttribute("username", admin.getUsername());
            map.put("code", "1");
            map.put("message", "登录成功");
            return map;
        }
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
            return "admin/evaluation";
        } else {
            return "redirect: " + request.getContextPath() + "/admin";
        }
    }

    @RequestMapping(value = "admin/teacher", method = RequestMethod.GET)
    public String showTeacher(ModelMap map, HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            String page = request.getParameter("page");
            TeacherDao dao = new TeacherDao();
            map.put("teachers", dao.getList(Integer.parseInt(page != null ? page : "1")));
            return "admin/teacher";
        } else {
            return "redirect: " + request.getContextPath() + "/admin";
        }
    }

    @RequestMapping(value = "admin/setting", method = RequestMethod.GET)
    public String showSetting(ModelMap map, HttpServletRequest request) {
        Object id = request.getSession().getAttribute("id");
        if (id != null && Integer.parseInt(String.valueOf(id)) > 0) {
            map.put("enable", CommonUtil.canEvaluate(request) ? "开启" : "关闭");
            return "admin/setting";
        } else {
            return "redirect: " + request.getContextPath() + "/admin";
        }
    }

    @RequestMapping(value = "admin/setting", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> doLogin(Boolean enable, HttpServletRequest request) {
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
