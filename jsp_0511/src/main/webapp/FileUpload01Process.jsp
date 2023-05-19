<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-11
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>

<%
  // jsp에서 파일 업로드를 사용 시 사용하는 라이브러리가 2가지 있음
  // cos.jar 라이브러리
  // apache의 commons.io, commons.upload 라이브러리

  // cos.jar 사용시 파일 업로드 처리
  // MultipartRequest 클래스가 업로드 된 파일 정보를 처리
  // 웹페이지에서 서버로 전송된 파일 자체만 다루는 클래스
  // 클라이언트에서 multipart/form-data 유형과 post 방식의 요청 파라미터 등을 분석한 후 일반 데이터 와 파일 데이터를 구분하여 파일 데이터에 접근
  // 한글 인코딩 값을 얻기 쉽고, 서버의 파일 저장 폴더에 동일한 파일이 있을 경우 자동으로 파일명을 변경

  // MultipartRequest의 매개변수
  // request : 첫번째 매개변수, request 내장 객체를 설정
  // saveDirectory : 두번째 매개변수, 서버로 전송된 파일을 저장할 폴더 설정
  // maxPostSize : 세번째 매개변수, 서버로 전송된 파일의 최대 크기 설정, byte 단위로 설정
  // encoding: 네번째 매개변수, 인코딩 유형 설정
  // policy : 다섯번째 매개변수, 파일명 변경 정책, 미 설정 시 동일한 파일 덮어쓰기

  // MultipartRequest의 메소드
  // getContentType(이름) : 업로드된 파일의 콘텐츠 유형을 출력. 파일이 없으면 null
  // getParameter(이름) : 요청 파라미터 중 이름에 해당하는 값을 출력
  // getParameterNames() : 요청 파라미터의 모든 이름을 가져와서 출력. Enumeration 타입으로 출력
  // getFile(이름) : 전송된 파일에 대한 파일 객체를 출력. 파일이 없으면 null. java.io.File 타입으로 출력
  // getFileNames() : 클라이언트의 form 태그에서 type이 file로 설정된 태그의 파라미터 명을 가져옴
  // getFilesystemName(이름) : 사용자가 설정하여 서버에 실제로 업로드된 파일명을 출력. 파일명 중복 시 변경된 파일명을 출력
  // getOriginalFileName(이름) : 사용자가 업로드가 실제 파일명을 출력. 파일명 중복 시 변경되기 전의 파일명을 출력함

  // 클라이언트에서 전송된 request 정보를 바탕으로 파일 정보를 가져오기 위한 객체 생성
  MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

  // Enumeration 반복가능한 객체로 만들어줌. 배열과 비슷. 인덱스는 없다.
  Enumeration<String> params = multi.getParameterNames();

  // hasMoreElements() : 출력할 객체가 있을 경우 true. 없으면 false
  // nextElement() : Enumeration의 객체에 서 데이터를 1개 출력
  while (params.hasMoreElements()) {
    String name = params.nextElement();
    String value = multi.getParameter(name);
    out.println(name + " = " + value + "<br>");
  }

  out.println("---------------------<br>");

  Enumeration<String> files = multi.getFileNames();

  while (files.hasMoreElements()) {
    String name = files.nextElement();
    String fileName = multi.getFilesystemName(name);
    String original = multi.getOriginalFileName(name);
    String type = multi.getContentType(name);
    File file = multi.getFile(name);

    out.println("요청 파라미터 이름 : " + name + "<br>");
    out.println("실제 파일 이름 : " + original + "<br>");
    out.println("저장 파일 이름 : " + fileName + "<br>");
    out.println("파일 콘텐츠 타입 : " + type + "<br>");

    if (file != null) {
      out.println("파일 크기 : " + file.length() + "<br>");
    }
  }
%>
