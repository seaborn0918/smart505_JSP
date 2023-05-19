<%@ page import="com.bitc.jsp_0512.dao.MyfileDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bitc.jsp_0512.dto.MyfileDTO" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-12
  Time: 오후 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
  <h2>DB에 등록된 파일 목록 보기</h2>
  <a href="FileUploadMain.jsp">파일 등록하기</a>
  <%
    MyfileDAO dao = new MyfileDAO();
    dao.open();
    List<MyfileDTO> fileLists = dao.myFileList();
    dao.close();
  %>
  <table class="table">
    <thead>
      <tr>
        <th>NO</th>
        <th>작성자</th>
        <th>제목</th>
        <th>카테고리</th>
        <th>원본 파일명</th>
        <th>저장된 파일명</th>
        <th>작성일</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <% for (MyfileDTO f : fileLists) { %>
      <tr>
        <td><%=f.getIdx()%></td>
        <td><%=f.getName()%></td>
        <td><%=f.getTitle()%></td>
        <td><%=f.getCate()%></td>
        <td><%=f.getOfile()%></td>
        <td><%=f.getSfile()%></td>
        <td><%=f.getPostdate()%></td>
        <td><a href='Download.jsp?oName=<%=URLEncoder.encode(f.getOfile(),"UTF-8")%>&sName=<%=URLEncoder.encode(f.getSfile(),"UTF-8")%>'>[다운로드]</a></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
