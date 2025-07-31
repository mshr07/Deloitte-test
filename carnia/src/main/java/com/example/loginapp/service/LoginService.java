package com.example.loginapp.service;

import com.example.loginapp.model.User;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "password";

    public boolean validateUser(User user) {
        return USERNAME.equals(user.getUsername()) && PASSWORD.equals(user.getPassword());
    }
}
