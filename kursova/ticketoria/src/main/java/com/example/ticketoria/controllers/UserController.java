package com.example.ticketoria.controllers;

import com.example.ticketoria.models.User;
import com.example.ticketoria.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequiredArgsConstructor

public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";

    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Користувач з e-mail: " + user.getEmail() + " вже існує");
            return "registration";
        }
        userService.createUser(user);
        return "redirect:/login";
    }

    @GetMapping("/logout/")
    public String logout() {
        userService.logout();
        return "redirect:/";
    }



}