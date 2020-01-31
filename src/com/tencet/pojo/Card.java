package com.tencet.pojo;

import java.util.Date;

public class Card {
    private Integer cardId;
    private String cardNumber;
    private String cardPwd;
    private String cardAmount;
    private Integer cardProvId;
    private Date cardStartTime;
    private Date cardEndTime;
    private Integer cardStatus;
    private Date cardCreateTime;
    private String provName;

    public Card() {
    }

    public Card(Integer cardId, String cardNumber, String cardPwd, String cardAmount, Integer cardProvId, Date cardStartTime, Date cardEndTime, Integer cardStatus, Date cardCreateTime, String provName) {
        this.cardId = cardId;
        this.cardNumber = cardNumber;
        this.cardPwd = cardPwd;
        this.cardAmount = cardAmount;
        this.cardProvId = cardProvId;
        this.cardStartTime = cardStartTime;
        this.cardEndTime = cardEndTime;
        this.cardStatus = cardStatus;
        this.cardCreateTime = cardCreateTime;
        this.provName = provName;
    }

    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardPwd() {
        return cardPwd;
    }

    public void setCardPwd(String cardPwd) {
        this.cardPwd = cardPwd;
    }

    public String getCardAmount() {
        return cardAmount;
    }

    public void setCardAmount(String cardAmount) {
        this.cardAmount = cardAmount;
    }

    public Integer getCardProvId() {
        return cardProvId;
    }

    public void setCardProvId(Integer cardProvId) {
        this.cardProvId = cardProvId;
    }

    public Date getCardStartTime() {
        return cardStartTime;
    }

    public void setCardStartTime(Date cardStartTime) {
        this.cardStartTime = cardStartTime;
    }

    public Date getCardEndTime() {
        return cardEndTime;
    }

    public void setCardEndTime(Date cardEndTime) {
        this.cardEndTime = cardEndTime;
    }

    public Integer getCardStatus() {
        return cardStatus;
    }

    public void setCardStatus(Integer cardStatus) {
        this.cardStatus = cardStatus;
    }

    public Date getCardCreateTime() {
        return cardCreateTime;
    }

    public void setCardCreateTime(Date cardCreateTime) {
        this.cardCreateTime = cardCreateTime;
    }

    public String getProvName() {
        return provName;
    }

    public void setProvName(String provName) {
        this.provName = provName;
    }
}
