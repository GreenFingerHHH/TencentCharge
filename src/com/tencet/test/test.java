package com.tencet.test;

import com.tencet.util.UserIdCreater;

import java.io.File;

public class test {
    public static void main(String[] args) {
        String baseFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/out/artifacts/TencentCharge_war_exploded/usedimg/gameType";

        String coverFileUrl = "/Users/sunfish/Downloads/三阶段项目MY/TencentCharge/out/artifacts/TencentCharge_war_exploded/usedimg/game";

        File newFile = new File(coverFileUrl,"YX0007.jpg");
        System.out.println(newFile.exists());
    }
}
