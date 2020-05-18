package shu.upms.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import shu.upms.authority.Subject;
import shu.upms.authority.SubjectUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@RestController
@RequestMapping("/user/*")
public class HelloController {

    @RequestMapping(value = "hello", method = RequestMethod.GET)
    public String show() {
        return "Hello World";
    }


    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {
        return "you have not login, please login";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void login(String username, String password, HttpServletResponse response) throws IOException {
        Subject subject = SubjectUtils.getSubject();
        subject.setPrincipal(username);
        subject.setAccess(password);
        if (subject.login()) {
            response.sendRedirect("/user/hello");
        } else {
            response.sendRedirect("/user/index");
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpServletResponse response) throws IOException {
        SubjectUtils.getSubject().logout();
        response.sendRedirect("/user/index");
    }
}
