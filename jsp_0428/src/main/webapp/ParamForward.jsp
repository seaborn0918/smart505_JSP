<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String fValue = "포워드페이지 변수값";
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
<%--  포워드된 페이지에서 액션태그 useBean으로 자바빈즈 생성, 데이터 범위를 request로 설정 --%>
<%--  이전 페이지인 ParamMain.jsp에서 생성한 자바빈즈의 내용이 그대로 존재함--%>
  <jsp:useBean id="person" class="com.bitc.jsp_0428.Person" scope="request"/>
  <h2>포워드된 페이지에서 매개변수 확인</h2>
  <ul>
<%--    액션태그 getProperty로 자바빈즈의 데이터 가져옴--%>
    <li><jsp:getProperty name="person" property="name"/></li>
    <li>나이 : <jsp:getProperty name="person" property="age"/></li>
<%--  액션태그 param으로 전달한 데이터 가져오기--%>
    <li>본명 : <%= request.getParameter("param1") %></li>
    <li>출생 : <%= request.getParameter("param2") %></li>
    <li>특징 : <%= request.getParameter("param3") %></li>
  </ul>
<%--  액션태그 include로 ParamInclude.jsp 페이지 호출--%>
<%--    액션태그 param을 사용하여 include하는 페이지에 데이터 전송--%>
  <jsp:include page = "ParamInclude.jsp">
    <jsp:param name="loc1" value="강원도 영월"/>
    <jsp:param name="loc2" value="김삿갓면"/>
    <jsp:param name="fValue" value="<%=fValue%>"/>
  </jsp:include>

</div>
</body>
</html>
