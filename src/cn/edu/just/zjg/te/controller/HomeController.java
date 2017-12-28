package cn.edu.just.zjg.te.controller;

import cn.edu.just.zjg.te.util.CommonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String showHome(ModelMap map, HttpServletRequest request) {
        map.put("enable", CommonUtil.canEvaluate(request));
        return "home";
    }

}
