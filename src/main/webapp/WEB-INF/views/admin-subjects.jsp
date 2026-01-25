<%@ include file="include/header.jsp" %>
<h2>Manage Subjects</h2>

<a href="/admin/subjects/add" class="btn btn-primary mb-3">Add Subject</a>

<table class="table table-bordered">
  <thead class="table-dark">
    <tr>
      <th>ID</th><th>Name</th><th>Description</th><th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="s" items="${subjects}">
    <tr>
      <td>${s.id}</td>
      <td>${s.name}</td>
      <td>${s.description}</td>
      <td><a href="/admin/subjects/delete/${s.id}" class="btn btn-danger btn-sm">Delete</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<%@ include file="include/footer.jsp" %>
