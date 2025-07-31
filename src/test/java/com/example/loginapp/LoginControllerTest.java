package com.example.loginapp;

import com.example.loginapp.model.User;
import com.example.loginapp.service.LoginService;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
public class LoginControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private LoginService loginService;

    @Test
    public void testLoginPageLoads() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("login"));
    }

    @Test
    public void testSuccessfulLogin() throws Exception {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("password");

        when(loginService.validateUser(Mockito.any(User.class))).thenReturn(true);

        mockMvc.perform(post("/login")
                .param("username", "admin")
                .param("password", "password"))
                .andExpect(status().isOk())
                .andExpect(view().name("welcome"))
                .andExpect(model().attributeExists("message"));
    }

    @Test
    public void testFailedLogin() throws Exception {
        when(loginService.validateUser(Mockito.any(User.class))).thenReturn(false);

        mockMvc.perform(post("/login")
                .param("username", "wrongUser")
                .param("password", "wrongPassword"))
                .andExpect(status().isOk())
                .andExpect(view().name("login"))
                .andExpect(model().attributeExists("error"));
    }
}
