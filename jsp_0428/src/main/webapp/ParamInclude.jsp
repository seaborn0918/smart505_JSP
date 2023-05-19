<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>인클루된 페이지에서 매개변수 확인</h2>
<%-- 액션 태그 param을 통해서 전송된 파라미터 2개를 가져옴--%>
<%= request.getParameter("loc1")%>에
<%= request.getParameter("loc2")%>이 있습니다. <br>
추가 확인 : <%= request.getParameter("fValue")%>