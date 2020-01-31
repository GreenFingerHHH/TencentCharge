package com.tencet.service.impl;

import com.tencet.dao.ExpenseDao;
import com.tencet.dao.GameDao;
import com.tencet.dao.UserDao;
import com.tencet.pojo.Expense;
import com.tencet.pojo.Game;
import com.tencet.pojo.User;
import com.tencet.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ExpenseServiceImpl implements ExpenseService {
    @Autowired
    private ExpenseDao expenseDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private GameDao gameDao;

    @Override
    public String buyGame(String userId, String gameId, Integer operatorId) {
        Game game = gameDao.selectGameById(gameId);
        User user = userDao.selectUserById(userId);

        //话费购买
        if (operatorId==1){
            if(user.getUserTariffe()<game.getGameTariffe()){
                return "tariffeNotEnough";
            }else {
                userDao.updateUserTariffeById(user.getUserTariffe()-game.getGameTariffe(),userId);
                expenseDao.insertExpense(userId,gameId,game.getGameTariffe(),operatorId,new Date());
                return "success";
            }
        }//游币购买
        else {
            if(user.getUserCurrency()<game.getGameCurrency()){
                return "currencyNotEnough";
            }else {
                userDao.updateUserCurrencyById(user.getUserCurrency()-game.getGameCurrency(),userId);
                expenseDao.insertExpense(userId,gameId,game.getGameCurrency(),operatorId,new Date());
                return "success";
            }
        }
    }

    @Override
    public String getBuyStatus(String userId, String gameId) {
        if (expenseDao.selectExpenseByUserIdAndGameId(userId,gameId)!=null){
            return "hasBought";
        }
        return "hasNotBought";
    }

    @Override
    public void updateExpense(String userId, String gameId) {
        Expense expense = expenseDao.selectExpenseByUserIdAndGameId(userId,gameId);
        Integer downloadTimes = expense.getExpDownLoads()+1;
        expenseDao.updateExpense(downloadTimes,new Date(),expense.getExpId());
    }
}
