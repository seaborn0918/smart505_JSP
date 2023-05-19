<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="IsLoggedIn.jsp"%>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%
  String uri = request.getRequestURI();
  String title = "";
  String userName = (String) session.getAttribute("userName");

  switch (uri) {
    case "/BoardWrite.jsp":
      title = "Model1 방식 게시판 글 쓰기 페이지";
      break;
    case "/BoardRead.jsp":
      title = "Model1 방식 게시판 글 확인 페이지";
      break;
    case "/BoardUpdate.jsp":
      title = "Model1 방식 게시판 글 수정 페이지";
      break;
    case "/Login.jsp":
      title = "Model1 방식 게시판 회원 로그인 페이지";
      break;
    default:
      title = "Model1 방식 게시판 목록 페이지";
      break;
  }

  if (userName == null) {
%>
<script>
  $(document).ready(function () {
    $("#loginBtn").show();
    $("#loginBtn").on("click", function () {
      location.href = "Login.jsp";
    });
    $("#welcomeMsg").hide();
    $("#logOutBtn").hide();
    $("#writeBtn").hide();
    $("#btn-delete").hide();
    $("#btn-edit").hide();
  });
</script>
<%
} else {
%>
<script>
  $(document).ready(function () {
    $("#loginBtn").hide();
    $("#welcomeMsg").show();
    $("#logOutBtn").show();
    $("#logOutBtn").on("click", function () {
      location.href = "Login.jsp";
    });
  });
</script>
<%
  }
%>
<header class="container-fluid p-0">
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark d-flex justify-content-between">
    <ul class="navbar-nav">
      <li class="nav-link"><a class="nav-link" href="BoardList.jsp">메뉴 1</a></li>
    </ul>
    <div class="me-3">
      <span class="navbar-text me-3" id="welcomeMsg"><%=userName%>님, 반갑습니다.</span>
      <button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
      <a href="LogoutProcess.jsp" class="btn btn-success" id="logOutBtn">로그아웃</a>
    </div>
  </nav>
  <div class="container my-4 py-5 bg-secondary bg-opacity-50">
    <h1 class="text-center"><%=title%>
    </h1>
  </div>
</header>

