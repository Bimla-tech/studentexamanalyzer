package com.exam.studentexamanalyzer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.exam.studentexamanalyzer.model.*;



public interface QuestionRepository extends JpaRepository<Question, Long> { 
	 List<Question> findBySubjectAndDifficulty(Subject subject, String difficulty);

}

