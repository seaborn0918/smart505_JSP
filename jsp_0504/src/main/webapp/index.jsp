<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br><br><br>

<div class="container my-4">
  <ul class="d-grid gap-2">
    <li><a href="ImplicitObjMain.jsp" class="btn btn-primary">ImplicitObjMain 예제</a></li>
    <li><a href="FormSubmit.jsp" class="btn btn-primary">FormSubmit 예제</a></li>
    <li><a href="ObjectParams.jsp" class="btn btn-primary">ObjectParams 예제</a></li>
    <li><a href="OtherImplicitObj.jsp" class="btn btn-primary">OtherImplicitObj 예제</a></li>
    <li><a href="CollectionUse.jsp" class="btn btn-primary">CollectionUse 예제</a></li>
    <li><a href="Operator1.jsp" class="btn btn-primary">Operator1 예제</a></li>
    <li><a href="Operator2.jsp" class="btn btn-primary">Operator2 예제</a></li>
    <li><a href="ELCallMethod.jsp" class="btn btn-primary">ELCallMethod 예제</a></li>
    <li><a href="TestJSTL.jsp" class="btn btn-primary">TestJSTL 예제</a></li>
    <li><a href="Set1.jsp" class="btn btn-primary">Set1 예제</a></li>
    <li><a href="Set2.jsp" class="btn btn-primary">Set2 예제</a></li>
  </ul>
</div>

</body>
</html>