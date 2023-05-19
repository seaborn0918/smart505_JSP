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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css">

  <script>
    $(document).ready(function () {
      $("#btn-list").on("click", function () {
        history.back();
      });

      $("#btn-edit").on("click", function () {
        const postIdx = $("#post-idx").val();
        location.href = "/mvcboard/pass.do?mode=edit&idx=" + postIdx;
      });

      $("#btn-delete").on("click", function () {
        const postIdx = $("#post-idx").val();
        location.href = "/mvcboard/pass.do?mode=delete&idx=" + postIdx;
      });

      $("#post-ofile").on("click", function () {
        const postIdx = $("#post-idx").val();
        const postOfile = $("#post-ofile").val()
        const postSfile = $("#post-sfile").val()
        location.href = "/mvcboard/download.do?ofile=" + postOfile + "&sfile=" + postSfile+ "&idx=" + postIdx;
      })

    });
  </script>
</head>
<body>
<c:import url="/layout/Header.jsp">
  <c:param name="pageName" value="viewPage"/>
</c:import>
<main class="container my-4 py-4">
  <div class="article-header">
    <div class="article-title">
      <h3 id="post-title">${board.postTitle}</h3>
    </div>
    <div class="writer-info">
      <span id="post-writer">${board.postWriter}</span>
      <br>
      <input type="hidden" id="post-idx" name="postIdx" value="${board.postIdx}">
      <span id="span-post-idx">글번호 ${board.postIdx}</span>
<%--      <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}">--%>
      <span id="post-date">| ${board.postDate}</span>
      <span id="post-visits">| 조회 ${board.postVisits}</span>
    </div>
    <hr>
  </div>

  <div class="article-container">
    <p class="py-4" id="post-content">
      ${board.postContent}
    </p>
  </div>

  <div class="article-file">
    <div class="input-group input-group-sm">
      <span class="input-group-text">첨부파일</span>
      <input type="text" class="form-control" id="post-ofile" name="postOfile" value="${board.postOfile}" readonly>
      <input type="hidden" id="post-sfile" value="${board.postSfile}">
      <span class="input-group-text">다운로드 수</span>
      <span class="input-group-text" id="post-dn-count">${board.postDnCount}</span>
    </div>
    <hr>
  </div>

  <div class="article-bottom-button my-3 row">
    <div class="col-sm">
      <button type="button" class="btn btn-dark btn-sm px-3 py-2" id="btn-list">목록</button>
    </div>
    <div class="col-sm d-flex justify-content-end">
      <button type="button" class="btn btn-light me-2 btn-sm px-3 py-2" id="btn-edit">수정</button>
      <button type="button" class="btn btn-secondary btn-sm px-3 py-2" id="btn-delete">삭제</button>
    </div>
  </div>

<%--  ***************************************************************** --%>

<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-idx" class="form-label">번호 :</label>--%>
<%--      <input type="text" class="form-control" id="post-idx" name="postIdx" value="${board.postIdx}" readonly>--%>
<%--    </div>--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-writer" class="form-label">작성자 : </label>--%>
<%--      <input type="text" class="form-control" id="post-writer" name="postWriter" value="${board.postWriter}" readonly>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-date" class="form-label">작성일 :</label>--%>
<%--      <input type="text" class="form-control" id="post-date" name="postDate" value="${board.postDate}" readonly>--%>
<%--    </div>--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-visits" class="form-label">조회수 : </label>--%>
<%--      <input type="text" class="form-control" id="post-visits" name="postVisits" value="${board.postVisits}" readonly>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-title" class="form-label">제목 : </label>--%>
<%--      <input type="text" class="form-control" id="post-title" name="postTitle" value="${board.postTitle}" readonly>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-content" class="form-label">내용 : </label>--%>
<%--      <textarea class="form-control" name="postContent" id="post-content" rows="5" readonly>${board.postContent}</textarea>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-ofile" class="form-label">첨부파일 :</label>--%>
<%--      <input type="text" class="form-control" id="post-ofile" name="postOfile" value="${board.postOfile}" readonly>--%>
<%--    </div>--%>
<%--    <div class="col-sm">--%>
<%--      <label for="post-dn-count" class="form-label">다운로드 수 : </label>--%>
<%--      <input type="text" class="form-control" id="post-dn-count" name="postDnCount" value="${board.postDnCount}"--%>
<%--             readonly>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm">--%>
<%--      <button type="button" class="btn btn-dark" id="btn-list">목록</button>--%>
<%--    </div>--%>
<%--    <div class="col-sm d-flex justify-content-end">--%>
<%--      <button type="button" class="btn btn-secondary me-2" id="btn-edit">수정</button>--%>
<%--      <button type="button" class="btn btn-light" id="btn-delete">삭제</button>--%>
<%--    </div>--%>
<%--  </div>--%>
</main>
<%@ include file="/layout/Footer.jsp" %>
</body>
</html>
