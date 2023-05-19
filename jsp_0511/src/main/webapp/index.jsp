<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<div class="container">
  <ul>
    <li><a href="Fmt2.jsp" class="btn btn-info my-2">Fmt2 예제</a></li>
    <li><a href="Fmt3.jsp" class="btn btn-info my-2">Fmt3 예제</a></li>
    <li><a href="Xml.jsp" class="btn btn-info my-2">Xml 예제</a></li>
    <li><a href="FileUpload01.jsp" class="btn btn-info my-2">FileUpload01 예제</a></li>
    <li><a href="FileUpload02.jsp" class="btn btn-info my-2">FileUpload02 예제</a></li>
    <li><a href="FileUpload03.jsp" class="btn btn-info my-2">FileUpload03 예제</a></li>
    <li><a href="FileUpload04.jsp" class="btn btn-info my-2">FileUpload04 예제</a></li>
  </ul>
</div>
</body>
</html>