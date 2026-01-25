<!--<html><body>
<h2>Exam Result</h2>
<p>User: ${result.username}</p>
<p>Correct Answers: ${result.correctAnswers}</p>
<p>Total Questions: ${result.totalQuestions}</p>
<p>Percentage: ${result.percentage}%</p>
<a href="/logout">Logout</a>
</body></html>
-->


<%@ include file="include/header.jsp" %>
<%
    request.setAttribute("pageTitle", "Exam Result");
%>
<div class="card shadow text-center">
  <div class="card-body">
    <h3 class="text-success mb-3">Your Exam Result</h3>
     <p><strong>student name:</strong> ${result.username}</p>
      <p><strong>difficulty level:</strong> ${result.difficulty}</p>
       <p><strong>subject:</strong> ${result.subject}</p>
    <p><strong>Correct Answers:</strong> ${result.correctAnswers}</p>
    <p><strong>Total Questions:</strong> ${result.totalQuestions}</p>
    <p><strong>Percentage:</strong> <span class="badge bg-primary">${result.percentage}%</span></p>
     <canvas id="scoreChart" width="400" height="250"></canvas>
    <a href="/exam" class="btn btn-outline-primary mt-3">Take Another Exam</a>
  </div>
</div>
   
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
const ctx = document.getElementById('scoreChart');

new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Correct', 'Wrong'],
        datasets: [{
            label: 'Performance',
            data: [${result.correctAnswers}, ${result.totalQuestions - result.correctAnswers}],
            backgroundColor: ['#28a745', '#dc3545'],
            borderColor: ['#fff', '#fff'],
            borderWidth: 2
        }]
    },
    options: {
    	 plugins: {
             title: {
                 display: true,
                 text: 'Your Performance',
                 font: { size: 18 }
             },
             legend: {
                 position: 'bottom'
             }
         }
    }
});
</script>


<%@ include file="include/footer.jsp" %>
