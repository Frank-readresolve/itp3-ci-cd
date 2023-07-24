package com.simplon.sandbox.controllers;

import java.util.Collection;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.simplon.sandbox.entities.User;
import com.simplon.sandbox.services.UserService;

@RestController
@RequestMapping("/users")
@CrossOrigin
public class UserController {

    private final UserService service;

    public UserController(UserService service) {
	this.service = service;
    }

    @GetMapping
    public Collection<User> getAll() {
	return service.getAll();
    }

}
