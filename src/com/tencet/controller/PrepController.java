package com.tencet.controller;

import com.tencet.service.PrepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/prep")
@Controller
public class PrepController {
    @Autowired
    private PrepService prepService;

    @RequestMapping("/getAllPreps")
    public ModelAndView getAllPreps(@RequestParam("userId") String userId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("preps",prepService.getAllPrepsByUserId(userId));
        modelAndView.setViewName("/user/prepaid.jsp");
        return modelAndView;
    }
}
