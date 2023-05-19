<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.bitc.jsp_board_model1.MemberDTO" %>
<%@ page import="com.bitc.jsp_board_model1.MemberDAO" %>

<%-- 클라이언트에서 전달한 데이터 가져오기 --%>
<%
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

  //db 연결
  MemberDAO dao = new MemberDAO();
  dao.dbOpen();

  // 클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인
  int selectResult = dao.isMember(userId, userPw);

  // 조회 결과가 1이면 db에 해당정보가 있음. 1이 아니면 오류가 발생
  if (selectResult == 1) {
    // 사용자 정보를 db에서 가져옴
    MemberDTO member = dao.selectMember(userId, userPw);
    // 세션에 데이터 저장
    session.setAttribute("userId", member.getUserId());
    session.setAttribute("userName", member.getUserName());
    session.setMaxInactiveInterval(60);
    // 첫화면으로 이동(BoardList.jsp)
    response.sendRedirect("BoardList.jsp");
  } else {
    // 오류 메시지 출력
    // 이전 화면으로 이동
    String errMsg = "<script>";
    errMsg += "alert('ID나 비밀번호가 다릅니다.');";
    errMsg += "history.back();";
    errMsg += "</script>";
    out.println(errMsg);
  }
%>
