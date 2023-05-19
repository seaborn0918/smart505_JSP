<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>include 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<%
  // page 내장 객체를 공유하고 있으므로 page 내장 객체가 가지고 있는 데이터를 가져옴
  int pInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
  String pString2 = pageContext.getAttribute("pageString").toString();
  Person pPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>
  <li>Integer 객체 : <%= pInteger2 %></li>
<%--  page 내장 객체가 가지고 있는 데이터를 그대로 출력--%>
  <li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
  <li>Person 객체 : <%= pPerson2 %></li>
  </li>
</ul>

</body>
</html>
