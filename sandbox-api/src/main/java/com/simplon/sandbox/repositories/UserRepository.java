package com.simplon.sandbox.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simplon.sandbox.entities.User;

public interface UserRepository
	extends JpaRepository<User, Long> {

}
