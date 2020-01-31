package com.tencet.service;


import com.tencet.pojo.Card;
import org.apache.ibatis.annotations.Select;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface CardService {



    List<Card> getAllCards(String cardNumber, String cardStartTime,String cardEndTime,Integer provId) throws ParseException;

    void addCards(String number, String[] provIds, String currency, String startTime, String endTime);

}
