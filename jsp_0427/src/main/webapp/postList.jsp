<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String dbDriver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbUrl");
  String opt1 = application.getInitParameter("dbUrlOpt1");
  String opt2 = application.getInitParameter("dbUrlOpt2");
  String opt3 = application.getInitParameter("dbUrlOpt3");
  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

  // 게시판 글 목록을 가져와서 저장할 변수
  List<Map<String, String>> dataList = null;
  // DB 사용 객체 생성
  JDBConnect db = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
  dataList = db.postList();
  db.close();
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
<div class="container">
  <table class="table table-hover table-striped">
    <thead>
    <tr>
      <th>글번호</th>
      <th>글제목</th>
      <th>글내용</th>
      <th>글쓴이</th>
      <th>등록날짜</th>
      <th>조회수</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Map<String, String> data : dataList) {
        String postNum = data.get("postNum");
        String postTitle = data.get("postTitle");
        String postContent = data.get("postContent");
        String postId = data.get("postId");
        String postDate = data.get("postDate");
        String postVisitCount = data.get("postVisitCount");

    %>
    <tr>
      <td><%=postNum%></td>
      <td><%=postTitle%></td>
      <td><%=postContent%></td>
      <td><%=postId%></td>
      <td><%=postDate%></td>
      <td><%=postVisitCount%></td>
    </tr>
    <%
    }
    %>
    </tbody>
  </table>
</div>
</body>
</html>