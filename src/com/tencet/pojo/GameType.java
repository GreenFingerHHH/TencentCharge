package com.tencet.pojo;

import java.util.Date;

public class GameType {

    private String typeId;
    private String typeName;
    private Integer typeStatus;
    private String typePicture;
    private Date typeCreateTime;
    private Date typeUpdateTime;

    public GameType() {
    }

    public GameType(String typeId, String typeName, Integer typeStatus, String typePicture, Date typeCreateTime, Date typeUpdateTime) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.typeStatus = typeStatus;
        this.typePicture = typePicture;
        this.typeCreateTime = typeCreateTime;
        this.typeUpdateTime = typeUpdateTime;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Integer getTypeStatus() {
        return typeStatus;
    }

    public void setTypeStatus(Integer typeStatus) {
        this.typeStatus = typeStatus;
    }

    public String getTypePicture() {
        return typePicture;
    }

    public void setTypePicture(String typePicture) {
        this.typePicture = typePicture;
    }

    public Date getTypeCreateTime() {
        return typeCreateTime;
    }

    public void setTypeCreateTime(Date typeCreateTime) {
        this.typeCreateTime = typeCreateTime;
    }

    public Date getTypeUpdateTime() {
        return typeUpdateTime;
    }

    public void setTypeUpdateTime(Date typeUpdateTime) {
        this.typeUpdateTime = typeUpdateTime;
    }
}
