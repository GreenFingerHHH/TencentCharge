package com.tencet.dao;

import com.tencet.pojo.Province;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProvinceDao {

    @Select("select * from t_province")
    public List<Province> selectProvince();
}
