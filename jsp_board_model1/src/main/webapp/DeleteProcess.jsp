<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-02
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 세션 확인 --%>
<%@ include file="IsLoggedIn.jsp"%>
<%@ page import="com.bitc.jsp_board_model1.BoardDAO" %>
<%@ page import="com.bitc.jsp_board_model1.BoardDTO" %>

<%
  String userId = (String) session.getAttribute("userId");

  // 삭제할 글번호 가져옴
  int postNum = Integer.parseInt(request.getParameter("postNum"));
  String postWriteUser = request.getParameter("postWriteUser");

  // db 연결
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

  if (userId.equals(postWriteUser)) {

    // dao를 사용하여 현재 글의 게시물 삭제, db 종료
    int deleteResult = dao.deleteBoard(postNum);

    dao.dbClose();

    // BoardList.jsp 페이지로 이동

    // 삭제 성공시 BoardList.jsp로 이동, 실패시 오류 메시지 출력 후 이전 페이지로 이동
    if (deleteResult == 1) {
      response.sendRedirect("BoardList.jsp");
    } else {
      String errMsg = "<script>";
      errMsg += "alert('게시물 삭제시 오류가 발생했습니다.');";
      errMsg += "history.back();";
      errMsg += "</script>";

      out.println(errMsg);
    }
  } else {
    String errMsg = "<script>";
    errMsg += "alert('해당 글의 글쓴이가 아닙니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";

    out.println(errMsg);
  }



%>