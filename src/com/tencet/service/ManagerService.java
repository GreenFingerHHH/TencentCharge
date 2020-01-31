package com.tencet.service;

import com.tencet.exception.NotFoundManagerException;
import com.tencet.pojo.Manager;

public interface ManagerService {
    Manager getOneManagerByNameAndPwd(String username,String password) throws Exception;

    String getManagerByName(String username) throws NotFoundManagerException;
}
