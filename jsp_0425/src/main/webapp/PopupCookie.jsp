<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // 클라이언트에서 전송한 데이터를 가져옴
  String chkVal = request.getParameter("inactiveToday");

  // 클라이언트에서 전송한 값이 1이면
  if (chkVal != null && chkVal.equals("1")) {
    Cookie cookie = new Cookie("PopupClose", "off");
    cookie.setPath(request.getContextPath());
    cookie.setMaxAge(60 * 60 * 24);
    response.addCookie(cookie);
    out.println("쿠키 : 하루 동안 열지 않음"); // 클라이언트로 내용 전송
  }
%>
