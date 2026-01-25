<!-- <html><body>
<h2>Register</h2>
<form action="register" method="post">
Username: <input type="text" name="username"/><br/>
Password: <input type="password" name="password"/><br/>
<input type="submit" value="Sign Up"/>
</form>
</body></html>
-->


<%@ include file="include/header.jsp" %>
<%
    request.setAttribute("pageTitle", "Register");
%>
<div class="row justify-content-center">
  <div class="col-md-6">
    <div class="card shadow-sm">
      <div class="card-body">
        <h3 class="text-center text-success mb-4">Register</h3>
        <form action="register" method="post">
          <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
          </div>
          <button class="btn btn-success w-100">Sign Up</button>
        </form>
        <div class="text-center mt-3">
          <a href="login" class="text-decoration-none">Already have an account? Login</a>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="include/footer.jsp" %>
