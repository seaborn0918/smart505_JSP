<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="/servlet/LoginProcess.do" method="post">
        <div class="my-3">
          <label for="user-id" class="form-label">USER ID : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력해주세요">
        </div>
        <div class="my-3">
          <label for="user-pw" class="form-label">USER PW : </label>
          <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="사용자 비밀번호를 입력하세요">
        </div>
        <div class="my-3 d-grid gap-3">
          <button type="submit" class="btn btn-primary">Login</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
