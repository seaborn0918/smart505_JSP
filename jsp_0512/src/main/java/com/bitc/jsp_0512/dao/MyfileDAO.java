package com.bitc.jsp_0512.dao;

import com.bitc.jsp_0512.dto.MyfileDTO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyfileDAO extends JDBConnect {
  public int insertFile(MyfileDTO dto) {
    int applyResult = 0;
    try {
      String query = "INSERT INTO myfile (name, title, cate, ofile, sfile, postdate) ";
      query += "VALUES (?, ?, ?, ?, ?, NOW()) ";

      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getTitle());
      pstmt.setString(3, dto.getCate());
      pstmt.setString(4, dto.getOfile());
      pstmt.setString(5, dto.getSfile());

      applyResult = pstmt.executeUpdate();
    } catch (Exception e) {
      System.out.println("INSERT 중 예외 발생");
      e.printStackTrace();
    }
    return applyResult;
  }

  public List<MyfileDTO> myFileList() {
    List<MyfileDTO> fileList = new ArrayList<>();

    // 파일 목록을 불러오는 쿼리문
    String query = "SELECT * FROM myfile ORDER BY idx DESC ";

    try {
      // 데이터 베이스에 SQL 쿼리를 전달하여 실행하고 결과값 받아오기
      pstmt = conn.prepareStatement(query);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        // 각각의 데이터 저장하기 위해 MyfileDTO 타입의 객체 생성
        MyfileDTO dto = new MyfileDTO();
        // ResultSet에 저장된 정보를 MyfileDto 타입의 객체에 저장
        dto.setIdx(rs.getString(1));
        dto.setName(rs.getString(2));
        dto.setTitle(rs.getString(3));
        dto.setCate(rs.getString(4));
        dto.setOfile(rs.getString(5));
        dto.setSfile(rs.getString(6));
        dto.setPostdate(rs.getString(7));

        // 저장된 정보를 List에 추가
        fileList.add(dto);
      }
    } catch (SQLException e) {
      System.out.println("**** SELECT 시 오류 발생 ****");
      e.printStackTrace();
    }
    return fileList;
  }
}
