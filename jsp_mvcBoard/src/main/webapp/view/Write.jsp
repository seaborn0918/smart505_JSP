<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 3:06
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
  <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- 액션 태그를 사용한 include와 parameter 전달 --%>
<jsp:include page="/layout/Header.jsp">
  <jsp:param name="pageName" value="writePage"/>
</jsp:include>
<main class="container my-4">
  <div class="my-3 row">
    <div class="col-sm-5 mx-auto px-0">
      <form action="/mvcboard/write.do" method="post" enctype="multipart/form-data">
        <div class="mt-3">
          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <div class="input-group mt-1">
          <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 ID">
          <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호">
        </div>
        <hr>
        <div class="mt-3">
          <textarea name="content" id="content" rows="5" class="form-control" placeholder="글내용을 입력하세요"></textarea>
        </div>
        <div class="input-group mt-1 write-file">
          <span class="input-group-text">첨부파일</span>
          <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">
        </div>
        <hr>
        <div class="my-3">
          <div class="row">
            <div class="col-sm d-grid">
              <button type="submit" class="btn btn-dark">글 등록</button>
            </div>
            <div class="col-sm d-grid">
              <button type="reset" class="btn btn-light">취소</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>


  <%-- ******************************************************* --%>
<%--  <div class="my-3 row">--%>
<%--    <div class="col-sm-4 mx-auto">--%>
<%--      <form action="/mvcboard/write.do" method="post" enctype="multipart/form-data">--%>
<%--        <div class="my-3">--%>
<%--          <label for="title" class="form-label">제목 : </label>--%>
<%--          <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">--%>
<%--        </div>--%>
<%--        <div class="my-3">--%>
<%--          <label for="writer" class="form-label">작성자 : </label>--%>
<%--          <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자 ID를 입력하세요">--%>
<%--        </div>--%>
<%--        <div class="my-3">--%>
<%--          <label for="pass" class="form-label">비밀번호 : </label>--%>
<%--          <input type="text" class="form-control" id="pass" name="pass" placeholder="글삭제 비밀번호를 입력하세요">--%>
<%--        </div>--%>
<%--        <div class="my-3">--%>
<%--          <label for="content" class="form-label">글내용 : </label>--%>
<%--          <textarea name="content" id="content" rows="5" class="form-control"></textarea>--%>
<%--        </div>--%>
<%--        <div class="my-3">--%>
<%--          <label for="file" class="form-label">첨부파일 : </label>--%>
<%--          <input type="file" class="form-control" id="file" name="file" placeholder="글과 함께 등록할 파일을 선택하세요">--%>
<%--        </div>--%>
<%--        <div class="my-3">--%>
<%--          <div class="row">--%>
<%--            <div class="col-sm d-grid">--%>
<%--              <button type="submit" class="btn btn-dark">글 등록</button>--%>
<%--            </div>--%>
<%--            <div class="col-sm d-grid">--%>
<%--              <button type="reset" class="btn btn-light" id="btn-cancel">취소</button>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
</main>
<%@ include file="/layout/Footer.jsp" %>
</body>
</html>
