<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<div class="container my-4">
  <ul>
    <li><a href="Remove.jsp" class="btn btn-primary">Remove 예제</a></li>
    <li><a href="If.jsp" class="btn btn-primary my-3">If 예제</a></li>
    <li><a href="Choose.jsp" class="btn btn-primary my-3">Choose 예제</a></li>
    <li><a href="ForEachNormal.jsp" class="btn btn-primary my-3">ForEachNormal 예제</a></li>
    <li><a href="ForEachExtend1.jsp" class="btn btn-primary my-3">ForEachExtend1 예제</a></li>
    <li><a href="ForEachExtend2.jsp" class="btn btn-primary my-3">ForEachExtend2 예제</a></li>
    <li><a href="ForTokens.jsp" class="btn btn-primary my-3">ForTokens 예제</a></li>
    <li><a href="Import.jsp" class="btn btn-primary my-3">Import 예제</a></li>
    <li><a href="Redirect.jsp" class="btn btn-primary my-3">Redirect 예제</a></li>
    <li><a href="Url.jsp" class="btn btn-primary my-3">Url 예제</a></li>
    <li><a href="Out.jsp" class="btn btn-primary my-3">Out 예제</a></li>
    <li><a href="Catch.jsp" class="btn btn-primary my-3">Catch 예제</a></li>
    <li><a href="Fmt1.jsp" class="btn btn-primary my-3">Fmt1 예제</a></li>  </ul>
</div>

</body>
</html>