<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-28
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-striped">
  <tr>
    <td >
      <% if (session.getAttribute("UserId") == null) { %>
      <a href="./LoginForm.jsp">로그인</a>
      <% } else { %>
      <a href="./Logout.jsp">로그아웃</a>
      <% } %>
      <a href="#">게시판(페이징X)</a>
      <a href="#">게시판(페이징O)</a>
    </td>
  </tr>
</table>
