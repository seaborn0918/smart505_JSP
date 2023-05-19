<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
  Connection conn = null;
  String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
  String dbUserId = "full505";
  String dbUserPw = "full505";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
    out.println("데이터베이스 접속에 성공했습니다.");
  } catch (SQLException e) {
    out.println("데이터베이스 접속에 실패했습니다.");
  } finally {
    try {
      if (conn != null) {
        conn.close();
      }
    } catch (Exception e) {
    }
  }
%>
</body>
</html>