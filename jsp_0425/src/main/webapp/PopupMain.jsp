<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-25
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  // 팝업창 상태 설정
  String popupMode = "on";

  // 클라이언트에서 전송된 쿠키 정보를 읽어옴
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie c : cookies) {
      String cookieName = c.getName();
      String cookieValue = c.getValue();
      // 쿠키 이름이 "PopupClose"일 경우 팝업창 상태 값을 변경
      if (cookieName.equals("PopupClose")) {
        popupMode = cookieValue;
      }
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>쿠키를 이용한 팝업 관리</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
  <style>
      div#popup {
          position: absolute;
          top: 100px;
          left: 50px;
          color: yellow;
          width: 270px;
          height: 100px;
          background-color: gray;
      }

      div#popup > div {
          position: relative;
          background-color: #ffffff;
          top: 0px;
          border: 1px solid gray;
          padding: 10px;
          color: black;
      }
  </style>

  <script>
      $(function () {
          // 닫기 버튼 클릭시 팝업창 닫기
          $('#closeBtn').click(function () {
              $('#popup').hide();

              // 팝업창의 내용 중 체크박스 확인
              // 체크 박스의 checked 속성이 checked 일 경우 value 속성값을 가져옴
              let chkVal = $("input:checkbox[id=inactiveToday]:checked").val();

              // jquery의 ajax 통신 함수. 지정한 서버와 비동기 통신
              $.ajax({
                  url: './PopupCookie.jsp',
                  type: 'get',
                  data: {inactiveToday: chkVal},
                  dataType: "text",
                  success: function (resData) {
                      // 통신 성공 시 전송된 데이터가 빈 값이 아닐 경우
                      if(resData != '') location.reload(); // 현재 페이지 리플레시
                  }
              });
          });
      });
  </script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
  for (int i = 1; i <= 10; i++) {
    out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br>");
  }
  if (popupMode.equals("on")) {
%>
<div id="popup">
  <h2 align="center">공지사항 팝업입니다.</h2>
  <div align="right">
    <form name="popFrm">
      <input type="checkbox" id="inactiveToday" value="1"> 하루 동안 열지 않음
      <input type="button" value="닫기" id="closeBtn">
    </form>
  </div>
</div>
<%
  }
%>
</body>
</html>

