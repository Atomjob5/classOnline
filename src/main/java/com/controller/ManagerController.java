package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/toIndex")
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/toChangePassword")
    public String toChangePassword() {
        return "changePassword";
    }

    @RequestMapping("toTest")
    public String toTest() {
        return "test";
    }

    @RequestMapping("/toCreateClass")
    public String toCreateClass(){return "createClass";}

    @RequestMapping("/toListClass")
    public String toListClass(){return "ListClass";}


}
