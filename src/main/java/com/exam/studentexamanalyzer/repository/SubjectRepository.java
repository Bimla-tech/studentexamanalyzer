package com.exam.studentexamanalyzer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.exam.studentexamanalyzer.model.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Long> {
    Subject findByName(String name);
}
