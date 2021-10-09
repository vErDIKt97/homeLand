package com.example.homeland.controller;

import com.example.homeland.domain.Role;
import com.example.homeland.domain.User;
import com.example.homeland.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class UserController {
    private final UserRepo userRepo;

    public UserController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("userList")
    //при переходе на страницу отправляем всех пользователей которые есть в базе
    public String userListForm (Map<String , Object> model) {
        List<User> userList = userRepo.findAll();
        model.put("userList",userList);
        return "userList";
    }

    @GetMapping("/user/{user}")
    //при редактировании пользователя передаем текущие данные пользователя
    public String userEditForm (@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    @PostMapping("/user")
    //сохраняем пользователя
    public String saveUserEdit (
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());


        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

        return "redirect:/userList";
    }
}
