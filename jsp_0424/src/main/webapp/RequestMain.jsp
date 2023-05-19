<%@ page import="com.bitc.jsp_0424.Person" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // request 내장 객체에 데이터 저장
  request.setAttribute("requestString", "request 영역의 문자열");
  request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>request 영역</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>request 영역의 속성값 삭제하기</h2>
<%
  // request 내장 객체에 저장된 데이터 삭제
  request.removeAttribute("requestString");
  // request 내장 객체에 requestInteger 라는 이름의 데이터가 없기 때문에 삭제되지 않음. 오류발생하지 않음
  request.removeAttribute("requestInteger");
%>

<h2>request 영역의 속성값 읽기</h2>
<%
  // request 내장 객체에 저장된 데이터 가져오기
  Person rPerson = (Person) (request.getAttribute("requestPerson"));
%>
<ul>
<%--  request 내장 객체에 저장된 데이터 출력하기--%>
  <li>String 객체 : <%= request.getAttribute("requestString")%></li>
  <li>String 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
</ul>

<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
<%
  // 다른 페이지로 이동하여 실행 후 다시 돌아옴
  request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
%>
</body>
</html>
