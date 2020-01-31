package com.tencet.controller;

import com.tencet.constant.Constants;
import com.tencet.exception.GameNameHasExsistException;
import com.tencet.pojo.Game;
import com.tencet.pojo.GameType;
import com.tencet.service.ExpenseService;
import com.tencet.service.GameService;
import com.tencet.service.GameTypeService;
import com.tencet.util.Pager;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/game")
public class GameController {

    @Autowired
    private GameService gameService;

    @Autowired
    private ExpenseService expenseService;


    @RequestMapping("/getAllGame")
    @ResponseBody
    public Pager<Game> getAllGame(@RequestParam(value = "gameName",required = false) String gameName,@RequestParam(value = "gameType",required = false) String gameType,@RequestParam("pageNum") Integer pageNum){
        return gameService.getAllGame(gameName,gameType,pageNum);
    }

    @RequestMapping("/gameDetails")
    public ModelAndView getDetails(@RequestParam(value = "gameId") String gameId,@RequestParam("status") Integer status){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("game",gameService.getOneGameById(gameId));
        if (status==1){
            modelAndView.setViewName("/game/gameDetails.jsp");
        }else {
            modelAndView.setViewName("/user/gameDetail.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateGame")
    public ModelAndView addOrUpdateGame(@RequestParam(value = "gameId",required = false)String gameId){
        ModelAndView modelAndView = new ModelAndView();
        if (gameId == null||gameId.equals("")){
            modelAndView.addObject("isAdd",true);
        }else {
            modelAndView.addObject("isUpdate",true);
            modelAndView.addObject("game",gameService.getOneGameById(gameId));
        }
        modelAndView.setViewName("/game/updateGame.jsp");
        return modelAndView;
    }

    @RequestMapping("/addOrUpdate")
    public ModelAndView addOrUpdate(String gameName, String gameTypes, Integer gameStatus, String gameDevelopers, String gameFiling, String gameIntroduction, String gameDetail, Double gameCurrency, Double gameTariffe, MultipartFile gameCover,MultipartFile gameScreen1,MultipartFile gameScreen2,MultipartFile gameScreen3,String funCode,String gameId,MultipartFile gameFile){
        ModelAndView modelAndView = new ModelAndView();
        Game game = new Game();
        game.setGameName(gameName);
        game.setGameType(gameTypes);
        game.setGameStatus(gameStatus);
        game.setGameDevelopers(gameDevelopers);
        game.setGameFiling(gameFiling);
        game.setGameIntroduction(gameIntroduction);
        game.setGameDetail(gameDetail);
        game.setGameCurrency(gameCurrency);
        game.setGameTariffe(gameTariffe);
        try {
            gameService.addOrUpdate(game,gameCover,gameScreen1,gameScreen2,gameScreen3,funCode,gameId,gameFile);
            modelAndView.setViewName("/game/game.jsp");
        } catch (GameNameHasExsistException e) {
            e.printStackTrace();
            modelAndView.addObject("gameExisit",true);
            modelAndView.addObject("errorMessage","游戏名已存在！");
        }
        return modelAndView;
    }


    @RequestMapping("/deleteGames")
    public ModelAndView deleteGames(@RequestParam("games") String[] games){
        ModelAndView modelAndView = new ModelAndView();
        gameService.deleteGames(games);
        modelAndView.setViewName("/game/game.jsp");
        return modelAndView;

    }

    @RequestMapping("/downloadGame")
    public void downloadGame(String gameId, String userId, HttpServletResponse response, HttpServletRequest request){
        System.out.println("进入后台！");
        String fileName = gameService.getOneGameById(gameId).getGameFile();
        System.out.println("游戏文件名:"+fileName);
        try {
            String filenameDisplay = URLEncoder.encode(fileName,"UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename="+filenameDisplay);
            String sourcePath = Constants.uploadGameSourcePath;
            ServletOutputStream servletOutputStream = null;
            servletOutputStream = response.getOutputStream();
            File file = new File(sourcePath,fileName);
            byte[] bytes = FileUtils.readFileToByteArray(file);
            servletOutputStream.write(bytes);
            servletOutputStream.flush();
            servletOutputStream.close();
            expenseService.updateExpense(userId,gameId);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

}
