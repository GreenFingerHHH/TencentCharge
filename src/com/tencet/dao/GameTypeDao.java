package com.tencet.dao;

import com.tencet.pojo.GameType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@Repository
public interface GameTypeDao {

    List<GameType> selectGameTypeByCon(@Param("gameType") String gameType,@Param("status") Integer status,@Param("pageNum") Integer pageNum);

    Integer selectCountGameType(@Param("gameType") String gameType,@Param("status") Integer status );

    @Select("select type_id from t_game_type")
    List<String> selectId();

    void insertGameType(@Param("typeId") String typeId,@Param("typeName") String typeName,@Param("typeStatus") Integer typeStatus,@Param("newName") String newName,@Param("createTime") Date createTime,@Param("updateTime") Date updateTime) throws SQLException;

    @Select("select * from t_game_type where type_id = #{0}")
    GameType selectOneGameTypeByTypeId(String typeId);

    @Update("update t_game_type set type_name = #{1},type_status = #{2},type_updateTime = #{3} where type_id = #{0}")
    void updateGameType(String typeId, String typeName, Integer typeStatus, Date date) throws Exception;

    @Delete("delete from t_game_type where type_id = #{0}")
    void deleteGameTypeByTypeIds(String typeId);

    @Select("select * from t_game_type")
    List<GameType> selectAllGameType();
}
