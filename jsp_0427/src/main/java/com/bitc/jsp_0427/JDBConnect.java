package com.bitc.jsp_0427;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JDBConnect {
  private Connection con;
  private Statement stmt;
  private PreparedStatement psmt;
  private ResultSet rs;

//  private String driver;
//  private String dbUrl;
//  private String dbUserId;
//  private String dbUserPw;

  public JDBConnect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
      String dbUserId = "full505";
      String dbUserPw = "full505";

      con = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("DB 연결 성공(기본 생성자)");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public JDBConnect(String driver, String dbUrl, String dbUserId, String dbUserPw) {
//    this.driver = driver;
//    this.dbUrl = dbUrl;
//    this.dbUserId = dbUserId;
//    this.dbUserPw = dbUserPw;
    try {
      Class.forName(driver);
      con = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      System.out.println("DB 연결 성공");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public int postWrite(String postTitle, String postContent, String postId) {
    String sql = "INSERT INTO board (title, content, id, postdate) ";
    sql += "VALUES (?, ?, ?, NOW()) ";
    int result = 0;
    try {
      psmt = con.prepareStatement(sql);
      psmt.setString(1, postTitle);
      psmt.setString(2, postContent);
      psmt.setString(3, postId);

      result = psmt.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return result;
  }

  public List<Map<String, String>> postList() {
    // 게시물 목록을 가져오는 SQL 쿼리
    String sql = "SELECT num, title, content, id, postdate, visitcount FROM board ";
    List<Map<String, String>> dataList = new ArrayList<>();

    try {
      // PreparedStatement 를 사용하여 SQL 쿼리 질의
      psmt = con.prepareStatement(sql);
      // 결과값 가져오기
      rs = psmt.executeQuery();

      while (rs.next()) {
        // ResultSet에 저장된 내용 출력
        int postNum = rs.getInt("num");
        String postTitle = rs.getString("title");
        String postContent = rs.getString("content");
        String postId = rs.getString("id");
        String postDate = rs.getString("postdate");
        int postVisitCount = rs.getInt("visitcount");

        // HashMap 타입에 데이터 저장
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("postNum", String.valueOf(postNum));
        data.put("postTitle", postTitle);
        data.put("postContent", postContent);
        data.put("postId", postId);
        data.put("postDate", postDate);
        data.put("postVisitCount", String.valueOf(postVisitCount));

        // ArrayList에 게시물 1개에 대한 정보 추가
        dataList.add(data);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return dataList;
  }


  public void close() {
    try {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (psmt != null) psmt.close();
      if (con != null) con.close();
      System.out.println("JDBC 자원 해제");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
