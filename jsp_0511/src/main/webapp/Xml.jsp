<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
<%-- xml 정보가 있는 파일 내용 가져오기 --%>
<%-- page 영역의 변수 booklist에 저장 --%>
<c:import url="http://localhost:8080/BookList.xml" var="bookList" charEncoding="UTF-8"/>
<%-- 변수 booklist에 저장된 xml 정보를 파싱, page 영역의 변수 blist에 저장--%>
<x:parse xml="${bookList}" var="blist"/>
<div class="container my-4">
  <h4>파싱 1</h4>
  <%-- select 속성을 사용하여 xml 내용 중 지정한 태그를 선택 --%>
  제목 : <x:out select="$blist/booklist/book[1]/name"/> <br>
  저자 : <x:out select="$blist/booklist/book[1]/author"/> <br>
  가격 : <x:out select="$blist/booklist/book[1]/price"/>

  <h4>파싱2</h4>
  <table class="table">
    <tr>
      <th>제목</th>
      <th>저자</th>
      <th>가격</th>
    </tr>
    <%-- 반복 실행을 위해서 select 속성으로 태그를 지정. 아래에서 사용할 변수를 설정--%>
    <x:forEach select="$blist/booklist/book" var="item">
      <tr>
        <td><x:out select="$item/name"/></td>
        <td><x:out select="$item/author"/></td>
        <td>
          <%-- choose, when, otherwise를 사용하여 if ~else 문 구현 --%>
          <x:choose>
            <x:when select="$item/price >= 20000">
              2만원 이상 <br>
            </x:when>
            <x:otherwise>
              2만원 미만 <br>
            </x:otherwise>
          </x:choose>
        </td>
      </tr>
    </x:forEach>
  </table>

  <h4>파싱 3</h4>
  <table class="table">
    <x:forEach select="$blist/booklist/book" var="item">
      <tr>
        <td><x:out select="$item/name"/></td>
        <td><x:out select="$item/author"/></td>
        <td><x:out select="$item/price"/></td>
        <td><x:if select="$item/name = '총, 균, 쇠'">구매함</x:if></td>
      </tr>
    </x:forEach>
  </table>
</div>
</body>
</html>
