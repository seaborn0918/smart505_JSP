<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-24
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 클라이언트에서 전송한 데이터 가져오기--%>
<%
  // 사용자 날짜 지정 방식 사용
  SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
  // 클라이언트가 서버로 전달한 데이터 중 add_date 이름으로 전달된 데이터 가져오기
  long add_date = s.parse(request.getParameter("add_date")).getTime();
  // 클라리언트가 서버로 전달한 데이터는 기본적으로 문자열 형태
  // 정수로 변경하기 위해서 parseInt() 메소드 사용
  int add_int = Integer.parseInt(request.getParameter("add_int"));
  String add_str = request.getParameter("add_str");

  // 클라이언트에서 가져온 데이터를 내장 객체인 response에 추가
  response.addDateHeader("myBirthday", add_date);
  response.addIntHeader("myNumber", add_int);
  response.addIntHeader("myNumber", 1234); // 새로운 데이터 추가
  response.addHeader("myName", add_str);
  response.setHeader("myName", "안중근"); // 기존에 존재하는 데이터를 사용자가 원하는 데이터로 변경
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>내장 객체 response</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>응답 헤더 정보 출력하기</h2>
<%
  // 내장 객체 response가 가지고 있는 header 정보의 이름을 모두 가져옴
  Collection<String> headerNames = response.getHeaderNames();
  // 발전된 for문을 사용하여 해당 객체가 가지고 있는 모든 요소를 출력
  for (String hName : headerNames){
    // getHeader(헤더명) : 지정한 헤더명과 1:1로 연결된 데이터를 출력
    String hValue = response.getHeader(hName);

%>
<li><%= hName %> : <%= hValue%></li>
<%
  }
%>

<h2>myNumber만 출력하기</h2>
<%--<%--%>
<%--  Collection<String> myNumber = response.getHeaders("myNumber");--%>
<%--  for (String myNum : myNumber){--%>
<%--%>--%>
<%--<li>myNumber : <%= myNum %></li>--%>
<%--<%--%>
<%--  }--%>
<%--%>--%>

<%
  Collection<String> myNumber = response.getHeaders("myNumber");
  for (String myNum : myNumber){
    out.println("<li>myNumber : " + myNum + "</li>");
  }
%>



</body>
</html>
