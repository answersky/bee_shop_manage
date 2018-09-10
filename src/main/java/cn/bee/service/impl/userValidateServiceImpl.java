package cn.bee.service.impl;

import cn.bee.User;
import cn.bee.service.UserValidateService;
import org.springframework.stereotype.Service;

/**
 * Created by liuf on 2016/7/3.
 */
@Service(value = "userValidateService")
public class userValidateServiceImpl implements UserValidateService {

    @Override
    public User findByUsername(String username) {
        User user = null;

        return user;
    }
}
