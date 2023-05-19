<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-18
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  // 2. 스크립틀릿을 사용하여 전달된 파라미터 값 가져오기
  String pageName = request.getParameter("pageName");
  String result = "";
  if (pageName.equals("listPage")){
    result = "게시물 목록 페이지";
  } else if (pageName.equals("writePage")) {
    result = "게시물 등록 페이지";
  } else if (pageName.equals("viewPage")) {
    result = "게시물 상세 페이지";
  } else if (pageName.equals("confirmedPage")){
    result = "게시물 비밀번호 확인 페이지";
  } else if (pageName.equals("editPage")) {
    result = "게시물 수정 페이지";
  }
%>
<header class="py-5 bg-opacity-10">
  <div class="container">
    <h1 class="display-3 text-center">MVC2 방식 게시판</h1>
<%--    1. el 언어를 사용하여 전달된 파라미터 값 가져오기--%>
<%--    <h2 class="text-center page-name">${param.pageName}</h2>--%>
<%--    2. 스크립틀릿 사용--%>
<%--    <h2 class="text-center header-sub-title"><%=result%></h2>--%>

<%--    3. el 언어 사용하여--%>
    <c:choose>
      <c:when test="${param.pageName == 'listPage'}">
        <h2 class="header-sub-title">게시물 목록 페이지</h2>
      </c:when>
      <c:when test="${param.pageName == 'writePage'}">
        <h2 class="header-sub-title">게시물 등록 페이지</h2>
      </c:when>
      <c:when test="${param.pageName == 'viewPage'}">
        <h2 class="header-sub-title">게시물 상세 페이지</h2>
      </c:when>
      <c:when test="${param.pageName == 'confirmedPage'}">
        <h2 class="header-sub-title">게시물 비밀번호 확인 페이지</h2>
      </c:when>
      <c:when test="${param.pageName == 'editPage'}">
        <h2 class="header-sub-title">게시물 수정 페이지</h2>
      </c:when>
    </c:choose>
  </div>
</header>
