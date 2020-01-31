package com.tencet.dao;

import com.tencet.pojo.Expense;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface ExpenseDao {

    @Insert("insert into t_expense values (t_expense_seq.nextval,#{0},#{1},#{2},#{3},sysdate,#{4},0)")
    void insertExpense(String userId, String gameId, Double gameTariffe, Integer operatorId, Date date);

    @Select("select * from t_expense where exp_userId = #{0} and exp_gameId = #{1}")
    Expense selectExpenseByUserIdAndGameId(String userId, String gameId);

    @Update("update t_expense set exp_downloads = #{0} , exp_updateTime = #{1} where exp_id = #{2}")
    void updateExpense(Integer downloadTimes, Date date, Integer expId);
}
