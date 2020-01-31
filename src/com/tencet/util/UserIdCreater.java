package com.tencet.util;

import com.tencet.dao.UserDao;
import com.tencet.service.UserService;
import com.tencet.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserIdCreater {

   @Autowired
   private UserService userService;

    public  String UserIdCreate(){
        List<String> idList = userService.selectId();
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
        return "YH"+result;
    }
}
