<%@ page import="com.bitc.jsp_0427.JDBConnect" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-27
  Time: 오후 4:33
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

  // 클라이언트에서 가져온 데이터
  request.setCharacterEncoding("UTF-8");
  String postTitle = request.getParameter("title");
  String postContent = request.getParameter("content");
  String postId = request.getParameter("userId");

  JDBConnect db = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
  int result = db.postWrite(postTitle, postContent, postId);
  db.close();

  if (result != 0) {
    response.sendRedirect("./postList.jsp");
  } else {
    String code = "<script>";
    code += "alert('오류가 있습니다.');";
    code += "history.back();";
    code += "</script>";

    out.print(code);
  }
%>
