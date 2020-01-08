package com.controller;

import com.alibaba.fastjson.JSON;
import com.annotation.LoginRequired;
import com.model.ReplyChangeMessage;
import com.model.User;
import com.service.UserService;
import com.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /**
     *
     *                            _oo0oo_
     *                          088888880
     *                          88" . "88
     *                          (| -_- |)
     *                          0\  =  /0
     *                        ___/'---'\___
     *                      .' \\|     |// '.
     *                     / \\|||  :  |||// \
     *                    / -||||| -:- |||||- \
     *                   |   | \\\  -  /// |   |
     *                   | \_|  ''\---/''  |_/ |
     *                   \  .-\__  '-'  __/-.  /
     *                 ___'. .'  /--.--\  '. .'___
     *              ."" '<  '.___\_<|>_/___.'  >' "".
     *             | | :  '- \'.;'\ _ /';.'/ -'  : | |
     *             \  \ '_.   \_ __\ /__ _/   ._' /  /
     *         ====='-.____'.___ \_____/ ___.'____.-'=====
     *                           '=---='
     *
     *         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     *
     *                  佛祖保佑        永无BUG
     *
     *         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     */

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
        List<User> userList=userService.selectAll();
        //把list列表添加到modelMap里
        modelMap.addAttribute("userList",userList);
        return "listUser";
    }


    @RequestMapping("toCreateClass")
    @LoginRequired
    public String toCreateClass() {
        return "createClass";
    }

    @RequestMapping("toListClass")
    @LoginRequired
    public String toListClass() {
        return "listClass";
    }

    //退出登陆
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

    //验证密码是否正确
    @RequestMapping("/reply/validatePassword")
    @LoginRequired
    @ResponseBody
    public Map<String,Boolean> validatePassword(String oldPassword, HttpServletRequest request) {
        Map<String, Boolean> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        map.put("status", user.getPassword().equals(oldPassword));
        return map;
    }

    //修改密码
    @RequestMapping("/changePassword")
    @ResponseBody
    @LoginRequired
    public ReplyChangeMessage changePassword(String newPassword,HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        user.setPassword(newPassword);
        userService.changeUser(user);
        return new ReplyChangeMessage(true);
    }

    //更改个人信息
    @RequestMapping(value = "/changeInformation",method = RequestMethod.POST)
    @ResponseBody
    @LoginRequired
    public ReplyChangeMessage changeInformation(@RequestBody User user,HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute("user");
        if (user.getPassword() != null) {
            u.setPassword(user.getPassword());
        }
        if (user.getNickname() != null) {
            u.setNickname(user.getNickname());
        }
        if (user.getProfilePhoto() != null) {
            u.setProfilePhoto(user.getProfilePhoto());
        }
        if (user.getSex() != null) {
            u.setSex(user.getSex());
        }

        int influenceCounts = userService.changeUser(u);
        if (influenceCounts == 0) {
            return new ReplyChangeMessage(false,ReplyChangeMessage.CHANGE_ERROR);
        }

        request.getSession().setAttribute("user",u);
        return new ReplyChangeMessage(true);
    }
//更改密码
    @ResponseBody
    @RequestMapping("/resetPassword")
    public int ChangePassword(@RequestBody User user){
        int i=userService.changeUser(user);
        return i;
    }

    @RequestMapping("/deleteUser")
    public void deleteUser(int id,HttpServletResponse response) throws IOException {
       int i = userService.deleteUser(id);
       response.sendRedirect("/manage/toListUser.do");
    }


}
