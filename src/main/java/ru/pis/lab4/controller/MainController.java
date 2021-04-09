package ru.pis.lab4.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.pis.lab4.model.Employee;
import ru.pis.lab4.model.User;
import ru.pis.lab4.service.MainService;

import java.util.List;

import static java.util.Objects.isNull;


@Controller
@RequiredArgsConstructor
public class MainController {
    private final MainService mainService;

    @GetMapping("/")
    public String index() {
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String mainPage(Model model) {
        List<Employee> allEmployees = mainService.getAllEmployees();
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        model.addAttribute("employees", allEmployees);
        model.addAttribute("role", isNull(user) ? "" : user.getRoles().get(0));
        return "mainPage";
    }
}
