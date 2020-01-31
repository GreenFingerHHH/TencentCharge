package com.tencet.service;

import com.tencet.pojo.Prepaid;

import java.util.List;

public interface PrepService {
    List<Prepaid> getAllPrepsByUserId(String userId);
}
