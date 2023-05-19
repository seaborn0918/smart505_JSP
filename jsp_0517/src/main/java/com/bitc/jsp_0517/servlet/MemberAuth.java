package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDAO;
import com.bitc.jsp_0517.database.MemberDTO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/MemberAuth.mvc")
public class MemberAuth extends HttpServlet {
  // 회원 정보를 데이터 베이스에서 제어하는 DAO 클래스 객체 변수 선언
  private MemberDAO dao;

  @Override
  public void init() throws ServletException {
    ServletContext application = this.getServletContext();
    dao = new MemberDAO();
    dao.dbOpen();
  }

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse reps) throws ServletException, IOException {
    // 관리자 계정 정보 가져오기
    String admin_id = "nakja";

    // 클라이언트에서 사용자 id, pw 전달 받기
    String id = req.getParameter("id");
    String pass = req.getParameter("pass");

    // 데이터 베이스에서 해당 사용자 정보 가져오기
    // db의 정보 중 id, pw가 일치하지 않으면 null 반환
    MemberDTO member = dao.selectMember(id, pass);

    String memberName = member.getUserName();

    // 사용자 이름이 있을 경우 일반 사용자
    if (memberName != null) {
      // request 영역에 데이터 추가
      req.setAttribute("authMessage", memberName + " 회원님 방가방가^^*");
    } else {
      // 사용자가 입력한 id가 관리자와 같은지 확인
      if (admin_id.equals(id)) {
        req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
      } else req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
    }

    // 화면 출력을 위한 view 역할을 jsp 페이지로 이동
    req.getRequestDispatcher("/servlet/MemberAuth.jsp").forward(req, reps);
  }

  // 서버 종료 시 데이터 베이스 연결 종료
  @Override
  public void destroy(){
    dao.dbClose();
  }
}
