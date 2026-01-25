<!-- <html><body>
<h2>Edit Question</h2>
<form action="../update" method="post">
<input type="hidden" name="id" value="${question.id}"/>
Question: <input type="text" name="questionText" value="${question.questionText}"/><br/>
A: <input type="text" name="optionA" value="${question.optionA}"/><br/>
B: <input type="text" name="optionB" value="${question.optionB}"/><br/>
C: <input type="text" name="optionC" value="${question.optionC}"/><br/>
D: <input type="text" name="optionD" value="${question.optionD}"/><br/>
Correct (A/B/C/D): <input type="text" name="correctAnswer" value="${question.correctAnswer}"/><br/>
<input type="submit" value="Update"/>
</form>
</body></html>




 include file="include/headerforadmin.jsp" %>

    request.setAttribute("pageTitle", "Add Question");
%>
<div class="card shadow-sm">
  <div class="card-body">
    <h3 class="text-primary mb-4">Add Question</h3>
    <form action="/admin/save" method="post">
      <div class="mb-3"><label class="form-label">Question</label><textarea name="questionText" class="form-control" required></textarea></div>
      <div class="row">
        <div class="col-md-6 mb-2"><input type="text" name="optionA" placeholder="Option A" class="form-control" required></div>
        <div class="col-md-6 mb-2"><input type="text" name="optionB" placeholder="Option B" class="form-control" required></div>
        <div class="col-md-6 mb-2"><input type="text" name="optionC" placeholder="Option C" class="form-control" required></div>
        <div class="col-md-6 mb-2"><input type="text" name="optionD" placeholder="Option D" class="form-control" required></div>
      </div>
      <div class="mb-3">
        <label class="form-label">Correct Answer (A/B/C/D)</label>
        <input type="text" name="correctAnswer" maxlength="1" class="form-control" required>
      </div>
      <button class="btn btn-success w-100">Save Question</button>
    </form>
  </div>
</div>
 include file="include/footer.jsp" %>
-->

<%@ include file="include/header.jsp" %>
<h2>Add Question</h2>
<form action="/admin/save" method="post">
  <div class="mb-3">
    <label>Question</label>
    <textarea name="questionText" class="form-control" required></textarea>
  </div>

  <div class="row">
    <div class="col-md-6">
      <label>Option A</label>
      <input type="text" name="optionA" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Option B</label>
      <input type="text" name="optionB" class="form-control" required>
    </div>
  </div>

  <div class="row">
    <div class="col-md-6">
      <label>Option C</label>
      <input type="text" name="optionC" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label>Option D</label>
      <input type="text" name="optionD" class="form-control" required>
    </div>
  </div>

  <div class="mb-3 mt-3">
    <label>Correct Answer (A/B/C/D)</label>
    <input type="text" name="correctAnswer" class="form-control" required>
  </div>

  <div class="mb-3">
    <label>Subject</label>
    <select name="subject.id" class="form-select" required>
      <c:forEach var="s" items="${subjects}">
        <option value="${s.id}">${s.name}</option>
      </c:forEach>
    </select>
  </div>

  <div class="mb-3">
    <label>Difficulty</label>
    <select name="difficulty" class="form-select" required>
      <c:forEach var="d" items="${difficulties}">
        <option value="${d}">${d}</option>
      </c:forEach>
    </select>
  </div>

  <button type="submit" class="btn btn-success">Save</button>
</form>
<%@ include file="include/footer.jsp" %>

