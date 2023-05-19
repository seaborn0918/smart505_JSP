<%@ page import="java.util.Map" %>
<%@ page import="com.bitc.jsp_0424.Person" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h2>application 영역의 공유</h2>
<%
  Map<String, Person> maps = new HashMap<>();
  maps.put("actor1", new Person("이수일", 30));
  maps.put("actor2", new Person("심순애", 28));
  application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.
</body>
</html>
