package cn.edu.just.zjg.te.controller;

import cn.edu.just.zjg.te.dao.EvaluationDao;
import cn.edu.just.zjg.te.dao.TeacherDao;
import cn.edu.just.zjg.te.pojo.Evaluation;
import cn.edu.just.zjg.te.pojo.Teacher;
import cn.edu.just.zjg.te.util.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;

@Controller
public class EvaluationController {

    @RequestMapping(value = "evaluation", method = RequestMethod.GET)
    public String show(ModelMap map, HttpServletRequest request) {
        EvaluationDao dao = new EvaluationDao();
        map.put("headmaster", dao.countByIpAndType(CommonUtil.getIp(request), 1));
        map.put("instructor", dao.countByIpAndType(CommonUtil.getIp(request), 2));
        return "evaluation";
    }

    @RequestMapping(value = "evaluation", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> add(String ip, Integer teacher, String rating, String advice, HttpServletRequest request) {
        HashMap<String, String> map = new HashMap<>();

        TeacherDao dao1 = new TeacherDao();
        Teacher teacherEntity = dao1.getById(teacher);
        if (teacherEntity == null) {
            map.put("code", "0");
            map.put("message", "当前老师无法测评");
            return map;
        }

        String[] ratings = rating.split(",");
        if (ratings.length != 10) {
            map.put("code", "-1");
            map.put("message", "测评数据不完整");
            return map;
        }

        EvaluationDao dao2 = new EvaluationDao();
        Integer count = dao2.countByIpAndType(CommonUtil.getIp(request), teacherEntity.getType());
        switch (teacherEntity.getType()) {
            case 1:
                if (count > 1) {
                    map.put("code", "-2");
                    map.put("message", "共可测评1位班主任，当前已测评" + count + "位，无法继续测评");
                    return map;
                }
                break;
            case 2:
                if (count > 3) {
                    map.put("code", "-3");
                    map.put("message", "共可测评3位辅导员，当前已测评" + count + "位，无法继续测评");
                    return map;
                }
                break;
            default:
                break;
        }

        Evaluation evaluation = new Evaluation();
        evaluation.setIp(CommonUtil.getIp(request));
        evaluation.setTeacherId(teacherEntity.getId());
        evaluation.setTeacherType(teacherEntity.getType());
        evaluation.setT1(Integer.parseInt(ratings[0]));
        evaluation.setT2(Integer.parseInt(ratings[1]));
        evaluation.setT3(Integer.parseInt(ratings[2]));
        evaluation.setT4(Integer.parseInt(ratings[3]));
        evaluation.setT5(Integer.parseInt(ratings[4]));
        evaluation.setT6(Integer.parseInt(ratings[5]));
        evaluation.setT7(Integer.parseInt(ratings[6]));
        evaluation.setT8(Integer.parseInt(ratings[7]));
        evaluation.setT9(Integer.parseInt(ratings[8]));
        evaluation.setT10(Integer.parseInt(ratings[9]));
        evaluation.setAdvice(advice);
        evaluation.setTime(new Timestamp(System.currentTimeMillis()));

        if (dao2.add(evaluation)) {
            map.put("code", "1");
            map.put("message", "测评成功");
        } else {
            map.put("code", "-4");
            map.put("message", "测评失败");
        }

        return map;
    }

}
