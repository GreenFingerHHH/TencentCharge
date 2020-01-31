package com.tencet.util;

import com.tencet.dao.GameTypeDao;
import com.tencet.service.GameTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GameTypeIdCreater {
    @Autowired
    private GameTypeDao gameTypeDao;

    public String createGameTypeId(){
        List<String> idList = gameTypeDao.selectId();
        String lastId = idList.get(idList.size()-1);
        Integer userNumberId = Integer.valueOf(lastId.substring(2)) + 1;
        String result = String.valueOf(userNumberId);
        if (result.length()==1){
            result = "000"+result;
        }else if (result.length()==2){
            result = "00"+result;
        }else if (result.length()==3){
            result = "0"+result;
        }
        return "GT"+result;
    }
}
