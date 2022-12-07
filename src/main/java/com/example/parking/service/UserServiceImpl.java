package com.example.parking.service;

import com.example.parking.bean.UserVO;
import com.example.parking.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {
    @Autowired
    UserDAO userDAO;
    public UserVO getUser(UserVO vo){
        return userDAO.getUser(vo);
    }
}
