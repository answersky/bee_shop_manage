package cn.bee.service;

import cn.bee.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * created by liufeng
 * 2018/9/6
 */

public class RedisServiceTest extends BaseTest {

    @Autowired
    private RedisService redisService;

    @Test
    public void testSaveInfo() {
        redisService.saveInfo();
    }

    @Test
    public void find() {
        Object obj = redisService.getInfo("username");
        System.out.println(obj);
    }
}