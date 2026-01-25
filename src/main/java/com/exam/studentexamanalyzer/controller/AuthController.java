package com.exam.studentexamanalyzer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.exam.studentexamanalyzer.model.User;
import com.exam.studentexamanalyzer.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/register")
    public String registerForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user) {
        userService.register(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session,Model model) {
        User u = userService.login(username, password);
        if (u != null) {
            session.setAttribute("user", u);
            if ("ADMIN".equals(u.getRole())) return "redirect:/admin/dashboard";
            return "redirect:/exam";
        }
        model.addAttribute("error", "Invalid username or password.");
       // redirectAttributes.addFlashAttribute("error", "Invalid username or password.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
