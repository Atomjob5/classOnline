package com.interceptor;

import com.alibaba.fastjson.JSON;
import com.annotation.LoginRequired;
import com.model.User;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;

/**
 * @author Atom
 * @date 2020/1/7
 * @time 17:29
 */
@Component
public class LoginInterCeptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HandlerMethod method = (HandlerMethod) handler;
        LoginRequired methodAnnotation = method.getMethodAnnotation(LoginRequired.class);
        if (methodAnnotation == null) {  //没有标注LoginRequired的方法
            System.out.println("登陆拦截器不拦截该方法 -> " + method.toString());
            return true;
        }

        System.out.println("登陆拦截器拦截该方法 -> " + method.toString());
        boolean needLogin = methodAnnotation.needLogin();
        if (needLogin) {  //需要登陆
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                //查找cookie是否存有
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        String jsonString = URLDecoder.decode(cookie.getValue(),"utf-8");
                        User cookieUser = JSON.parseObject(jsonString, User.class);
                        request.getSession().setAttribute("user",cookieUser);
                        return true;
                    }
                }
                //如果session和cookie中都没有user，重定向到登录页面
                response.sendRedirect("/page/login.html");
                return false;
            }
        }


        return true;
    }
}
