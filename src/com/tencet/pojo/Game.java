package com.tencet.pojo;

import java.util.Date;

public class Game {
    private String gameId;
    private String gameName;
    private String gameType;
    private Integer gameStatus;
    private String gameCover;
    private String gameScreen;
    private Double gameCurrency;
    private Double gameTariffe;
    private String gameDevelopers;
    private String gameFiling;
    private String gameDetail;
    private String gameIntroduction;
    private Date gameCreateTime;
    private Date gameUpdateTime;
    private String gameFile;

    public Game() {
    }

    public Game(String gameId, String gameName, String gameType, Integer gameStatus, String gameCover, String gameScreen, Double gameCurrency, Double gameTariffe, String gameDevelopers, String gameFiling, String gameDetail, String gameIntroduction, Date gameCreateTime, Date gameUpdateTime, String gameFile) {
        this.gameId = gameId;
        this.gameName = gameName;
        this.gameType = gameType;
        this.gameStatus = gameStatus;
        this.gameCover = gameCover;
        this.gameScreen = gameScreen;
        this.gameCurrency = gameCurrency;
        this.gameTariffe = gameTariffe;
        this.gameDevelopers = gameDevelopers;
        this.gameFiling = gameFiling;
        this.gameDetail = gameDetail;
        this.gameIntroduction = gameIntroduction;
        this.gameCreateTime = gameCreateTime;
        this.gameUpdateTime = gameUpdateTime;
        this.gameFile = gameFile;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameType() {
        return gameType;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public Integer getGameStatus() {
        return gameStatus;
    }

    public void setGameStatus(Integer gameStatus) {
        this.gameStatus = gameStatus;
    }

    public String getGameCover() {
        return gameCover;
    }

    public void setGameCover(String gameCover) {
        this.gameCover = gameCover;
    }

    public String getGameScreen() {
        return gameScreen;
    }

    public void setGameScreen(String gameScreen) {
        this.gameScreen = gameScreen;
    }

    public Double getGameCurrency() {
        return gameCurrency;
    }

    public void setGameCurrency(Double gameCurrency) {
        this.gameCurrency = gameCurrency;
    }

    public Double getGameTariffe() {
        return gameTariffe;
    }

    public void setGameTariffe(Double gameTariffe) {
        this.gameTariffe = gameTariffe;
    }

    public String getGameDevelopers() {
        return gameDevelopers;
    }

    public void setGameDevelopers(String gameDevelopers) {
        this.gameDevelopers = gameDevelopers;
    }

    public String getGameFiling() {
        return gameFiling;
    }

    public void setGameFiling(String gameFiling) {
        this.gameFiling = gameFiling;
    }

    public String getGameDetail() {
        return gameDetail;
    }

    public void setGameDetail(String gameDetail) {
        this.gameDetail = gameDetail;
    }

    public String getGameIntroduction() {
        return gameIntroduction;
    }

    public void setGameIntroduction(String gameIntroduction) {
        this.gameIntroduction = gameIntroduction;
    }

    public Date getGameCreateTime() {
        return gameCreateTime;
    }

    public void setGameCreateTime(Date gameCreateTime) {
        this.gameCreateTime = gameCreateTime;
    }

    public Date getGameUpdateTime() {
        return gameUpdateTime;
    }

    public void setGameUpdateTime(Date gameUpdateTime) {
        this.gameUpdateTime = gameUpdateTime;
    }

    @Override
    public String toString() {
        return gameId+" "+gameName+" "+gameType+" "+gameStatus+" "+gameCover+" "+gameScreen+" "+gameCurrency+" "+gameTariffe+" "+gameDevelopers+" "+gameFiling+" "+gameDetail+" "+gameIntroduction+" "+gameCreateTime+" "+gameUpdateTime;
    }

    public String getGameFile() {
        return gameFile;
    }

    public void setGameFile(String gameFile) {
        this.gameFile = gameFile;
    }
}
