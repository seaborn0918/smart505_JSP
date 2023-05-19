<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
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
<%
  request.setCharacterEncoding("UTF-8");
  // 클라이언트에서 전송된 request 정보를 가지고 데이터를 분석할 클래스의 객체 생성
  DiskFileUpload upload = new DiskFileUpload();

  String path = "C:\\upload";
  // 업로드 파일 최대 크기 설정
  upload.setFileSizeMax(10 * 1024 * 1024);
  // 메모리 크기 설정
  upload.setSizeThreshold(4096);
  // 임시 폴더 설정
  upload.setRepositoryPath(path);

  // request 정보 파싱하여 List 타입으로 저장
  List<FileItem> items = upload.parseRequest(request);
  Iterator<FileItem> params = items.iterator();

  while (params.hasNext()) {
    // List에 저장된 데이터 1개 가져옴
    FileItem item = params.next();
    // 가져온 정보가 일반 input 필드인지 아니면 file 인지 확인
    if (item.isFormField()) {
      // 일반 필드의 이름 가져오기
      String name = item.getFieldName();
      // 일반 필드의 값 가져오기
      String value = item.getString("UTF-8");
      out.println(name + " = " + value + "<br>");
    } else { // 파일 필드일 경우
      // input  태그의 이름 가져오기
      String fileFieldName = item.getFieldName();
      // 파일명 가져오기
      String fileName = item.getName();
      // 파일의 컨텐츠 타입 가져오기
      String contentType = item.getContentType();

      // 파일명만 사용할 수 있도록 파일 경로 제거
      fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

      // 파일 크기 가져오기(byte 크기로 가져옴)
      long fileSize = item.getSize();

      // 서버에 저장할 파일 경로 및 이름 설정
      File file = new File(path + "\\" + fileName);
      // 서버의 저장장치에 파일을 쓰기
      item.write(file);

      out.println("------------------<br>");
      out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
      out.println("저장 파일 이름 : " + fileName + "<br>");
      out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
      out.println("파일 크기 : " + fileSize + "<br>");
    }
  }


%>
</body>
</html>
