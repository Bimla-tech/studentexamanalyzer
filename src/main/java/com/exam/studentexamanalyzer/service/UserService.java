package com.exam.studentexamanalyzer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.exam.studentexamanalyzer.model.User;
import com.exam.studentexamanalyzer.repository.UserRepository;

@Service
public class UserService {
    @Autowired private UserRepository repo;

    public User register(User u) {
        if (u.getRole() == null) u.setRole("USER");
        return repo.save(u);
    }

    public User login(String username, String password) {
        User u = repo.findByUsername(username);
        return (u != null && u.getPassword().equals(password)) ? u : null;
    }
}

