<%@ include file="include/header.jsp" %>
<h2>Select Subject & Difficulty</h2>
<form action="/exam" method="post">
  <div class="mb-3">
    <label>Subject</label>
    <select name="subjectId" class="form-select" required>
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

  <button type="submit" class="btn btn-primary">Start Exam</button>
</form>
<%@ include file="include/footer.jsp" %>
