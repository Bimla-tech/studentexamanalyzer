package com.exam.studentexamanalyzer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.exam.studentexamanalyzer.model.*;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}

