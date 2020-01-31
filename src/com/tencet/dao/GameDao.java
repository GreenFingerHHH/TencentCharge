package com.tencet.dao;

import com.tencet.pojo.Game;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GameDao {

    List<Game> selectGameByCon(@Param("gameName") String gameName, @Param("gameType") String gameType,@Param("pageNum") Integer pageNum);

    Integer selectGameCount(@Param("gameName") String gameName,@Param("gameType") String gameType);

    Game selectGameById(@Param("gameId") String gameId);

    @Select("select game_id from t_game")
    List<String> selectId();

    @Insert("insert into t_game values (#{game.gameId},#{game.gameName},#{game.gameType},#{game.gameStatus},#{game.gameCover},#{game.gameScreen},#{game.gameCurrency},#{game.gameTariffe},#{game.gameDevelopers},#{game.gameFiling},#{game.gameDetail},#{game.gameIntroduction},#{game.gameCreateTime},#{game.gameUpdateTime},#{game.gameFile})")
    void insertNewGame(@Param("game") Game game);

    @Select("select * from t_game where game_name = #{0} and game_id != #{1}")
    Game selectGameByName(String gameName,String gameId);


    @Update("update t_game set game_name = #{game.gameName},game_type = #{game.gameType},game_status = #{game.gameStatus},game_developers = #{game.gameDevelopers},game_filing = #{game.gameFiling},game_introduction = #{game.gameIntroduction},game_detail = #{game.gameDetail},game_currency = #{game.gameCurrency},game_tariffe = #{game.gameTariffe},game_updateTime = #{game.gameUpdateTime} where game_id = #{gameId}")
    void updateGameById(@Param("game") Game game, @Param("gameId") String gameId);

    @Delete("delete from t_game where game_id = #{0}")
    void deleteGameById(String gameId);
}
