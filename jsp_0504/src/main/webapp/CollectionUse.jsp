<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-04
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bitc.jsp_0504.Person" %>
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
<div class="container">
  <%
    List<Object> aList = new ArrayList<>();
    aList.add("청해진");
    aList.add(new Person("장보고", 28));
    pageContext.setAttribute("Ocean", aList);

    Map<String, String> map = new HashMap<>();
    map.put("한글", "훈민정음");
    map.put("Eng", "English");
    pageContext.setAttribute("King", map);
  %>
  <h2>List 컬렉션</h2>
  <ul>
    <li>0번째 요소 ${Ocean[0]}</li>
    <li>1번째 요소 ${Ocean[1].name}, ${Ocean[1].age}</li>
<%--    존재하지 않는 index의 데이터를 출력시 오류가 발생하는 것이 아니라 무시--%>
    <li>2번째 요소 ${Ocean[2]}</li>
  </ul>

  <h2>Map 컬렉션</h2>
  <ul>
    <li>영문 key : ${King["Eng"]}, ${King['Eng']}, ${King.Eng}</li>
<%--    표현언어를 통해서 내장객체에 저장된 속성을 출력시 한글이나 특수기호가 있으면 반드시 []사용--%>
    <li>한글 key : ${King["한글"]}, ${King['한글']}, \${King.한글}</li>
  </ul>
</div>
</body>
</html>
