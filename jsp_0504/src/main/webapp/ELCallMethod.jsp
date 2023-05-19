<%@ page import="com.bitc.jsp_0504.MyELClass" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%
  MyELClass myClass = new MyELClass();
  pageContext.setAttribute("myClass", myClass);
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
  <h3>영역에 저장 후 메서드 호출하기</h3>
<%--  기존 자바 문법에서의 객체 멤버 호출하는 것과 동일하게 진행--%>
  001225-3000000 => ${ myClass.getGender("001225-3000000") } <br>
  001225-2000000 => ${ myClass.getGender("001225-2000000") }

<%--  최신 EL 언어의 정적 메소드 호출 방식 --%>
<%--  기존 자바 문법에서의 정적 메소드 호출하는 것과 동일--%>
  <h3>클래스명을 통해 정적 메서드 호출하기</h3>
  ${ MyELClass.showGugudan(7) }
  </table>

<%--  --%>
  <h3>TLD 파일 등록 후 정적 메소드 호출하기</h3>
  <ul>
    <li>mytag:isNumber("100") => ${ mytag:isNumber("100") }</li>
    <li>mytag:isNumber("이백") => ${ mytag:isNumber("이백") }</li>
  </ul>
</div>
</body>
</html>
