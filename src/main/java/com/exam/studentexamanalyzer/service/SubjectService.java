package com.exam.studentexamanalyzer.service;

import com.exam.studentexamanalyzer.model.Subject;
import com.exam.studentexamanalyzer.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SubjectService {
    @Autowired
    private SubjectRepository repo;

    public List<Subject> listAll() {
        return repo.findAll();
    }

    public Subject save(Subject s) {
        return repo.save(s);
    }

    public Subject getById(Long id) {
        return repo.findById(id).orElse(null);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
