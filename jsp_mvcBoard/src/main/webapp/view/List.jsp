<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-17
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
<%--액션 태그의 include로 페이지 불러오기--%>
<%--<jsp:include page="/layout/Header.jsp"/>--%>
<%--jstl의 import로 페이지 불러오기--%>
<c:import url="/layout/Header.jsp">
  <c:param name="pageName" value="listPage"/>
</c:import>

<main class="container my-4 py-4">
  <table class="table table-bordered-top table-hover table-striped text-center">
    <colgroup>
      <col style="width: 5%">
      <col style="width: 50%">
      <col style="width: 15%">
      <col style="width: 7%">
      <col style="width: 15%">
      <col style="width: 8%">
    </colgroup>
    <thead class=" table-dark">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>조회수</th>
      <th>작성일</th>
      <th>첨부</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="empty boardList">
        <tr>
          <td colspan="6">등록된 게시물이 없습니다.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach items="${ boardList }" var="item" varStatus="loop">
          <tr>
            <td>${item.postIdx}</td>
            <td class="text-start">
              <a href="/mvcboard/view.do?idx=${item.postIdx}" class="text-decoration-none text-dark title-hover">${item.postTitle}</a>
            </td>
            <td>${item.postWriter}</td>
            <td>${item.postVisits}</td>
            <td>${item.postDate}</td>
            <td>
              <c:if test="${not empty item.postOfile}">
                <a href="/mvcboard/download.do?ofile=${item.postOfile}&sfile=${item.postSfile}&idx=${item.postIdx}" class="text-decoration-none text-dark down-hover">Down</a>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
  <div class="my-3">
<%--    검색창 --%>
  </div>
  <div class="my-3 d-flex justify-content-end">
    <a href="/mvcboard/write.do" class="btn btn-dark">글쓰기</a>
  </div>
</main>
<%@ include file="/layout/Footer.jsp"%>
</body>
</html>
