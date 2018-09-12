package cn.bee.service;

import cn.bee.BaseTest;
import cn.bee.User;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * created by liufeng
 * 2018/9/10
 */
public class DubboTest extends BaseTest {
    @Resource
    private UserService userService;

    @Test
    public void testDubbo() {
        User user = userService.findUserByName("admin");
        System.out.println(user);
    }
}
