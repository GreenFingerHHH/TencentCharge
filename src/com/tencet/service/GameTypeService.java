package com.tencet.service;

import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.GameType;
import com.tencet.util.Pager;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface GameTypeService {

    Pager<GameType> getAllGameType(String gameType, Integer status, Integer pageNum);

    void addGameType(String typeName, Integer typeStatus, MultipartFile file) throws Exception;

    GameType getOneGameTypeByTypeId(String typeId);

    void updateGameType(String typeId, String typeName, Integer typeStatus) throws  Exception;

    List<String> deleteGameTypeByTypeIds(String[] typeIds) throws NotChooseUsersException;

    List<GameType> getAllGameTypes();
}
