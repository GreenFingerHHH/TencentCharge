package com.tencet.dao;

import com.tencet.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.Date;
import java.util.List;

@Repository
public interface UserDao {

    @Select("select * from t_users where user_name = #{0} and user_pwd =#{1}")
    User selectOneUserByNameAndPwd(String username, String pwd);

    @Select("select * from t_users where user_name = #{0}")
    List<User> selectUserByName(String name);

    @Select("select * from t_users where user_phone = #{0}")
    List<User> selectUserByPhone(String phoneNumber);

    @Insert("insert into t_users values (#{6},#{0},#{1},#{4},#{2},1000,1000,1,#{7},#{3},#{5})")
    void insertUser(String userName, String userPwd, String phone, String sex, String birthday, String province,String userId,Date createTime);

    @Select("select user_id from t_users")
    List<String> selectId();

    List<User> selectAllUsers(@Param("userAccount") String username, @Param("userPhone") String phone,@Param("pageNum")  Integer pageNum);

    Integer selectUsersCount(@Param("userAccount") String username, @Param("userPhone") String phone);

    void updateUserStatusByUserId(@Param("userId") String[] userId,@Param("status") Integer status);

    @Select("select * from t_users where user_id = #{0}")
    User selectUserById(String userId);

    @Update("update t_users set user_currency = #{0} where user_id = #{1}")
    void updateUserCurrencyById(double currency, String userId);

    @Update("update t_users set user_tariffe = #{0} where user_id = #{1}")
    void updateUserTariffeById(double tariffe, String userId);
}
