package cn.bee.service.impl;

import cn.bee.User;
import cn.bee.service.UserService;
import cn.bee.service.UserValidateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by liuf on 2016/7/3.
 */
@Service(value = "userValidateService")
public class userValidateServiceImpl implements UserValidateService {
    @Resource
    private UserService userService;

    @Override
    public User findByUsername(String username) {
        return userService.findUserByName(username);
    }
}
