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

    @GetMapping("/")
    public String greetingForm(Map<String, Object> model) {
        return "greetings";
    }

    @PostMapping("/login")
    public String greetingSubmit(@RequestParam String userName,
                                 Model model) {
        User user = new User();
        user.setUsername(userName);
        model.addAttribute("user", user);
        return "main";
    }
    @GetMapping("/main")
    public String mainForm (Map <String ,Object> users) {

        return "main";
    }

    @GetMapping("/login")
    public String loginForm () {
        return "login";
    }

}

