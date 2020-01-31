package com.tencet.service.impl;

import com.tencet.constant.Constants;
import com.tencet.dao.CardDao;
import com.tencet.dao.PrepDao;
import com.tencet.dao.UserDao;
import com.tencet.exception.LoginFailException;
import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.Card;
import com.tencet.pojo.User;
import com.tencet.service.UserService;
import com.tencet.util.Pager;
import com.tencet.util.UserIdCreater;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CardDao cardDao;

    @Autowired
    private PrepDao prepDao;

    @Autowired
    private UserIdCreater userIdCreater;


    @Transactional
    @Override
    public User selectOneUserByNameAndPwd(String username, String pwd) throws LoginFailException {
      User user =  userDao.selectOneUserByNameAndPwd(username,pwd);
      if(user == null){
          throw new LoginFailException("用户名或密码错误！");
      }
      if (user.getUserStatus()==0){
          throw new LoginFailException("该用户被封禁，请联系管理员！");
      }
        return user;
    }

    @Override
    public Boolean selectUserByName(String username) {
        Integer sum = userDao.selectUserByName(username).size();
        if (sum>0){
            return true;
        }else {
            return false;

        }
    }

    @Override
    public boolean selectUserByPhone(String phoneNumber) {
        Integer sum = userDao.selectUserByPhone(phoneNumber).size();
        if (sum>0){
            return true;
        }
        return false;
    }

    @Override
    public void addUser(String userName, String userPwd, String phone, String sex, String birthday, String province) {

            String userId = userIdCreater.UserIdCreate();
            userDao.insertUser(userName,userPwd,phone,sex,birthday,province,userId,new Date());




    }

    @Override
    public List<String> selectId() {
        return userDao.selectId();
    }

    @Override
    public Pager<User> getAllUsers(String username, String phone, Integer pageNum) {

        Pager<User> pager = new Pager<User>();
        Integer totalPage = -1;
        pager.setList(userDao.selectAllUsers(username,phone,pageNum));
        pager.setCount(userDao.selectUsersCount(username,phone));
        if(pager.getCount()% Constants.PAGESIZE==0){
            totalPage = pager.getCount()/Constants.PAGESIZE;
        }else{
            totalPage = pager.getCount()/Constants.PAGESIZE+1;
        }
        pager.setPageNum(pageNum);
        pager.setTotalPage(totalPage);
        return pager;
    }

    @Override
    public void freeOrBanUsers(String[] userId, String status) throws NotChooseUsersException {
        if (userId==null||userId.length==0){
            throw new NotChooseUsersException("没有选择任何用户！");
        }
        Integer statusUser = Integer.valueOf(status);
        userDao.updateUserStatusByUserId(userId,statusUser);

    }

    @Override
    public String userCharge(String cardNumber, String cardPwd, String userId,Date today) {
        Card card = cardDao.selectCardByNumber(cardNumber);
        User user = userDao.selectUserById(userId);
        if (card == null||card.getCardStartTime().getTime()-today.getTime()>0){
            return "1";
        }
        if(card.getCardEndTime().getTime()-today.getTime()<0){
            cardDao.updateCardStatusByCardId(card.getCardId(),4);
            return "2";
        }
        if (!card.getCardPwd().equals(cardPwd)){
            return "3";
        }
        if (card.getCardStatus()==3){
            return "4";
        }
        if (user.getUserLocation()!=card.getCardProvId()){
            return "5";
        }
        userDao.updateUserCurrencyById(user.getUserCurrency()+Integer.valueOf(card.getCardAmount()),userId);
        cardDao.updateCardStatusByCardId(card.getCardId(),3);
        prepDao.insertPrep(card,userId,new Date());
        return "6";
    }
}
