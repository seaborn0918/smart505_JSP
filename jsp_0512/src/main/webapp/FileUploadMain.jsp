<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-12
  Time: 오전 9:22
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
  <script>
    function validateForm(form) {
      if (form.name.value == "") {
        alert("작성자를 입력하세요.");
        form.name.focus();
        return false;
      }
      if (form.title.value == "") {
        alert("제목을 입력하세요.")
        form.title.focus();
        return false;
      }
      if (form.attachedFile.value == "") {
        alert("첨부파일은 필수 입력입니다.")
        return false;
      }
    }
  </script>
</head>
<body>
<div class="container my-4">
  <h3>파일 업로드</h3>
  <span style="color: red">${errorMessage}</span>
  <form name="fileForm" method="post" enctype="multipart/form-data" action="UploadProcess.jsp"
        onsubmit="return validateForm(this);">
    작성자 : <input type="text" name="name" value="머스트해브"><br>
    제목 : <input type="text" name="title"><br>
    카테고리(선택사항) :
    <%-- chechbox 사용 시 name 속성의 값이 동일하면 서버에 배열로 전달 --%>
    <input type="checkbox" name="cate" value="사진" checked>사진
    <input type="checkbox" name="cate" value="과제">과제
    <input type="checkbox" name="cate" value="워드">워드
    <input type="checkbox" name="cate" value="음원">음원<br>
    첨부파일 : <input type="file" name="attachedFile"><br>
    <input type="submit" value="전송하기">
  </form>
</div>
</body>
</html>
