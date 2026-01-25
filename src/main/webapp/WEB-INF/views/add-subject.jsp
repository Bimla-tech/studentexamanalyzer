<%@ include file="include/header.jsp" %>
<h2>Add Subject</h2>
<form action="/admin/subjects/save" method="post">
  <div class="mb-3">
    <label>Name</label>
    <input type="text" name="name" class="form-control" required>
  </div>
  <div class="mb-3">
    <label>Description</label>
    <textarea name="description" class="form-control"></textarea>
  </div>
  <button type="submit" class="btn btn-success">Save</button>
</form>
<%@ include file="include/footer.jsp" %>
