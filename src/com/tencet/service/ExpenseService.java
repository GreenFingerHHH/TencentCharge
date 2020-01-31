package com.tencet.service;

public interface ExpenseService {

    String buyGame(String userId, String gameId, Integer operatorId);

    String getBuyStatus(String userId, String gameId);

    void updateExpense(String userId, String gameId);
}
