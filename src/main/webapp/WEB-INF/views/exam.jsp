 <!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><body>
<h2>Online Exam</h2>
<form action="submit-exam" method="post">
<c:forEach var="q" items="${questions}">
<p>${q.questionText}</p>
<input type="radio" name="q${q.id}" value="A"/> ${q.optionA}<br/>
<input type="radio" name="q${q.id}" value="B"/> ${q.optionB}<br/>
<input type="radio" name="q${q.id}" value="C"/> ${q.optionC}<br/>
<input type="radio" name="q${q.id}" value="D"/> ${q.optionD}<br/>
<hr/>
</c:forEach>
<input type="submit" value="Submit Exam"/>
</form>
</body></html>


<html>
<head>
    <title>Take Exam | Student Exam Analyzer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <div class="text-center mb-4">
        <img src="${pageContext.request.contextPath}/images/logo.png" width="100"/>
        <h3>Online Exam</h3>
    </div>

    <form action="submit-exam" method="post">
        <c:forEach var="q" items="${questions}">
            <div class="card mb-3 shadow-sm">
                <div class="card-body">
                    <h5>${q.questionText}</h5>
                    <div class="form-check">
                        <input type="radio" name="q${q.id}" value="A" class="form-check-input" required>
                        <label class="form-check-label">${q.optionA}</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="q${q.id}" value="B" class="form-check-input">
                        <label class="form-check-label">${q.optionB}</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="q${q.id}" value="C" class="form-check-input">
                        <label class="form-check-label">${q.optionC}</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="q${q.id}" value="D" class="form-check-input">
                        <label class="form-check-label">${q.optionD}</label>
                    </div>
                </div>
            </div>
        </c:forEach>

        <button class="btn btn-success w-100">Submit Exam</button>
    </form>
</div>
</body>
</html>

-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
<%
    request.setAttribute("pageTitle", "Take Exam");
%>
<h2 class="text-center text-primary mb-4">Take Your Exam</h2>
<div class="text-end mb-3">
  <a href="/exam-select" class="btn btn-success"><i class="fa fa-plus"></i>filter your test</a>
   
</div>

<form action="submit-exam" method="post">
  <c:forEach var="q" items="${questions}">
    <div class="card mb-3 shadow-sm">
      <div class="card-body">
        <h5>${q.questionText}</h5>
        <div class="form-check"><input type="radio" name="q${q.id}" value="A" class="form-check-input" required> <label class="form-check-label">${q.optionA}</label></div>
        <div class="form-check"><input type="radio" name="q${q.id}" value="B" class="form-check-input"> <label class="form-check-label">${q.optionB}</label></div>
        <div class="form-check"><input type="radio" name="q${q.id}" value="C" class="form-check-input"> <label class="form-check-label">${q.optionC}</label></div>
        <div class="form-check"><input type="radio" name="q${q.id}" value="D" class="form-check-input"> <label class="form-check-label">${q.optionD}</label></div>
      </div>
    </div>
  </c:forEach>
  <button class="btn btn-success w-100">Submit Exam</button>
</form>
<%@ include file="include/footer.jsp" %>
<!--  
<h2 class="text-center text-primary mb-4">Take Your Exam</h2>
<div class="text-end mb-3">
  <a href="/exam-select" class="btn btn-success"><i class="fa fa-plus"></i>filter your test</a>
   
</div>

<form action="${pageContext.request.contextPath}/submit-exam" method="post">
  <c:forEach var="q" items="${questions}">
    <div class="card mb-3 shadow-sm">
      <div class="card-body">
        <h5>${q.questionText}</h5>

        <div class="form-check">
          <input type="radio" name="q${q.id}" value="A" class="form-check-input" required>
          <label class="form-check-label">${q.optionA}</label>
        </div>
        <div class="form-check">
          <input type="radio" name="q${q.id}" value="B" class="form-check-input">
          <label class="form-check-label">${q.optionB}</label>
        </div>
        <div class="form-check">
          <input type="radio" name="q${q.id}" value="C" class="form-check-input">
          <label class="form-check-label">${q.optionC}</label>
        </div>
        <div class="form-check">
          <input type="radio" name="q${q.id}" value="D" class="form-check-input">
          <label class="form-check-label">${q.optionD}</label>
        </div>
      </div>
    </div>
  </c:forEach>

  <button class="btn btn-success w-100" type="submit">Submit Exam</button>
</form>

< include file="include/footer.jsp" %>-->


