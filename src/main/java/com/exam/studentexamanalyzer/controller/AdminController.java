package com.exam.studentexamanalyzer.controller;

import com.exam.studentexamanalyzer.model.Question;
import com.exam.studentexamanalyzer.model.Result;
import com.exam.studentexamanalyzer.repository.QuestionRepository;
import com.exam.studentexamanalyzer.repository.ResultRepository;
import com.exam.studentexamanalyzer.repository.SubjectRepository;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController{
    @Autowired private QuestionRepository repo;
    @Autowired private ResultRepository rrepo;
    @Autowired private SubjectRepository subjectRepo;

    
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("questions", repo.findAll());
        
        List<Result> allResults = rrepo.findAll();
        Map<String, Double> userAverages = new LinkedHashMap<>();

        for (Result r : allResults) {
            userAverages.merge(r.getUsername(), r.getPercentage(), (oldVal, newVal) -> (oldVal + newVal) / 2);
        }

        model.addAttribute("userAverages", userAverages);
        
        
        
        
        return "admin-dashboard";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("question", new Question());
        model.addAttribute("subjects", subjectRepo.findAll());
        model.addAttribute("difficulties", List.of("Easy", "Medium", "Hard"));
        return "add-question";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Question q) {
        repo.save(q);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("question", repo.findById(id).orElse(null));
        return "edit-question";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Question q) {
        repo.save(q);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        repo.deleteById(id);
        return "redirect:/admin/dashboard";
    }
}
