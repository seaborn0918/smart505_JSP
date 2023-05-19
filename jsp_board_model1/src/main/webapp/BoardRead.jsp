<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>

<%
  // BoardList에서 넘겨준 글 번호 가져오기
  int postNum = Integer.parseInt(request.getParameter("postNum"));

  // 데이터 베이스 연결을 위해 BoardDAO 객체 생성
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

  // 현재 글의 조회수 업데이트
  dao.updateVisitCount(postNum);

  // 글번호를 매개변수로 하여 게시글의 해당 글 내용을 가져오기(BoardDTO 타입의 객체에 저장)
  BoardDTO board = dao.selectBoard(postNum);
  dao.dbClose();
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Model1 방식 게시판</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>

  <script>
    $(document).ready(function () {
      $("#btn-list").on("click", function () {
        history.back();
      });

      $("#btn-delete").on("click", function (){
        let confirmed = confirm("정말로 삭제하시겠습니까?")

        if (confirmed) {
          // 단순 링크를 사용하여 DeleteProcess.jsp로 이동하여 삭제
          const postNum = $("#post-num").val()
          const postWriteUser = $("#post-write-user").val()

          const url = "DeleteProcess.jsp?postNum=" + postNum + "&postWriteUser=" + postWriteUser;
          location.href = url;
        }
      })

      $("#btn-edit").on("click", function () {
        // id값이 post-num인 html 태그의 value값 가져오기
        const postNum = $("#post-num").val();
        // 이동하려고 하는 url 만들기
        const url = "BoardUpdate.jsp?postNum=" + postNum;
        // 자바스크립트의 페이지 이동 명령을 사용하여 페이지 이동
        location.href = url;
      });
    });
  </script>
</head>
<body>
<%@ include file="Header.jsp"%>
<main class="container my-4 p-0">
  <%--  글번호, 글제목 --%>
  <div class="row my-3">
    <div class="col-sm-2">
      <label for="post-num" class="form-label">글 번호: </label>
      <input type="text" class="form-control" id="post-num" name="postNum" value="<%=board.getPostNum()%>" disabled>
    </div>
    <div class="col-sm">
      <label for="post-title" class="form-label">글 제목 : </label>
      <input type="text" class="form-control" id="post-title" name="postTitle" value="<%=board.getPostTitle()%>">
    </div>
  </div>
  <%--  글쓴이, 등록시간 조회수 --%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-write-user" class="form-label">글쓴이 : </label>
      <input type="text" class="form-control" id="post-write-user" name="postWriteUser"
             value="<%=board.getPostWriteUser()%>" readonly>
    </div>
    <div class="col-sm">
      <label for="post-date" class="form-label">등록시간 : </label>
      <input type="text" class="form-control" id="post-date" name="postDate" value="<%=board.getPostDate()%>" readonly>
    </div>
    <div class="col-sm">
      <label for="post-visit-count" class="form-label">조회수 : </label>
      <input type="text" class="form-control" id="post-visit-count" name="postVisitCount"
             value="<%=board.getPostVisitCount()%>" readonly>
    </div>
  </div>
  <%--  글 내용 --%>
  <div class="row my-3">
    <div class="col-sm">
      <label for="post-content" class="form-label">글내용 : </label>
      <textarea class="form-control" id="post-content" name="postContent"
                rows="5"><%=board.getPostContent()%></textarea>
    </div>
  </div>
  <%--  버튼 --%>
  <%--  float --%>
  <%--  <div class="row clearfix">--%>
  <%--    <div class="col-sm clearfix">--%>
  <%--      <button type="button" class="btn btn-secondary float-start" id="btn-list">목록</button>--%>
  <%--      <button type="button" class="btn btn-primary float-end ms-2" id="btn-edit">수정</button>--%>
  <%--      <button type="button" class="btn btn-danger float-end" id="btn-delete">삭제</button>--%>
  <%--    </div>--%>
  <%--  </div>--%>
  <%--  flexbox--%>
  <div class="row my-3">
    <div class="col-sm d-flex justify-content-start">
      <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
    </div>
    <div class="col-sm d-flex justify-content-end">
      <%--      1. form을 사용한 방식 --%>
      <%--      form을 사용 시 form 태그의 자식태그로 포함되어 있는 input 태그의 데이터만 서버로 전송 --%>
<%--      <form action="DeleteProcess.jsp" method="get">--%>
<%--        <input type="hidden" name="postNum" value="<%=board.getPostNum()%>">--%>
<%--        <button type="submit" class="btn btn-danger">1번 방식 삭제</button>--%>
<%--      </form>--%>
      <%--      2. a 태그를 사용한 방식 --%>
<%--      <a href="DeleteProcess.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-danger">2번 방식 삭제</a>--%>
      <%--      3. 자바스크립트를 사용한 방식 --%>
      <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
<%--        글 수정 --%>
<%--        1. a 태그를 사용하여 BoardUpdate.jsp로 이동 --%>
<%--        <a href="BoardUpdate.jsp?postNum=<%=board.getPostNum()%>" class="btn btn-primary ms-2">수정</a>--%>
<%--        2. 자바스크립트를 사용하여 BoardUpdate.jsp로 이동--%>
      <button type="button" class="btn btn-primary ms-2" id="btn-edit">수정</button>
    </div>
  </div>
</main>
<%@ include file="Footer.jsp"%>
<%--<script>--%>
<%--  const listBtn = document.querySelector("#btn-list")--%>
<%--  function backToTheList() {--%>
<%--    history.back();--%>
<%--  }--%>
<%--  listBtn.addEventListener('click', backToTheList);--%>
<%--</script>--%>
</body>
</html>
