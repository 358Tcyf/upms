package shu.upms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import shu.upms.authority.SubjectUtils;
import shu.upms.model.entity.rbac.User;
import shu.upms.service.service.PageRenderService;


@Controller
public class PageController {

    @Autowired
    private PageRenderService pageRenderService;

    @RequestMapping("/")
    public String index(Model model) {
        pageRenderService.render(model, (User) SubjectUtils.getSubject().getBindMap("user"));
        return "home";
    }

    @RequestMapping("/userInfo")
    public String userInfo(Model model) {
        User user = (User) SubjectUtils.getSubject().getBindMap("user");
        model.addAttribute("userNumber", user.getUserNumber());
        model.addAttribute("userNick", user.getNick());
        model.addAttribute("userPhone", user.getPhone());
        model.addAttribute("userRole", user.getRole().getName());
        return "userInfo";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

}
