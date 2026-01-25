<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Admin Dashboard</h2>
<a href="add">Add Question</a> | <a href="/logout">Logout</a>
<table border="1">
<tr><th>ID</th><th>Question</th><th>Actions</th></tr>
<c:forEach var="q" items="${questions}">
<tr>
<td>${q.id}</td>
<td>${q.questionText}</td>
<td>
<a href="edit/${q.id}">Edit</a> |
<a href="delete/${q.id}">Delete</a>
</td>
</tr>
</c:forEach>
</table>
</body></html>


 taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
< include file="include/headerforadmin.jsp" %>
<
    request.setAttribute("pageTitle", "Admin Dashboard");
%>
<h2 class="text-center text-primary mb-4">Admin Dashboard</h2>

<div class="text-end mb-3">
  <a href="/admin/add" class="btn btn-success"><i class="fa fa-plus"></i> Add Question</a>
</div>

<table class="table table-bordered table-hover shadow-sm">
  <thead class="table-primary">
    <tr>
      <th>ID</th>
      <th>Question</th>
      <th>Correct</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="q" items="${questions}">
    <tr>
      <td>${q.id}</td>
      <td>${q.questionText}</td>
      <td>${q.correctAnswer}</td>
      <td>
        <a href="/admin/edit/${q.id}" class="btn btn-warning btn-sm">Edit</a>
        <a href="/admin/delete/${q.id}" class="btn btn-danger btn-sm">Delete</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
include file="include/footer.jsp" %>
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
<%
    request.setAttribute("pageTitle", "Admin Dashboard");
%>

<h2 class="text-center text-primary mb-4">Admin Dashboard</h2>

<div class="card shadow-sm mb-4">
  <div class="card-body">
    <h5 class="text-center mb-3">Average Scores per Student</h5>
    <canvas id="adminChart" height="120"></canvas>
  </div>
</div>

<!-- Questions Table -->
<div class="text-end mb-3">
  <a href="/admin/add" class="btn btn-success"><i class="fa fa-plus"></i> Add Question</a>
   <a href="/admin/subjects" class="btn btn-success"><i class="fa fa-plus"></i> Add subject and level</a>
</div>

<table class="table table-bordered table-hover shadow-sm">
  <thead class="table-primary">
    <tr>
      <th>ID</th>
      <th>Question</th>
      <th>Correct</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="q" items="${questions}">
    <tr>
      <td>${q.id}</td>
      <td>${q.questionText}</td>
      <td>${q.correctAnswer}</td>
      <td>
        <a href="/admin/edit/${q.id}" class="btn btn-warning btn-sm">Edit</a>
        <a href="/admin/delete/${q.id}" class="btn btn-danger btn-sm">Delete</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
const adminCtx = document.getElementById('adminChart');

const userNames = [
  <c:forEach var="entry" items="${userAverages}">
    "${entry.key}",
  </c:forEach>
];

const userScores = [
  <c:forEach var="entry" items="${userAverages}">
    ${entry.value},
  </c:forEach>
];

new Chart(adminCtx, {
  type: 'bar',
  data: {
    labels: userNames,
    datasets: [{
      label: 'Average % Score',
      data: userScores,
      backgroundColor: ''
    }]
  },
  options: {
    plugins: {
      title: {
        display: true,
        text: 'Student Performance Overview'
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        max: 100
      }
    }
  }
});
</script>

<%@ include file="include/footer.jsp" %>


