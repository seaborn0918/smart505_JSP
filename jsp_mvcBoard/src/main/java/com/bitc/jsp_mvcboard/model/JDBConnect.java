package com.bitc.jsp_mvcboard.model;

import java.sql.*;

public class JDBConnect {
  protected Connection conn;
  protected PreparedStatement pstmt;
  protected ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  public JDBConnect() {
    this("com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC", "full505", "full505");
  }

  public JDBConnect(String driver, String url, String id, String pw) {
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, id, pw);
      System.out.println("**** 데이터 베이스 연결 성공 ****");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void close() {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
      System.out.println("**** 데이터 베이스 연결 종료 ****");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
