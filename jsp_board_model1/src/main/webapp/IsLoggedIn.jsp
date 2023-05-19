<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  // 세션값 존재하는지 확인
  // 로그인, 보드리스트, 보드라이트 제외하고 체크 if문
  if (session.getAttribute("userId") == null) {
    String errMsg = "<script>";
    errMsg += "alert('로그인 후 이용해주세요');";
    errMsg += "location.href = 'Login.jsp';";
    errMsg += "</script>";

    out.println(errMsg);
    return;
  }
%>
