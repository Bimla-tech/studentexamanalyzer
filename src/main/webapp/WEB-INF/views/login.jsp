<!-- <html><body>
<h2>Login</h2>
<form action="login" method="post">
Username: <input type="text" name="username"/><br/>
Password: <input type="password" name="password"/><br/>
<input type="submit" value="Login"/>
</form>
<a href="register">Register</a>
</body></html>


include file="include/header.jsp" %>
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login | Student Exam Analyzer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 text-center">
    <img src="${pageContext.request.contextPath}/images/logo.png" width="100" alt="Logo" class="mb-3"/>
    <h2 class="mb-4 text-primary">Student Exam Analyzer</h2>

    <div class="card mx-auto shadow" style="max-width:400px;">
        <div class="card-body">
            <h4 class="card-title mb-3">Login</h4>

            <form action="login" method="post">
                <div class="mb-3 text-start">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required/>
                </div>
                <div class="mb-3 text-start">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required/>
                </div>
                <button class="btn btn-primary w-100">Login</button>
            </form>

            <div class="mt-3">
                <a href="register" class="text-decoration-none">Create an account</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>


-->
<%@ include file="include/header.jsp" %>


<%
    request.setAttribute("pageTitle", "Login");
%>
<div class="row justify-content-center">
  <div class="col-md-6">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3 class="text-center text-primary mb-4">Login</h3>
        <form action="login" method="post">
          <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
          </div>
          <button class="btn btn-primary w-100">Login</button>
        </form>
        <div class="text-center mt-3">
          <a href="register" class="text-decoration-none">Create new account</a>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="include/footer.jsp" %>

