package com.tencet.service;

import com.tencet.exception.GameNameHasExsistException;
import com.tencet.pojo.Game;
import com.tencet.util.Pager;
import org.springframework.web.multipart.MultipartFile;

public interface GameService {

    Pager<Game> getAllGame(String gameName, String gameType, Integer pageNum);

    Game getOneGameById(String gameId);

    void addOrUpdate(Game game, MultipartFile gameCover, MultipartFile gameScreen1,MultipartFile gameScreen2,MultipartFile gameScreen3, String funCode,String gameId,MultipartFile gameFile) throws GameNameHasExsistException;

    void deleteGames(String[] gameIds);
}
