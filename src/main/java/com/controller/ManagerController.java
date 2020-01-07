package com.controller;

import com.annotation.LoginRequired;
import com.model.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 后台管理控制器
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:21
 */
@Controller
@RequestMapping("manage")
public class ManagerController {

    @Autowired
    UserService userService;

    @RequestMapping("/toIndex")
    @LoginRequired
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/toChangePassword")
    @LoginRequired
    public String toChangePassword() {
        return "changePassword";
    }

    @RequestMapping("/toCreateQuestion")
    @LoginRequired
    public String toCreateQuestion() {
        return "createQuestion";
    }

    @RequestMapping("/toListQuestion")
    @LoginRequired
    public String toListQuestion() {
        return "listQuestion";
    }

    @RequestMapping("/toListRole")
    @LoginRequired
    public String toListRole() {
        return "listRole";
    }

    @RequestMapping("/toListUser")
    @LoginRequired
    public String toListUser(ModelMap modelMap) {

        //从数据库查询信息
        List<User> userList=userService.selectUserById();
        //把list列表添加到modelMap里
        modelMap.addAttribute("userList",userList);
        return "listUser";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                cookie.setMaxAge(0);  //销毁cookie
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
        return "redirect:/page/login.html";
    }

    @RequestMapping("todeleteUser")
    public void deleteUser(int id){

    }
}
