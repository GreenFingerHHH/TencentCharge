package com.tencet.service.impl;

import com.tencet.dao.CardDao;
import com.tencet.pojo.Card;
import com.tencet.service.CardService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class CardServiceImpl implements CardService {

    @Autowired
    private CardDao cardDao;


    @Override
    public List<Card> getAllCards(String cardNumber, String  cardStartTime, String cardEndTime, Integer provId) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startTime = null;
        Date endTime = null;
        try {
            if (cardStartTime!=null&&!cardStartTime.equals("")){
                startTime = simpleDateFormat.parse(cardStartTime);
            }
            if (cardEndTime!=null&&!cardEndTime.equals("")){
                endTime = simpleDateFormat.parse(cardEndTime);
            }
            List<Card> list = cardDao.selectAllCards(cardNumber,startTime,endTime,provId);
            return list;
        } catch (ParseException e) {
            e.printStackTrace();
            throw e;
        }

    }

    @Override
    public void addCards(String number, String[] provIds, String currency, String startTime, String endTime) {
        Random random = new Random();
        String usedLine = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        char[] needArray = usedLine.toCharArray();
        Date cardStartTime = null;
        Date cardEndTime = null;
        Date date = new Date();
        Integer status = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (int m=0;m<provIds.length;m++){
            try {
                cardStartTime = simpleDateFormat.parse(startTime+" 00:00:00");
                cardEndTime = simpleDateFormat.parse(endTime+" 00:00:00");
                if (cardStartTime.getTime()-date.getTime()>0){
                    status = 1;
                }else if (cardEndTime.getTime()-date.getTime()>0){
                    status = 2;
                }else {
                    status = 4;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            for(int i=0;i<Integer.valueOf(number);){
                StringBuffer cardNumber = new StringBuffer();
                StringBuffer cardPwd = new StringBuffer();
                for (int j=0;j<11;j++){
                    cardNumber.append(needArray[random.nextInt(35)]);
                }
                for (int j=0;j<6;j++){
                    cardPwd.append(needArray[random.nextInt(35)]);
                }
                if(cardDao.selectCardByNumber(cardNumber.toString())==null){
                    cardDao.insertCard(cardNumber.toString(),cardPwd.toString(), Integer.valueOf(currency),Integer.valueOf(provIds[m]),cardStartTime,cardEndTime,status);
                    i++;
                }

            }

        }
    }
}
