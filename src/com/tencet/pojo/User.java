package com.tencet.pojo;

import java.util.Date;

public class User {
    private String userId;
    private String userName;
    private String userPwd;
    private String userBirthday;
    private String userPhone;
    private double userTariffe;
    private double userCurrency;
    private int userStatus;
    private Date userCreateTime;
    private String userSex;
    private Integer userLocation;
    public User() {
    }

    public User(String userId, String userName, String userPwd, String userBirthday, String userPhone, double userTariffe, double userCurrency, int userStatus, Date userCreateTime, String userSex, Integer userLocation) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userBirthday = userBirthday;
        this.userPhone = userPhone;
        this.userTariffe = userTariffe;
        this.userCurrency = userCurrency;
        this.userStatus = userStatus;
        this.userCreateTime = userCreateTime;
        this.userSex = userSex;
        this.userLocation = userLocation;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(String userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public double getUserTariffe() {
        return userTariffe;
    }

    public void setUserTariffe(double userTariffe) {
        this.userTariffe = userTariffe;
    }

    public double getUserCurrency() {
        return userCurrency;
    }

    public void setUserCurrency(double userCurrency) {
        this.userCurrency = userCurrency;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public Date getUserCreateTime() {
        return userCreateTime;
    }

    public void setUserCreateTime(Date userCreateTime) {
        this.userCreateTime = userCreateTime;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Integer getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(Integer userLocation) {
        this.userLocation = userLocation;
    }
}
