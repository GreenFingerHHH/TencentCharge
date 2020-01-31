package com.tencet.controller;

import com.tencet.exception.NotChooseUsersException;
import com.tencet.pojo.GameType;
import com.tencet.service.GameTypeService;
import com.tencet.util.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/gameType")
public class GameTypeController {

    @Autowired
    private GameTypeService gameTypeService;

    String successInfo;

    @RequestMapping("/getAllGameType")
    @ResponseBody
    public Pager<GameType> getAllGameType(@RequestParam(value = "gameType",required = false) String gameType,@RequestParam(value = "status",required = false) Integer status,@RequestParam("pageNum") Integer pageNum){
        return gameTypeService.getAllGameType(gameType,status,pageNum);
    }

    @RequestMapping("/addGameType")
    public ModelAndView addGameType(String typeName, Integer typeStatus, MultipartFile file){

        successInfo = "添加成功";
        ModelAndView modelAndView = new ModelAndView();
        try {
            gameTypeService.addGameType(typeName,typeStatus,file);
            modelAndView.addObject("isSuccess",true);
            modelAndView.addObject("successInfo",successInfo);
            modelAndView.setViewName("/gameType/gametype.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("isFail",true);
            modelAndView.addObject("errorInfo","该游戏类型名已存在！");
            modelAndView.setViewName("/gameType/addGameType.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/getGameType")
    public ModelAndView getGameType(@Param("typeId")String typeId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("gameType",gameTypeService.getOneGameTypeByTypeId(typeId));
        modelAndView.setViewName("/gameType/updateGameType.jsp");
        return modelAndView;
    }

    @RequestMapping("/updateGameType")
    public ModelAndView updateGameType(String typeName,String typeId,Integer typeStatus){
        successInfo = "修改成功！";
        ModelAndView modelAndView = new ModelAndView();
        try {
            gameTypeService.updateGameType(typeId,typeName,typeStatus);
            modelAndView.addObject("isSuccess",true);
            modelAndView.addObject("successInfo",successInfo);
            modelAndView.setViewName("/gameType/gametype.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("isFail",true);
            modelAndView.addObject("errorInfo","该游戏类型名已存在！");
            modelAndView.setViewName("/gameType/updateGameType.jsp");
        }

        return modelAndView;
    }

    @RequestMapping("/deleteGameType")
    public ModelAndView deleteGameType(@RequestParam(value = "games",required = false) String[] typeIds){
        successInfo="删除成功！";
        ModelAndView modelAndView = new ModelAndView();
        try {
          List<String > list = gameTypeService.deleteGameTypeByTypeIds(typeIds);
            System.out.println(list.size());
            if (list.size() == 0){
                modelAndView.addObject("isSuccess",true);
                modelAndView.addObject("successInfo",successInfo);
            }else {
                modelAndView.addObject("isLeft",true);
                modelAndView.addObject("left",list);
            }

        } catch (NotChooseUsersException e) {
            e.printStackTrace();
            modelAndView.addObject("isFail",true);
            modelAndView.addObject("errorInfo","未选择游戏类型名！");
        }
        modelAndView.setViewName("/gameType/gametype.jsp");
        return modelAndView;
    }

    @RequestMapping("/getAllGameTypes")
    @ResponseBody
    public List<GameType> getAllGameTypes(){
        return gameTypeService.getAllGameTypes();
    }
}
