package com.exam.studentexamanalyzer.model;

import jakarta.persistence.*;

@Entity
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
   // private String subject;
    private int totalQuestions;
    private int correctAnswers;
    private double percentage;
    private String difficulty; // Easy / Medium / Hard
    private int attempted;     // number of questions attempted
    //private int correct;   
    @ManyToOne
    @JoinColumn(name = "subject_id")
    private Subject subject;
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public int getCorrectAnswers() {
		return correctAnswers;
	}
	public void setCorrectAnswers(int correctAnswers) {
		this.correctAnswers = correctAnswers;
	}
	public int getTotalQuestions() {
		return totalQuestions;
	}
	public void setTotalQuestions(int totalQuestions) {
		this.totalQuestions = totalQuestions;
	}
	public void setUser(User user) {
		// TODO Auto-generated method stub
		
	}
	
	 public String getSubject() { return subject.getName(); }
	    public void setSubject(Subject subject) { this.subject = subject; }

	    public String getDifficulty() { return difficulty; }
	    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    
	    public int getAttempted() { return attempted; }
	    public void setAttempted(int attempted) { this.attempted = attempted; }
	
}

