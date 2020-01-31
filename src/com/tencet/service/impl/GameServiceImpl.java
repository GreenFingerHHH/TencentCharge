package com.tencet.service.impl;

import com.tencet.constant.Constants;
import com.tencet.dao.GameDao;
import com.tencet.exception.GameNameHasExsistException;
import com.tencet.pojo.Game;
import com.tencet.service.GameService;
import com.tencet.util.GameIdCreater;
import com.tencet.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service
public class GameServiceImpl implements GameService {
    @Autowired
    private GameDao gameDao;
    @Autowired
    private GameIdCreater creater;

    String coverFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/usedimg/game";

    String screensFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/usedimg/game/screen";

    String gameFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/FileSource";
    @Override
    public Pager<Game> getAllGame(String gameName, String gameType, Integer pageNum) {
        Pager<Game> pager = new Pager<Game>();
        pager.setList(gameDao.selectGameByCon(gameName,gameType,pageNum));
        pager.setCount(gameDao.selectGameCount(gameName,gameType));
        pager.setPageNum(pageNum);
        if(pager.getCount()% Constants.PAGESIZE==0){
            pager.setTotalPage(pager.getCount()/Constants.PAGESIZE);
        }else{
            pager.setTotalPage(pager.getCount()/Constants.PAGESIZE+1);
        }
        return pager;
    }

    @Override
    public Game getOneGameById(String gameId) {

        return gameDao.selectGameById(gameId);
    }

    @Override
    public void addOrUpdate(Game game, MultipartFile gameCover, MultipartFile gameScreen1,MultipartFile gameScreen2,MultipartFile gameScreen3, String funCode,String gameId,MultipartFile gameFile) throws GameNameHasExsistException {

        MultipartFile[] files = {gameScreen1,gameScreen2,gameScreen3};
        if (funCode.equals("1")){//创建新的游戏
            game.setGameId(creater.createGameId());
            game.setGameCreateTime(new Date());
            game.setGameUpdateTime(new Date());

            game.setGameFile(game.getGameName()+gameFile.getOriginalFilename().substring(gameFile.getOriginalFilename().lastIndexOf(".")));
            String gameCoverName =game.getGameId() + gameCover.getOriginalFilename().substring(gameCover.getOriginalFilename().lastIndexOf("."));

            String gameScreenName = game.getGameId()+"1"+gameScreen1.getOriginalFilename().substring(gameScreen1.getOriginalFilename().lastIndexOf(".")) + "," +game.getGameId()+"2"+gameScreen2.getOriginalFilename().substring(gameScreen2.getOriginalFilename().lastIndexOf("."))+","+game.getGameId()+"3"+gameScreen3.getOriginalFilename().substring(gameScreen3.getOriginalFilename().lastIndexOf("."));

            game.setGameCover(gameCoverName);
            game.setGameScreen(gameScreenName);
            if (gameDao.selectGameByName(game.getGameName(),game.getGameId())!=null){
                throw new GameNameHasExsistException("该游戏名已存在！");
            }
            gameDao.insertNewGame(game);



            File needUploadCover = new File(coverFileUrl,gameCoverName);
            try {
                gameCover.transferTo(needUploadCover);
                System.out.println("封面上传成功");
            } catch (IOException e) {
                e.printStackTrace();
            }
            int i = 1;
            for(MultipartFile file:files){
                File needUploadScreen = new File(screensFileUrl,game.getGameId()+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
                try {
                    file.transferTo(needUploadScreen);
                    System.out.println("游戏截图上传成功");
                    i++;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            File uploadGameFile = new File(gameFileUrl,game.getGameName()+gameFile.getOriginalFilename().substring(gameFile.getOriginalFilename().lastIndexOf(".")));
            try {
                gameFile.transferTo(uploadGameFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }else {//修改现有的游戏

            String[] screens=gameDao.selectGameById(gameId).getGameScreen().split(",");
            game.setGameUpdateTime(new Date());
            gameDao.updateGameById(game,gameId);
            if (gameDao.selectGameByName(game.getGameName(),gameId)!=null){
                throw new GameNameHasExsistException("该游戏名已存在！");
            }
//            System.out.println("文件名"+gameCover+" "+gameScreen1+" "+gameScreen2+" "+gameScreen3);
            if(gameCover!=null&&gameCover.getSize()!=0){

                File file = new File(coverFileUrl,gameDao.selectGameById(gameId).getGameCover());
                System.out.println(file.exists());
                try {
                    gameCover.transferTo(file);
                    System.out.println("封面上传成功");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (gameScreen1!=null&&gameScreen1.getSize()!=0){
                File file = new File(screensFileUrl,screens[0]);
                System.out.println("filename"+screens[0]);
                try {
                    gameScreen1.transferTo(file);
                    System.out.println("截图上传成功");

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (gameScreen2!=null&&gameScreen2.getSize()!=0){
                File file = new File(screensFileUrl,screens[1]);
                try {
                    gameScreen2.transferTo(file);
                    System.out.println("截图上传成功");

                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            if (gameScreen3!=null&&gameScreen3.getSize()!=0){
                File file = new File(screensFileUrl,screens[2]);
                try {
                    gameScreen3.transferTo(file);
                    System.out.println("截图上传成功");

                } catch (IOException e) {
                    e.printStackTrace();
                }

            }


        }
    }

    @Override
    public void deleteGames(String[] gameIds) {
        for (String gameId:gameIds){
            Game game = gameDao.selectGameById(gameId);
            gameDao.deleteGameById(gameId);
            File coverFile = new File(coverFileUrl,game.getGameCover());
            coverFile.delete();
            String[] screens = game.getGameScreen().split(",");
            for (String screen:screens){
                File screenFile = new File(screensFileUrl,screen);
                screenFile.delete();
            }
            File gameFile = new File(gameFileUrl,game.getGameFile());
            gameFile.delete();
        }
    }
}
