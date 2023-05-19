package com.bitc.jsp_0512;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// HttpServlet 클래스를 상속받아 해당 클래스를 서블릿 클래스로 사용함
// @WebServlet : 사용자 요청 주소와 요청 처리를 하는 서블릿 클래스를 연동하는 어노테이션
@WebServlet(name = "AnnoMapping", value = "/Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {
  // 사용자 요청을 처리하기 위해서 doGet, doPost 메소드를 오버라이딩함
  // jsp파일은 기본적으로 request, response 내장 객체가 존재하지만 서블릿은 내장객체를 매개변수로 전달받아야함
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setAttribute("message", "@WebServlet으로 매핑");
    // 지정한 jsp파일을 View로 사용하고 있음
    // forward()를 통해서 view 파일을 출력하기 때문에 사용자가 접속한 주소와 실제 파일의 이름이 다름(보안)
    req.getRequestDispatcher("/AnnoMapping.jsp").forward(req, resp);
  }
}
