package com.tencet.dao;

import com.tencet.pojo.Card;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CardDao {


    List<Card> selectAllCards(@Param("cardNumber") String cardNumber,@Param("cardCreateTime") Date cardStartTime,@Param("cardEndTime") Date cardEndTime,@Param("provId") Integer provId);

    @Insert("insert into t_card values (card_id_seq.nextval,#{0},#{1},#{2},#{3},#{4},#{5},#{6},sysdate)")
    void insertCard(String cardNumber,String cardPwd,Integer currency, Integer provId, Date startTime, Date endTime,Integer status) ;

    @Select("select * from t_card where card_number = #{0}")
    Card selectCardByNumber(String toString);

    @Update("update t_card set card_status = #{1} where card_id = #{0}")
    void updateCardStatusByCardId(Integer cardId,Integer status);
}
