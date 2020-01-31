package com.tencet.test;

import com.tencet.util.UserIdCreater;

import java.io.File;

public class test {
    public static void main(String[] args) {
        File file = new File("FileSource");
        System.out.println(file.getAbsolutePath());
    }
}
