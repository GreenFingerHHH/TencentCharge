package com.tencet.service.impl;

import com.tencet.dao.PrepDao;
import com.tencet.pojo.Prepaid;
import com.tencet.service.PrepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrepServiceImpl implements PrepService {
    @Autowired
    private PrepDao prepDao;

    @Override
    public List<Prepaid> getAllPrepsByUserId(String userId) {

        return prepDao.selectAllPrepByUserId(userId);
    }
}
