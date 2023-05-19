<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <jsp:include page="Link.jsp"></jsp:include>

  <%
    // 내장 객체 session에 저장된 정보 중에 UserId라는 이름의 데이터가 있는지 확인
    if (session.getAttribute("UserId") == null) {
  %>
  <%-- 자바 스크립트로 input 태그에 데이터가 있는지 없는지 확인--%>
  <script>
      function validateForm(form) {
          if (!form.user_id.value) {
              alert("아이디를 입력하세요.");
              return false;
          }
          if (form.user_pw.value == "") {
              alert("패스워드를 입력하세요.")
              return false;
          }
      }
  </script>
  <div class="row">
    <div class="col-sm-6">
      <h2>로그인 페이지</h2>
      <span style="color: red; font-size: 1.2em">
        <%-- jsp 표현식 사용 --%>
        <%-- 내장객체 request에 저장된 정보 중 LoginErrMsg라는 이름을 가지고 있는 것이 있는지 확인--%>
        <%-- 내장객체 request에 저장된 정보가 없으면 빈 문자열, 있으면 입력된 에러메시지 출력--%>
        <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
      </span>
      <%-- 사용자 입력 데이터를 LoginProcess.jsp로 전달. submit 버튼 클릭 시 자바 스크립트로 데이터 검증 함수 실행--%>
      <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
        <div class="my-3">
          <label for="userId" class="form-label">아이디 : </label>
          <input type="text" class="form-control" id="userId" name="user_id">
        </div>
        <div class="my-3">
          <label for="userPw" class="form-label">비밀번호 : </label>
          <input type="text" class="form-control" id="userPw" name="user_pw">
        </div>
        <div class="my-3">
          <input type="submit" class="btn btn-primary" value="로그인하기">
        </div>
      </form>
    </div>
  </div>
</div>
<%
} else { // 내장객체 session에 UserId라는 이름의 데이터가 존재 시
%>
<div class="container my-4">
  <%-- 내장객체 session에서 UserName 이라는 이름의 데이터를 출력--%>
  <h2><%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.</h2>
  <a href="Logout.jsp">[로그아웃]</a>
</div>
<%
  }
%>
</body>
</html>
