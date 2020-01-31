package com.tencet.controller;

import com.tencet.exception.LoginFailException;
import com.tencet.exception.NotFoundManagerException;
import com.tencet.pojo.Manager;
import com.tencet.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping("/login")
    public ModelAndView managerLogin(String username, String password, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        try {

          Manager manager =  managerService.getOneManagerByNameAndPwd(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("manager",manager);
            modelAndView.setViewName("/index.jsp");
        } catch (LoginFailException e) {
            e.printStackTrace();
            modelAndView.addObject("isLoginFail",true);
            modelAndView.addObject("errorMessage","用户名或密码错误！请重新输入！");
            modelAndView.setViewName("/login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelAndView;
    }

    @RequestMapping("/getPhone")
    @ResponseBody
    public String getPhoneNumber(String username){

        try {
            return managerService.getManagerByName(username);
        } catch (NotFoundManagerException e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "/login.jsp";
    }
}
