package ru.pis.lab4.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.pis.lab4.model.User;
import ru.pis.lab4.service.UserService;

@Controller
@RequiredArgsConstructor
public class RegistrationController {
    private final UserService userService;


    @GetMapping("/registration")
    public String getRegPage() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, String role, Model model) {
        boolean result = userService.addUser(user, role);
        if (!result) {
            model.addAttribute("message", "User exists");
            return "registration";
        }
        return "redirect:/login";
    }

}
