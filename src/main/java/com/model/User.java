package com.model;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

/**
 * 实体类：用户
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:03
 */
@Table(name = "tbs_user")
public class User implements Serializable{
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String profilePhoto;
    private int sex;
    private int roleType;
    @Transient
    private boolean rememberMe;  //记住密码


    public boolean isRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getRoleType() {
        return roleType;
    }

    public void setRoleType(int roleType) {
        this.roleType = roleType;
    }
}
