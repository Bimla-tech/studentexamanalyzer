package com.exam.studentexamanalyzer.controller;

import com.exam.studentexamanalyzer.model.Subject;
import com.exam.studentexamanalyzer.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/subjects")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @GetMapping
    public String listSubjects(Model model) {
        model.addAttribute("subjects", subjectService.listAll());
        return "admin-subjects";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("subject", new Subject());
        return "add-subject";
    }

    @PostMapping("/save")
    public String saveSubject(@ModelAttribute Subject subject) {
        subjectService.save(subject);
        return "redirect:/admin/subjects";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        subjectService.delete(id);
        return "redirect:/admin/subjects";
    }
}
