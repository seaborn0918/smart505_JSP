<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-21
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>에러 발생 페이지</title>
</head>
<body>
<%
  // 오류발생, request.getParameter("age")가 실행되면 클리이언트에서 age라는 이름으로 데이터가 넘어와야 함
  // 현재 age에 값이 없으므로 null이 넘어오게 되고, 이를 Integer.parseInt() 메소드를 사용하여 정수로 변경하려고 하기 때문에 오류가 발생함
  int myAge = Integer.parseInt(request.getParameter("age")) + 10;
  out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
%>
</body>
</html>
