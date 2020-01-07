package com.service;

import com.model.User;

import java.util.List;

/**
 * @author Atom
 * @date 2020/1/7
 * @time 16:05
 */
public interface UserService {
    boolean isExistUser(User user);

    User validateUser(String username, String password);
    List<User> selectUserById();
}
