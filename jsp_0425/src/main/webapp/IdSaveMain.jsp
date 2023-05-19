<%@ page import="com.bitc.jsp_0425.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // CookieManager 클래스 멤버를 이용하여 로그인 ID를 읽어옴
  String loginId = CookieManager.readCookie(request, "loginId");
  // input 태그 뒤에 있는 checkbox의 값을 저장할 변수
  String cookieCheck = "";

  if (!loginId.equals("")) {
    cookieCheck = "checked";
  }
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 저장하기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>로그인 페이지</h2>
<form action="IdSaveProcess.jsp" method="post">
<%--  쿠키를 통해서 가져온 로그인 id값을 input 태그에 출력--%>
<%--  처음 접속 시 id가 없음--%>
  아이디 : <input type="text" name="user_id" value="<%= loginId %>">
  <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>>
  아이디 저장하기
  <br>
  패스워드 : <input type="text" name="user_pw">
  <br>
  <input type="submit" value="로그인하기">
</form>
</body>
</html>
