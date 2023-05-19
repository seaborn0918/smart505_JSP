<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
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

<%
  // 내장 객체 request에 데이터 저장
  request.setAttribute("personObj", new Person("홍길동", 33));
  request.setAttribute("stringObj", "나는 문자열");
  request.setAttribute("integerObj", 99);
%>
<%-- forward시 액션태그의 param을 사용하여 매개변수로 데이터 전달--%>
<jsp:forward page="ObjectResult.jsp">
  <jsp:param name="firstNum" value="10"/>
  <jsp:param name="secondNum" value="20"/>
</jsp:forward>
</body>
</html>
