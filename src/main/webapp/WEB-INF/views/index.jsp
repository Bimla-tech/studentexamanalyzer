<!--  <html><body>
<h2>Welcome to Student Exam Analyzer</h2>
<a href="login">Login</a> | <a href="register">Register</a>
</body></html>
-->
<%@ include file="include/header.jsp" %>

<%
    request.setAttribute("pageTitle", "Welcome to Student Exam Analyzer");
%>
<div class="text-center">
    <img src="${pageContext.request.contextPath}/images/logo.png" width="120" class="mb-3">
    <h1 class="text-primary">Welcome to Student Exam Analyzer</h1>
    <p class="lead text-muted">Take online exams, view results, and analyze your performance.</p>
    <a href="login" class="btn btn-primary btn-lg mt-3">Login</a>
    <a href="register" class="btn btn-outline-secondary btn-lg mt-3">Register</a>
    
</div>
<%@ include file="include/footer.jsp" %>
