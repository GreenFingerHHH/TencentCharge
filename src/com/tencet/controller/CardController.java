package com.tencet.controller;

import com.tencet.dao.CardDao;
import com.tencet.service.CardService;
import org.springframework.beans.MutablePropertyValues;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;

@Controller
@RequestMapping("/card")
public class CardController {

    @Autowired
    private CardService cardService;

    @RequestMapping("/getAllCard")
    public ModelAndView getAllCard(String cardNumber, String cardStartTime,String cardEndTime,String provId){
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(cardStartTime);
        try {
            modelAndView.addObject("cards",cardService.getAllCards(cardNumber,cardStartTime,cardEndTime,provId==null||provId.equals("")?null:Integer.valueOf(provId)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        modelAndView.setViewName("/card/card.jsp");
        return modelAndView;
    }

    @RequestMapping("/createCards")
    public ModelAndView createCards(String number,String[] provIds,String currency,String startTime,String endTime){
       ModelAndView modelAndView = new ModelAndView();
        cardService.addCards(number,provIds,currency,startTime,endTime);
        modelAndView.setViewName("getAllCard.do");
        return modelAndView;

    }
}
