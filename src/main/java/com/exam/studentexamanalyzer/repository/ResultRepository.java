package com.exam.studentexamanalyzer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.exam.studentexamanalyzer.model.*;



public interface ResultRepository extends JpaRepository<Result, Long> { }
