package cn.bee.web;

import cn.bee.User;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * created by liufeng
 * 2018/8/21
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(Model model) {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("user", user);
        return "home/index";
    }

    @RequestMapping("/login")
    public String indexJsp() {
        return "login/login";
    }
}
