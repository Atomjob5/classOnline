package com.service.impl;

import com.dao.UserDao;
import com.model.User;
import com.service.UserService;
//import jdk.internal.module.ModuleLoaderMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

//import java.util.List;

/**
 * @author Atom
 * @date 2020/1/7
 * @time 16:05
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;


    /**
     * select * from user where id = ?
     * @param user
     * @return
     */
    @Override
    public boolean isExistUser(User user) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("username", user.getUsername());
        User res = userDao.selectOneByExample(example);
        if (res == null) {
            return false;
        }
        return true;
    }

    /**
     * select * from user where username = ? and password = ?
     * @param username
     * @param password
     * @return
     */
    @Override
    public User validateUser(String username, String password) {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", username);
        criteria.andEqualTo("password", password);
        User user = userDao.selectOneByExample(example);
        return user;
    }
    @Override
    public List<User> selectUserById(){
        Example example=new Example(User.class);
        Example.Criteria criteria=example.createCriteria();
        criteria.andLessThanOrEqualTo("roleType",2);
//        System.out.println("1");
//        userList=userDao.selectByExample(example);
        return userDao.selectByExample(example);
    }
}
