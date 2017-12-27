package cn.edu.just.zjg.te.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
public class AdminController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String showLogin() {
        return "admin/login";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> doLogin() {
        HashMap<String, String> map = new HashMap<>();
        map.put("a", "1");
        return map;
    }

}
