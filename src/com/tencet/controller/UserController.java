package com.tencet.controller;

import com.tencet.exception.LoginFailException;
import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.User;
import com.tencet.service.UserService;
import com.tencet.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView userLogin(String username, String pwd, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        try {
            User user = userService.selectOneUserByNameAndPwd(username,pwd);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            modelAndView.setViewName("/user/portal.jsp");

        } catch (LoginFailException e) {
            e.printStackTrace();
            modelAndView.addObject("isLoginFail",true);
            modelAndView.addObject("errorMessage",e.getMessage());
            modelAndView.setViewName("/user/login.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/getUser")
    @ResponseBody
    public String selectUser(String username){
        if (userService.selectUserByName(username)){
            return "true";
        }else {
            return "false";
        }
    }

    @RequestMapping("/getUserByPhone")
    @ResponseBody
    public String selectUserByPhone(String phoneNumber){
        if (userService.selectUserByPhone(phoneNumber)){
            return "true";
        }else {
            return "false";
        }
    }

    @RequestMapping("/registerUser")
    public ModelAndView addUser(String userName,String userPwd,String phone,String sex,String birthday,String province ){
        ModelAndView modelAndView = new ModelAndView();

        try {
            userService.addUser(userName,userPwd,phone,sex,birthday,province);
            modelAndView.addObject("registSuccess",true);
            modelAndView.addObject("successInfo","注册成功！请返回登录！");
            modelAndView.setViewName("/user/login.jsp");
        }catch (Exception e){
            e.printStackTrace();
            modelAndView.setViewName("/user/register.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/getAllUsers")
    @ResponseBody
    public Pager<User> getAllUsers(@RequestParam(value = "username",required = false) String username, @RequestParam(value = "phone",required = false) String phone, @RequestParam(value = "pageNum") Integer pageNum){
        Pager<User> pager = userService.getAllUsers(username,phone,pageNum);
        return pager;
    }

    @RequestMapping("/banUsers")
    public ModelAndView banUsers(@RequestParam( value = "users",required = false) String[] userId,@RequestParam("status") String status)  {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/user/user.jsp");
        try {
            userService.freeOrBanUsers(userId,status);
        } catch (NotChooseUsersException e) {
            e.printStackTrace();
            modelAndView.addObject("notSelect",true);
            modelAndView.addObject("errorMessage",e.getMessage());
        }
        return modelAndView;
    }


    @RequestMapping("/userCharge")
    @ResponseBody
    public String userCharge(String cardNumber,String cardPwd,String userId){
        return userService.userCharge(cardNumber,cardPwd,userId,new Date());
    }
}
