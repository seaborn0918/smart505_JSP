<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>JDBC 테스트</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h2>JDBC 테스트 1</h2>
<%
  //  JDBConnect jdbc1 = new JDBConnect();
//  jdbc1.close();

  String dbDriver = application.getInitParameter("MySQLDriver");
  String dbUrl = application.getInitParameter("dbUrl");
  String opt1 = application.getInitParameter("dbUrlOpt1");
  String opt2 = application.getInitParameter("dbUrlOpt2");
  String opt3 = application.getInitParameter("dbUrlOpt3");
  String dbUserId = application.getInitParameter("dbUserId");
  String dbUserPw = application.getInitParameter("dbUserPw");

  dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

  JDBConnect jdbc2 = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);

  // JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터 베이스 정보를 가져오는 프로그램 작성
  // board 테이블의 정보를 가져와서 화면에 table태그로 출력
%>

<div class="container my-4">
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
        jdbc2.psmt = jdbc2.con.prepareStatement(sql);
        jdbc2.rs = jdbc2.psmt.executeQuery();
        while (jdbc2.rs.next()) {
          int postNum = jdbc2.rs.getInt("num");
          String postTitle = jdbc2.rs.getString("title");
          String postContent = jdbc2.rs.getString("content");
          String postId = jdbc2.rs.getString("id");
          String postDate = jdbc2.rs.getString("postdate");
          int postVisitcount = jdbc2.rs.getInt("visitcount");
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
          jdbc2.close();
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>


<%--JDBConnet 클래스에 게시판의 글을 등록하는 postWrite, postList 메소드를 추가하고, 해당 메소드를 사용하여 게시판의 글 목록을 확인하는 프로그램 작성--%>
<%-- 해당 클래스의 필드 접근제한자를 모두 private으로 수정--%>
<%-- 글 등록 페이지, 리스트 확인 페이지--%>
