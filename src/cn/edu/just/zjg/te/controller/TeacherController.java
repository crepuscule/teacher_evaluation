package cn.edu.just.zjg.te.controller;

import cn.edu.just.zjg.te.dao.TeacherDao;
import cn.edu.just.zjg.te.pojo.Teacher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class TeacherController {

    @RequestMapping(value = "teachers", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<Teacher> getTeacherList(HttpServletRequest request) {
        String type = request.getParameter("type");
        if (type != null) {
            TeacherDao dao = new TeacherDao();
            return dao.getByType(Integer.parseInt(type));
        } else {
            return null;
        }
    }

}
