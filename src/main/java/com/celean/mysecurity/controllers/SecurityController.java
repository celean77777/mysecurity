package com.celean.mysecurity.controllers;

import com.celean.mysecurity.entities.User;
import com.celean.mysecurity.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequiredArgsConstructor
public class SecurityController {
    private final UserService userService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/unsecured")
    public String usecuredPage() {
        return "unsecured";
    }

    @GetMapping("/auth_page")
    public String authenticatedPage() {
        return "authenticated";
    }

    @GetMapping("/DELETE")
    public String deletePage() {
        return "DELETE_PAGE";
    }

    @GetMapping("/GET")
    public String getPage() {
        return "GET_PAGE";
    }

    @GetMapping("/EDIT")
    public String editPage() {
        return "EDIT_PAGE";
    }

    @GetMapping("/admin")
    // @PreAuthorize("hasRole('ADMIN')")
    public String adminPage() {
        return "admin";
    }

    @GetMapping("/user_info")
    public String daoTestPage(Principal principal) {
        User user = userService
                .findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("Unable to find user by username: " + principal.getName()));
        return "Authenticated user info: " + user.getUsername() + " : " + user.getEmail();
    }

}
