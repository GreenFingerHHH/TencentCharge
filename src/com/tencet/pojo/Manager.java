package com.tencet.pojo;

public class Manager {

    private String id;
    private String userAccount;
    private String userPwd;
    private String userPhone;
    private String createTime;


    public Manager() {
    }

    public Manager(String id, String userAccount, String userPwd, String userPhone, String createTime) {
        this.id = id;
        this.userAccount = userAccount;
        this.userPwd = userPwd;
        this.userPhone = userPhone;
        this.createTime = createTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
