<%@ page import="java.util.Map" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page import="java.util.Set" %>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: admin--%>
<%--  Date: 2023-04-24--%>
<%--  Time: 오후 3:33--%>
<%--  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>application 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
  Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
  Set<String> keys = maps.keySet();
  for (String key: keys) {
    Person person = maps.get(key);
    out.print(String.format("이름 : %s, 나이 : %d<br />", person.getName(), person.getAge()));
  }
%>
</body>
</html>
