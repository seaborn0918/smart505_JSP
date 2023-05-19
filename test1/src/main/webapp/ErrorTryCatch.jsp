<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>에러 처리</title>
</head>
<body>
<%
  try {
    int myAge = Integer.parseInt(request.getParameter("age")) + 10;
    out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
  }
  catch (Exception e) {
    out.println("예외 발생 : 매개변수 age가 null 입니다.");
  }
%>

</body>
</html>
