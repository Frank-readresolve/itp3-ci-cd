package com.simplon.sandbox.services;

import java.util.Collection;

import org.springframework.stereotype.Service;

import com.simplon.sandbox.entities.User;
import com.simplon.sandbox.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository users;

    public UserServiceImpl(UserRepository users) {
	this.users = users;
    }

    @Override
    public Collection<User> getAll() {
	return users.findAll();
    }

}
