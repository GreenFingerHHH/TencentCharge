package com.tencet.dao;


import com.tencet.pojo.Manager;
import org.apache.ibatis.annotations.Select;

public interface ManagerDao {
    @Select("select * from t_managers where user_account = #{0} and user_pwd = #{1}")
    public Manager selectOneManagerByNameAndPwd(String username,String password);


    @Select("select user_phone from t_managers where user_account = #{0}")
    String selectManagerPhoneByName(String username);
}
