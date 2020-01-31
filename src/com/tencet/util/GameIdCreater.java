package com.tencet.util;

import com.tencet.dao.GameDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GameIdCreater {
    @Autowired
    private GameDao gameDao;


    public String createGameId(){
        List<String> idList = gameDao.selectId();
        String lastId = idList.size()==0?"0":idList.get(idList.size()-1);
        Integer userNumberId = lastId.length()==1?1:Integer.valueOf(lastId.substring(2)) + 1;
        String result = String.valueOf(userNumberId);
        if (result.length()==1){
            result = "000"+result;
        }else if (result.length()==2){
            result = "00"+result;
        }else if (result.length()==3){
            result = "0"+result;
        }
        return "YX"+result;
    }
}
