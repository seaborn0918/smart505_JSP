<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-26
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
<%
  Connection conn = null;
  PreparedStatement pstmt = null;

  request.setCharacterEncoding("UTF-8");
  String postTitle = request.getParameter("title");
  String postId = request.getParameter("userId");
  String postContent = request.getParameter("content");

  try {
    String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String dbUserId = "full505";
    String dbUerPw = "full505";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUserId, dbUerPw); // mysql과 연결

    String sql = "INSERT INTO board(title, content, id, postdate) ";
    sql += "VALUES (?, ?, ?, NOW()) ";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, postTitle);
    pstmt.setString(2, postContent);
    pstmt.setString(3, postId);
    int result = pstmt.executeUpdate();

    out.println("bord 테이블에 데이터 추가가 성공했습니다.<br>");
    out.println(result + "개의 테이터를 추가했습니다.");



  } catch (SQLException e) {
    out.println("데이터베이스 사용 시 오류가 발생했습니다.");
    out.println("SQLException : " + e.getMessage());
  } finally {
    try {
      if(pstmt != null) {
        pstmt.close();
      }
      if (conn != null) {
        conn.close();
      }
    } catch (Exception e) {}
  }
%>
</body>
</html>
