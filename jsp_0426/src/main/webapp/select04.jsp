<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-26
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
  PreparedStatement pstmt = null;
  ResultSet rs = null;
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>PrepareStatement</title>
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
      try {
        String sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
          int postNum = rs.getInt("num");
          String postTitle = rs.getString("title");
          String postContent = rs.getString("content");
          String postId = rs.getString("id");
          String postDate = rs.getString("postdate");
          int postVisitcount = rs.getInt("visitcount");
    %>
    <tr>
      <td><%=postNum%>
      </td>
      <td><%=postTitle%>
      </td>
      <td><%=postContent%>
      </td>
      <td><%=postId%>
      </td>
      <td><%=postDate%>
      </td>
      <td><%=postVisitcount%>
      </td>
    </tr>
    <%
        }
      } catch (SQLException e) {
        out.println("데이터베이스 사용 시 오류가 발생했습니다.");
        out.println("SQLException : " + e.getMessage());
      } finally {
        try {
          if (rs != null) rs.close();
          if (pstmt != null) pstmt.close();
          if (conn != null) conn.close();
        } catch (Exception e) {
        }
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>
