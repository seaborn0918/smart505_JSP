<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>CookieResult</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
<%
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (int i = 0; i < cookies.length; i++) {
      String cookieName = cookies[i].getName();
      String cookieValue = cookies[i].getValue();
      out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
    }
  }
%>
</body>
</html>
