package com.tencet.service.impl;

import com.tencet.constant.Constants;
import com.tencet.dao.GameTypeDao;
import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.GameType;
import com.tencet.service.GameTypeService;
import com.tencet.util.GameTypeIdCreater;
import com.tencet.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class GameTypeServiceImpl implements GameTypeService {

    @Autowired
    private GameTypeDao gameTypeDao;

    @Autowired
    private GameTypeIdCreater gameTypeIdCreater;

    String baseFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/usedimg/gameType";

    @Override
    public Pager<GameType> getAllGameType(String gameType, Integer status, Integer pageNum) {
        Pager<GameType> pager = new Pager<GameType>();
        pager.setList(gameTypeDao.selectGameTypeByCon(gameType,status,pageNum));
        pager.setPageNum(pageNum);
        pager.setCount(gameTypeDao.selectCountGameType(gameType,status));
        if(pager.getCount()% Constants.PAGESIZE==0){
            pager.setTotalPage(pager.getCount()/Constants.PAGESIZE);
        }else{
            pager.setTotalPage(pager.getCount()/Constants.PAGESIZE+1);
        }
        return pager;
    }

    @Override
    public void addGameType(String typeName, Integer typeStatus, MultipartFile file) throws SQLException, IOException {


        String typeId = gameTypeIdCreater.createGameTypeId();
        System.out.println("typeId:"+typeId);

       String imageName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
       String newName = typeId+imageName;
       File uploadFile = new File(baseFileUrl,newName);
        try {
            gameTypeDao.insertGameType(typeId,typeName,typeStatus,newName,new Date(),new Date());
            file.transferTo(uploadFile);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("该类型名称已存在！");
        } catch (IOException e){
            e.printStackTrace();
            throw new IOException("服务器正忙！请重试！");
        }
        System.out.println("上传成功！");

    }

    @Override
    public GameType getOneGameTypeByTypeId(String typeId) {

        return gameTypeDao.selectOneGameTypeByTypeId(typeId);
    }

    @Override
    public void updateGameType(String typeId, String typeName, Integer typeStatus) throws Exception {
        try {
            gameTypeDao.updateGameType(typeId,typeName,typeStatus,new Date());
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<String> deleteGameTypeByTypeIds(String[] typeIds) throws NotChooseUsersException {
        List<String> unDelete = new ArrayList<String>();
        if (typeIds==null||typeIds.length==0){
            throw new NotChooseUsersException("未选择游戏类型！");
        }
//        for(String typeId:typeIds){
//
//            gameTypeDao.deleteGameTypeByTypeIds(typeId);
//        }
        for(int i=0;i<typeIds.length;i++){
            try{
                gameTypeDao.deleteGameTypeByTypeIds(typeIds[i]);
                File file = new File(baseFileUrl);
                File[] list = file.listFiles();
                for (File file1:list){
                    if (file1.getName().substring(0,6).equals(typeIds[i])){
                        file1.delete();
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
                unDelete.add(typeIds[i]);
                continue;
            }
        }
        return unDelete;
    }

    @Override
    public List<GameType> getAllGameTypes() {
        return gameTypeDao.selectAllGameType();
    }
}
