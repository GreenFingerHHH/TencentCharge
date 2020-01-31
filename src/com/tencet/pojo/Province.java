package com.tencet.pojo;

public class Province {
    private Integer provId;
    private String provName;

    public Province() {
    }

    public Province(Integer provId, String provName) {
        this.provId = provId;
        this.provName = provName;
    }

    public Integer getProvId() {
        return provId;
    }

    public void setProvId(Integer provId) {
        this.provId = provId;
    }

    public String getProvName() {
        return provName;
    }

    public void setProvName(String provName) {
        this.provName = provName;
    }
}
