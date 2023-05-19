<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%
  // 이전 페이지에서 전달한 현재 글번호 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));

  // 사용자 확인
  String userId = (String) session.getAttribute("userId");

  // db 연결
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  // 현재 글 내용 불러오기
  BoardDTO board = dao.selectBoard(postNum);
  dao.dbClose();

  // 사용자 확인
  if (!board.getPostWriteUser().equals(userId)){
    String errMsg = "<script>";
    errMsg += "alert('해당 글의 글쓴이가 아닙니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";

    out.println(errMsg);
  }
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Model1 방식 게시판</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="IsLoggedIn.jsp"%>
<%@ include file="Header.jsp"%>
<main class="container my-4 p-0">
  <form action="UpdateProcess.jsp" method="post">
    <%--  글번호 --%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-num" class="form-label">글번호 : </label>
        <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" readonly>
      </div>
    </div>
    <%--  글제목 --%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-title" class="form-label">글제목 : </label>
        <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>" placeholder="제목을 입력해주세요">
      </div>
    </div>
    <%--  글쓴이 --%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-write-user" class="form-label">글쓴이 : </label>
        <input type="text" class="form-control" id="post-write-user" name="postWriteUser" value="<%=board.getPostWriteUser()%>" readonly>
      </div>
    </div>
    <%--  글내용 --%>
    <div class="row my-3">
      <div class="col-sm-6 mx-auto">
        <label for="post-content" class="form-label">글내용 : </label>
        <textarea class="form-control" id="post-content" name="postContent" rows="5" placeholder="내용을 입력해주세요"><%=board.getPostContent()%></textarea>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm-6 d-flex mx-auto justify-content-end">
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="reset" class="btn btn-secondary ms-2" id="btn-cancel">취소</button>
      </div>
    </div>
  </form>
</main>
<%@ include file="Footer.jsp"%>
<script>
  const cancelBtn = document.querySelector("#btn-cancel");
  function onClickCancelBtn(){
    history.back();
  }
  cancelBtn.addEventListener("click", onClickCancelBtn);
</script>
</body>
</html>
