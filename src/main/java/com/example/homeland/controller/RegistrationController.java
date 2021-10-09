package com.example.homeland.controller;

import com.example.homeland.domain.Role;
import com.example.homeland.domain.User;
import com.example.homeland.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private final UserRepo userRepo;

    public RegistrationController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @PostMapping("/registration")
    //регистрация нового пользователя
    public String addUser(User user,
                          Map<String, Object> model) {
        User userFromDB = userRepo.findByUsername(user.getUsername());
        if (userFromDB == user) {
            model.put("message", "Пользователь с таким именем уже существует");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return "redirect:/login";
    }

    @GetMapping("/registration")
    public String registrationForm(){
        return "/registration";
    }

}
