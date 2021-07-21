package com.example.homeland.controller;

import com.example.homeland.domain.User;
import com.example.homeland.repos.ListProdRepo;
import com.example.homeland.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;


@Controller
public class MainController {
    private final ListProdRepo listProdRepo;
    private final UserRepo userRepo;

    public MainController(UserRepo userRepo, ListProdRepo listProdRepo) {
        this.userRepo = userRepo;
        this.listProdRepo = listProdRepo;
    }

    @GetMapping("/index")
    public String greetingForm(Map<String, Object> model) {
        return "greetings";
    }

    @PostMapping("/index")
    public String greetingSubmit(@RequestParam String userName,
                                 Model model) {
        User user = new User();
        user.setNickname(userName);
        Iterable<User> users = userRepo.findAll();
        model.addAttribute("user", user);
        return "main";
    }
}

