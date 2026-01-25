package com.exam.studentexamanalyzer.controller;

import com.exam.studentexamanalyzer.model.*;
import com.exam.studentexamanalyzer.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class ExamController {

    @Autowired private QuestionRepository questionRepo;
    @Autowired private ResultRepository resultRepo;
    @Autowired private SubjectRepository subjectRepo;
    

    
    
    
    @GetMapping("/exam-select")
    public String selectSubject(Model model) {
        model.addAttribute("subjects", subjectRepo.findAll());
        model.addAttribute("difficulties", List.of("Easy", "Medium", "Hard"));
        return "exam-select";
    }
   
    @PostMapping("/exam")
    public String startExam(@RequestParam Long subjectId,
                            @RequestParam String difficulty,
                            HttpSession session,Model model) {
    	
    	session.setAttribute("subjectId", subjectId);
        session.setAttribute("difficulty", difficulty);
        Subject subject = subjectRepo.findById(subjectId).orElse(null);
        if (subject == null) {
            model.addAttribute("error", "Subject not found.");
            return "error";
        }
        List<Question> questions = questionRepo.findBySubjectAndDifficulty(subject, difficulty);
        model.addAttribute("questions", questions);
        model.addAttribute("selectedSubject", subject.getName());
        model.addAttribute("selectedDifficulty", difficulty);
        return "exam";
    }
    
  /*  @PostMapping("/submit-exam")
    public String submitExam(@RequestParam Map<String, String> responses, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        
       // String studentName = responses.get("username");
        String subjectName = responses.get("subjectId");
        String difficulty = responses.get("difficulty");
        
       // if (subjectName == null || difficulty == null) {
       //     model.addAttribute("error", "Invalid exam submission. Please select subject and difficulty.");
         //   return "redirect:/exam-select";
      //  }
        Long subjectId=Long.parseLong(subjectName);
        Subject subject = subjectRepo.findById(subjectId).orElse(null);;
        if (subject == null) {
            model.addAttribute("error", "Subject not found.");
            return "redirect:/exam-select";
        }

        List<Question> questions = questionRepo.findBySubjectAndDifficulty(subject, difficulty);
        
        //int total = 0, correct = 0;
        int total = questions.size();
        int correct = 0;

        for (Question q : questions) {
           // Long key =  q.getId();
            String selectedAnswer = responses.get("q"+q.getId());
            if (selectedAnswer != null && q.getCorrectAnswer().equalsIgnoreCase(selectedAnswer)) {
                correct++;
            }
        }
        

        //double score = ((double) correct / total) * 100.0;
        double score = (total > 0) ? ((double) correct / total) * 100.0 : 0.0;

        
 
        

        //List<Question> allQ = questionRepo.findAll();
        //int correct = 0;
       // for (Question q : allQ) {
         //   String ans = responses.get("q" + q.getId());
           // if (ans != null && ans.equalsIgnoreCase(q.getCorrectAnswer())) correct++;
        //}

        Result result = new Result();
        result.setUsername(user.getUsername());
        result.setTotalQuestions(total);//allQ.size());
        result.setCorrectAnswers(correct);
        result.setPercentage(score); //allQ.size());
        resultRepo.save(result);

        model.addAttribute("result", result);
        return "result";
    }

*/
    @PostMapping("/submit-exam")
    public String submitExam(@RequestParam Map<String, String> responses,
                             HttpSession session,
                             Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Long subjectId = (Long) session.getAttribute("subjectId");
        String difficulty = (String) session.getAttribute("difficulty");

        if (subjectId == null || difficulty == null) {
            model.addAttribute("error", "Exam session data is missing. Please start again.");
            return "error";
        }

        Subject subject = subjectRepo.findById(subjectId).orElse(null);
        if (subject == null) {
            model.addAttribute("error", "Selected subject not found.");
            return "error";
        }

        List<Question> questions = questionRepo.findBySubjectAndDifficulty(subject, difficulty);

        int total = 0;//questions.size();
        int correct = 0;

        for (Question q : questions) {
            String selectedAnswer = responses.get("q" + q.getId());
            if (selectedAnswer != null && !selectedAnswer.isEmpty()) {
                total++;
            if (selectedAnswer != null && q.getCorrectAnswer().equalsIgnoreCase(selectedAnswer)) {
                correct++;
            }
        }
        }

        double score = (total > 0) ? ((double) correct / total) * 100.0 : 0.0;

        Result result = new Result();
        result.setUsername(user.getUsername());
        result.setSubject(subject);
        result.setDifficulty(difficulty);
        result.setAttempted(total);
        result.setCorrectAnswers(correct);
        result.setTotalQuestions(total);
        result.setPercentage(score);

        resultRepo.save(result);

        model.addAttribute("result", result);
        return "result";
    }


    @GetMapping("/exam")
    public String showExam(Model model) {
        model.addAttribute("questions", questionRepo.findAll());
        return "exam";
    }
/*
    @PostMapping("/submit-exam")
    public String submitExam(@RequestParam Map<String, String> responses, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        List<Question> allQ = questionRepo.findAll();
        int correct = 0;
        for (Question q : allQ) {
            String ans = responses.get("q" + q.getId());
            if (ans != null && ans.equalsIgnoreCase(q.getCorrectAnswer())) correct++;
        }

        Result result = new Result();
        result.setUsername(user.getUsername());
        result.setTotalQuestions(allQ.size());
        result.setCorrectAnswers(correct);
        result.setPercentage((correct * 100.0) / allQ.size());
        resultRepo.save(result);

        model.addAttribute("result", result);
        return "result";
    }*/
}
