package com.tencet.pojo;

import java.util.Date;

public class Expense {
    private Integer expId;
    private String expUserId;
    private String expGameId;
    private Double expMonetary;
    private Integer expOperations;
    private Date expCreateTime;
    private Date expUpdateTime;
    private Integer expDownLoads;

    public Expense() {
    }

    public Expense(Integer expId, String expUserId, String expGameId, Double expMonetary, Integer expOperations, Date expCreateTime, Date expUpdateTime, Integer expDownLoads) {
        this.expId = expId;
        this.expUserId = expUserId;
        this.expGameId = expGameId;
        this.expMonetary = expMonetary;
        this.expOperations = expOperations;
        this.expCreateTime = expCreateTime;
        this.expUpdateTime = expUpdateTime;
        this.expDownLoads = expDownLoads;
    }

    public Integer getExpId() {
        return expId;
    }

    public void setExpId(Integer expId) {
        this.expId = expId;
    }

    public String getExpUserId() {
        return expUserId;
    }

    public void setExpUserId(String expUserId) {
        this.expUserId = expUserId;
    }

    public String getExpGameId() {
        return expGameId;
    }

    public void setExpGameId(String expGameId) {
        this.expGameId = expGameId;
    }

    public Double getExpMonetary() {
        return expMonetary;
    }

    public void setExpMonetary(Double expMonetary) {
        this.expMonetary = expMonetary;
    }

    public Integer getExpOperations() {
        return expOperations;
    }

    public void setExpOperations(Integer expOperations) {
        this.expOperations = expOperations;
    }

    public Date getExpCreateTime() {
        return expCreateTime;
    }

    public void setExpCreateTime(Date expCreateTime) {
        this.expCreateTime = expCreateTime;
    }

    public Date getExpUpdateTime() {
        return expUpdateTime;
    }

    public void setExpUpdateTime(Date expUpdateTime) {
        this.expUpdateTime = expUpdateTime;
    }

    public Integer getExpDownLoads() {
        return expDownLoads;
    }

    public void setExpDownLoads(Integer expDownLoads) {
        this.expDownLoads = expDownLoads;
    }
}
