<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cookie</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>1. 쿠키(Cookie) 설정</h2>
<%
  // Cookie 클래스 타입의 변수 선언과 동시에 객체 생성
  // 쿠키 객체 생성 시 쿠키 이름과 값을 설정
  Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
  cookie.setPath(request.getContextPath());
  // 쿠키가 유지될 시간, 쿠키 유지시간이 지나면 쿠키가 자동 삭제됨
  cookie.setMaxAge(3600);
  // 클라이언트에 쿠키를 전송하기 위해서 response 내장 객체에 추가
  response.addCookie(cookie);
%>

<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
<%
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie c : cookies) {
      String cookieName = c.getName();
      String cookieValue = c.getValue();
      // 문자열 포맷팅
      // String str = cookieName + " : " + cookieValue + "<br>";
      out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
    }
  }
%>

<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>
