package com.bitc.jsp_0428;

import java.sql.*;

public class JDBConnect {
  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;
  
  public JDBConnect(String driver, String url, String id, String pwd) {
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, id, pwd);
      System.out.println("DB 연결 성공");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void close() {
    try {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
