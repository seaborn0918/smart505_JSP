package com.bitc.jsp_mvcboard.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MVCBoardDAO extends JDBConnect {
  public MVCBoardDAO() {
    super();
  }

  // 전체 게시물 목록 가져오기
  public List<MVCBoardDTO> selectBoardList() {
    List<MVCBoardDTO> boardList = new ArrayList<>();

    String sql = "SELECT post_idx, post_title, post_writer, post_visits, post_date, post_ofile, post_sfile ";
    sql += "FROM mvcboard ";
    sql += "ORDER BY post_idx DESC ";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        MVCBoardDTO board = new MVCBoardDTO();
        board.setPostIdx(rs.getInt("post_idx"));
        board.setPostTitle(rs.getString("post_title"));
        board.setPostWriter(rs.getString("post_writer"));
        board.setPostVisits(rs.getInt("post_visits"));
        board.setPostDate(rs.getString("post_date"));
        board.setPostOfile(rs.getString("post_ofile"));
        board.setPostSfile(rs.getString("post_sfile"));
        boardList.add(board);
      }
    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다.*****");
      System.out.println("***** Error : " + e.getMessage() + " *****");
      e.printStackTrace();
    }
    return boardList;
  }

  // 데이터 베이스에 글 등록하기
  public int insertBoard(MVCBoardDTO board) {
    int result = 0;

    String sql = "INSERT INTO mvcboard ";
    sql += "(post_writer, post_title, post_content, post_pass, post_date, post_ofile, post_sfile) ";
    sql += "VALUES ";
    sql += "(?, ?, ?, ?, NOW(), ?, ?) ";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, board.getPostWriter());
      pstmt.setString(2, board.getPostTitle());
      pstmt.setString(3, board.getPostContent());
      pstmt.setString(4, board.getPostPass());
      pstmt.setString(5, board.getPostOfile());
      pstmt.setString(6, board.getPostSfile());

      result = pstmt.executeUpdate(); // sql로 추가, 삭제 등 실행한 횟수 int result에 대입

    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에 INSERT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + " *****");
      e.printStackTrace();
    }

    return result;
  }

  // 게시물 상세 정보 가져오기
  public MVCBoardDTO selectBoardDetail(int Idx) {
    MVCBoardDTO board = new MVCBoardDTO();

    String sql = "SELECT post_idx, post_title, post_content, post_writer, post_visits, post_date, post_ofile, post_sfile, post_dn_count ";
    sql += "FROM mvcboard ";
    sql += "WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, Idx);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        board.setPostIdx(rs.getInt("post_idx"));
        board.setPostTitle(rs.getString("post_title"));
        board.setPostContent(rs.getString("post_content"));
        board.setPostWriter(rs.getString("post_writer"));
        board.setPostDate(rs.getString("post_date"));
        board.setPostOfile(rs.getString("post_ofile"));
        board.setPostSfile(rs.getString("post_sfile"));
        board.setPostVisits(rs.getInt("post_visits"));
        board.setPostDnCount(rs.getInt("post_dn_count"));
      }
    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + " *****");
      e.printStackTrace();
    }
    return board;
  }

  public boolean equalsPassword(int postIdx, String postPass) {
    boolean result = false;

    String sql = "SELECT COUNT(*) AS cnt ";
    sql += "FROM mvcboard ";
    sql += "WHERE post_idx = ? ";
    sql += "AND post_pass = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.setString(2, postPass);

      rs = pstmt.executeQuery();
      while (rs.next()) {
        if (rs.getInt("cnt") == 1) {
          result = true;
        }
      }

    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 SELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }


    return result;
  }

  // 게시물 삭제
  public int deleteBoard(int postIdx) {
    int result = 0;
    String sql = "DELETE FROM mvcboard WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      result = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 DELETE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }

    return result;
  }

  // 게시글 수정
  public int updateBoard(MVCBoardDTO board) {
    int result = 0;

    String sql = "UPDATE mvcboard ";
    sql += "SET post_title = ?, post_writer = ?, post_pass = ?, ";
    sql += "post_content = ?, post_date = NOW() ";
    sql += "WHERE post_idx = ? ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getPostTitle());
      pstmt.setString(2, board.getPostWriter());
      pstmt.setString(3, board.getPostPass());
      pstmt.setString(4, board.getPostContent());
      pstmt.setInt(5, board.getPostIdx());

      result = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
    return result;
  }

  // 조회수 업데이트
  public void updateBoardVisits(int postIdx) {
    String sql = "UPDATE mvcboard SET post_visits = post_visits + 1 WHERE post_idx = ? ";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
  }

  // 파일 다운로드 수 업데이트
  public void updateBoardDnCnt(int postIdx) {
    String sql = "UPDATE mvcboard SET post_dn_count = post_dn_count + 1 WHERE post_idx = ? ";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, postIdx);
      pstmt.executeUpdate();

    } catch (SQLException e) {
      System.out.println("***** 데이터 베이스에서 UPDATE 중 오류가 발생했습니다. *****");
      System.out.println("***** Error : " + e.getMessage() + "*****");
      e.printStackTrace();
    }
  }
}




