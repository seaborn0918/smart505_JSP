<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-12
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_0512.dao.MyfileDAO" %>
<%@ page import="com.bitc.jsp_0512.dto.MyfileDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
  request.setCharacterEncoding("UTF-8");

  // 서버에서 파일을 저장할 폴더 설정
  String saveDirectory = "C:\\upload";
  // 업로드 파일 최대 크기 설정
  int maxPostSize = 10 * 1024 * 1024;
  String encoding = "UTF-8";

  try {
    // cos.jar을 사용하여 클라이언트에서 전달한 request 객체를 분석
    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

    // 클라이언트에서 전달한 input 태그 중 type 속성 값이 file인 태그 정보 가져오기, 파일명 가져오기
    String fileName = mr.getFilesystemName("attachedFile");
    // 파일의 확장자 명을 가져오기
    String ext = fileName.substring(fileName.lastIndexOf("."));
    // 현재 시간을 기준으로 사용자 입력 패턴 사용
    String now = new SimpleDateFormat("yyyyMMdd_Hms").format(new Date());
    // 현재 시간을 사용자 입력 패턴으로 하여 문자열로 출력한 것과 확장자 부분을 합침. 현재 시간을 기준으로 새 파일명을 생성함
    String newFileName = now + ext;

    File oldFile = new File(saveDirectory + File.separator + fileName);
    File newFile = new File(saveDirectory + File.separator + newFileName);
    // 파일명 변경
    oldFile.renameTo(newFile);

    // 클라이언트에서 전달된 일반 input 태그 정보 가져오기
    String name = mr.getParameter("name");
    String title = mr.getParameter("title");
    // 체크박스 정보를 배열로 가져옴
    String[] cateArray = mr.getParameterValues("cate");
    // StringBuffer(Builder-싱글스레드) 문자열 생성 시 높은 메모리 효율성을 위해서 사용. cateBuf 객체 생성. 빈 문자열 상태
    StringBuffer cateBuf = new StringBuffer();
    if (cateArray == null) {
      // 문자열 추가
      cateBuf.append("선택 없음");
    } else {
      for (String s : cateArray) {
        cateBuf.append(s + ", ");
      }
    }

    // DB에 데이터를 전달하기 위한 객체 생성
    MyfileDTO dto = new MyfileDTO();
    // 데이터 입력
    dto.setName(name);
    dto.setTitle(title);
    // StringBuffer 타입의 객체를 String 타입의 데이터로 변환
    dto.setCate(cateBuf.toString());
    //원본 파일명
    dto.setOfile(fileName);
    // 서버에 저장된 파일명
    dto.setSfile(newFileName);

    // DB에 저장하기 위한 DAO 객체 생성
    MyfileDAO dao = new MyfileDAO();
    dao.open();
    // DB에 데이터 저장
    dao.insertFile(dto);
    dao.close();

    // 정상적으로 진행되었을 경우 리다이렉트
    response.sendRedirect("FileList.jsp");
  } catch (Exception e) {
    // 오류 발생시 원래 페이지로 돌아감
    e.printStackTrace();
    // 오류 메시지를 request 객체에 저장
    request.setAttribute("errorMessage", e.getMessage());
    request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
  }
%>