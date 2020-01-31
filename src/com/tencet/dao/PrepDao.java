package com.tencet.dao;

import com.tencet.pojo.Card;
import com.tencet.pojo.Prepaid;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface PrepDao {

    public List<Prepaid> selectAllPrepByUserId(String userId);

    @Insert("insert into t_prepaid values (prep_id_seq.nextval,#{userId},#{card.cardNumber},#{card.cardPwd},#{card.cardAmount},#{today})")
    void insertPrep(@Param("card") Card card, @Param("userId") String userId,@Param("today") Date date);
}
