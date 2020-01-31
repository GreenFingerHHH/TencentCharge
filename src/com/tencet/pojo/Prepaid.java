package com.tencet.pojo;

import java.util.Date;

public class Prepaid {
    private Integer prepId;
    private String prepUserName;
    private String prepCardNumber;
    private String prepCardAmount;
    private String prepCardPwd;
    private Date prepCreateTime;

    public Prepaid() {
    }

    public Prepaid(Integer prepId, String prepUserName, String prepCardNumber, String prepCardAmount, String prepCardPwd, Date prepCreateTime) {
        this.prepId = prepId;
        this.prepUserName = prepUserName;
        this.prepCardNumber = prepCardNumber;
        this.prepCardAmount = prepCardAmount;
        this.prepCardPwd = prepCardPwd;
        this.prepCreateTime = prepCreateTime;
    }

    public Integer getPrepId() {
        return prepId;
    }

    public void setPrepId(Integer prepId) {
        this.prepId = prepId;
    }

    public String getPrepUserName() {
        return prepUserName;
    }

    public void setPrepUserName(String prepUserName) {
        this.prepUserName = prepUserName;
    }

    public String getPrepCardNumber() {
        return prepCardNumber;
    }

    public void setPrepCardNumber(String prepCardNumber) {
        this.prepCardNumber = prepCardNumber;
    }

    public String getPrepCardPwd() {
        return prepCardPwd;
    }

    public void setPrepCardPwd(String prepCardPwd) {
        this.prepCardPwd = prepCardPwd;
    }

    public Date getPrepCreateTime() {
        return prepCreateTime;
    }

    public void setPrepCreateTime(Date prepCreateTime) {
        this.prepCreateTime = prepCreateTime;
    }

    public String getPrepCardAmount() {
        return prepCardAmount;
    }

    public void setPrepCardAmount(String prepCardAmount) {
        this.prepCardAmount = prepCardAmount;
    }
}
