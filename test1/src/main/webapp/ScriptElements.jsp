<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>

<%-- 지시어 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 스크립트 태구, 선언부 --%>
<%-- _jspService() 메소드 외부에 등록됨--%>
<%!
  public int add(int num1, int num2) {
    return num1 + num2;
  }
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>스크립트 태그 사용</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
<%-- 스트립트 태그, 스크립틀릿 --%>
<%-- _jspService() 안에 입력하는 자바 소스 코드--%>
  <%
    int result = add(10, 20);
  %>

<%-- 스크립트 태그, 표현부 --%>
<%-- 웹 페이지에 직접 출력하기 위해서 사용, out.println() 과 동일한 기능--%>
  <p>
    덧셈결과 : <%= result %> <br/>
    덧셈결과2 : <%= add(30, 40) %> <br/>
  </p>
</div>
</body>
</html>
