package com.example.loginapp;

import com.example.loginapp.model.User;
import com.example.loginapp.service.LoginService;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class LoginServiceTest {

    private final LoginService loginService = new LoginService();

    @Test
    public void testValidLogin() {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("password");
        assertTrue(loginService.validateUser(user));
    }

    @Test
    public void testInvalidLogin() {
        User user = new User();
        user.setUsername("user");
        user.setPassword("wrongpassword");
        assertFalse(loginService.validateUser(user));
    }
}
