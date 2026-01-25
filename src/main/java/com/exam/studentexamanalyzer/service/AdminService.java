package com.exam.studentexamanalyzer.service;

import com.exam.studentexamanalyzer.model.Question;
import com.exam.studentexamanalyzer.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdminService {

    @Autowired
    private QuestionRepository questionRepo;

    // ✅ Get all questions
    public List<Question> getAllQuestions() {
        return questionRepo.findAll();
    }

    // ✅ Add a new question
    public Question addQuestion(Question q) {
        return questionRepo.save(q);
    }

    // ✅ Find question by ID
    public Optional<Question> getQuestionById(Long id) {
        return questionRepo.findById(id);
    }

    // ✅ Update existing question
    public Question updateQuestion(Question q) {
        return questionRepo.save(q);
    }

    // ✅ Delete question
    public void deleteQuestion(Long id) {
        questionRepo.deleteById(id);
    }
}
