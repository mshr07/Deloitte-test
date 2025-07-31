package com.example.loginapp.controller;

import com.example.loginapp.model.User;
import com.example.loginapp.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute User user, Model model) {
        if (loginService.validateUser(user)) {
            model.addAttribute("message", "Welcome to the Harness CD pipeline deployment with helm & without helm.");
            return "welcome";
        }
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }
}
