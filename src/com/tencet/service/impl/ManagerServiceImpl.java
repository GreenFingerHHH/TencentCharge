package com.tencet.service.impl;

import com.tencet.dao.ManagerDao;
import com.tencet.exception.LoginFailException;
import com.tencet.exception.NotFoundManagerException;
import com.tencet.pojo.Manager;
import com.tencet.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;


    @Transactional
    @Override
    public Manager getOneManagerByNameAndPwd(String username, String password) throws Exception {
        Manager manager = managerDao.selectOneManagerByNameAndPwd(username, password);
        if(manager==null){
            throw new LoginFailException("用户名或密码错误！");
        }
        return manager;
    }

    @Override
    public String getManagerByName(String username) throws NotFoundManagerException {
        String phone = managerDao.selectManagerPhoneByName(username);
        if (phone == null){
            throw new NotFoundManagerException("该管理员账户不存在！");
        }

        return phone;
    }
}
