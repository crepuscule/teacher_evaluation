package cn.edu.just.zjg.te.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {

    @RequestMapping(value = "error")
    public String showErrorPage() {
        return "error";
    }

}
