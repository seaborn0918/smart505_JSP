<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Include 메인</title>
</head>
<body>

<%@ include file="IncludeFile.jsp"%>
<%
  out.println("오늘 날짜 : " + today);
  out.println("<br/>");
  out.println("내일 날짜 : " + tomorrow);
%>

</body>
</html>
