package com.exam.studentexamanalyzer.service;

import com.exam.studentexamanalyzer.model.*;
import com.exam.studentexamanalyzer.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ExamService {
    @Autowired private QuestionRepository questionRepo;
    @Autowired private ResultRepository resultRepo;

    public List<Question> getAllQuestions() {
        return questionRepo.findAll();
    }

    public void saveResult(Result r) {
        resultRepo.save(r);
    }
}
