package com.tencet.service;

import com.tencet.exception.LoginFailException;
import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.User;
import com.tencet.util.Pager;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface UserService {

    public User selectOneUserByNameAndPwd(String username,String pwd) throws LoginFailException;

    Boolean selectUserByName(String username);

    boolean selectUserByPhone(String phoneNumber);

    void addUser(String userName, String userPwd, String phone, String sex, String birthday, String province);

    List<String> selectId();



    Pager<User> getAllUsers(String username, String phone, Integer pageNum);

    void freeOrBanUsers(String[] userId, String status) throws NotChooseUsersException;

    String userCharge(String cardNumber, String cardPwd, String userId, Date today);
}
