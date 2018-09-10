package cn.bee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * created by liufeng
 * 2018/8/21
 */
@Controller
public class IndexController {

    @RequestMapping("/login")
    public String indexJsp() {
        return "login/login";
    }
}
