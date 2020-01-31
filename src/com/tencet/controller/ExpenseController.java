package com.tencet.controller;

import com.tencet.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/expense")
public class ExpenseController {

    @Autowired
    private ExpenseService expenseService;

    @RequestMapping("/buyGame")
    @ResponseBody
    public String buyGame(String userId,String gameId,Integer operatorId){
        return expenseService.buyGame(userId,gameId,operatorId);
    }

    @RequestMapping("/getBuyStatus")
    @ResponseBody
    public String getBuyStatus(String userId,String gameId){
        return expenseService.getBuyStatus(userId,gameId);
    }
}
