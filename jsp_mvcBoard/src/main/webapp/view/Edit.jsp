<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<c:import url="/layout/Header.jsp">
  <c:param name="pageName" value="editPage"/>
</c:import>
<main class="container my-4 py-4">
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="/mvcboard/edit.do" method="post">
        <div class="my-3">
          <label for="post-idx" class="form-label">글번호 : </label>
          <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>
        </div>
        <div class="my-3">
          <label for="post-title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="post-title" name="postTitle" value="${board.postTitle}" placeholder="제목을 입력해주세요">
        </div>
        <div class="my-3">
          <label for="post-writer" class="form-label">작성자 : </label>
          <input type="text" class="form-control" id="post-writer" name="postWriter" value="${board.postWriter}" placeholder="사용자 ID를 입력해주세요">
        </div>
        <div class="my-3">
          <label for="post-pass" class="form-label">비밀번호 : </label>
          <input type="password" class="form-control" id="post-pass" name="postPass" value="${postPass}">
        </div>
        <div class="my-3">
          <label for="post-content" class="form-label">내용 : </label>
          <textarea class="form-control" id="post-content" name="postContent" rows="5">${board.postContent}</textarea>
        </div>
        <div class="my-3">
          <div class="row">
            <div class="col-sm d-grid gap-3">
              <button type="submit" class="btn btn-dark">수정</button>
            </div>
            <div class="col-sm d-grid gqp-3">
              <button type="reset" class="btn btn-secondary">취소</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</main>
<%@ include file="/layout/Footer.jsp" %>
</body>
</html>
