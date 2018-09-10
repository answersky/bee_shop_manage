package cn.bee.service;


import cn.bee.User;

/**
 * Created by liuf on 2016/7/3.
 */
public interface UserValidateService {
    User findByUsername(String username);
}
