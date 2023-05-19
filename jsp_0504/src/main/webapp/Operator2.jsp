<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  pageContext.setAttribute("num1", 9);
  pageContext.setAttribute("num2", "10");

  pageContext.setAttribute("nullStr", null);
  pageContext.setAttribute("emptyStr", "");
  // int 타입의 배열 생성. 크기가 0으로 생성
  pageContext.setAttribute("lengthZero", new Integer[0]);
  // ArrayList 타입의 배열 생성. 데이터 입력 없음. size가 0
  pageContext.setAttribute("sizeZero", new ArrayList());
%>
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
<div class="container">
  <h3>empty 연산자</h3>
  empty nullStr : ${ empty nullStr }<br>
  empty emptyStr : ${ empty emptyStr }<br>
  empty lengthZero : ${ empty lengthZero }<br>
  empty sizeZero : ${ empty sizeZero }<br>

  <h3>삼항 연산자</h3>
  num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }

  <h3>null 연산</h3>
<%--  기본 자바 문법에서는 null과 연산 시 오류 --%>
<%--  표현 언어에서는 null을 0으로 인식 --%>
  null + 10 : ${ null + 10 }<br>
  nullStr + 10 : ${ nullStr + 10 }<br>
<%--  param.noVar은 현재 null이므로 0으로 인식--%>
  param.noVar + 10 : ${ param.noVar > 10 }<br>
</div>
</body>
</html>
