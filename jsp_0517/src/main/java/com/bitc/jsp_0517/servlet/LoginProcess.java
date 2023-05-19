package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDAO;
import com.bitc.jsp_0517.database.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/servlet/LoginProcess.do")
public class LoginProcess extends HttpServlet {
  private MemberDAO dao;

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    // 클라이언트가 전달한 데이터 가져옴.
    String userId = req.getParameter("userId");
    String userPw = req.getParameter("userPw");

    try {
      // DAO 객체 생성
      dao = new MemberDAO();
      dao.dbOpen();

      // 클라이언트에서 전달한 사용자 정보가 데이터베이스에 있는지 확인
      if (dao.isMember(userId, userPw) == 1) {
        // 사용자 정보를 가져옴
        MemberDTO member = dao.selectMember(userId, userPw);

        // 관리자인지 아닌지 확인
        if (member.getUserGrade() == 1) {
          // 관리자 정보를 request 객체에 저장
          req.setAttribute("userGrade", "관리자");
        }

        // 사용자 정보를 request 객체에 저장
        req.setAttribute("userId", member.getUserId());
        req.setAttribute("userName", member.getUserName());
        req.setAttribute("userGrade", member.getUserGrade());

        // 지정한 페이지로 이동
        req.getRequestDispatcher("/servlet/LoginR.jsp").forward(req, resp);
      } else {
        // 로그인 오류 메시지 request 객체에 저장
        req.setAttribute("errMessage", "회원 정보가 없습니다.");
        req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
      }
    } catch (Exception e) {
      System.out.println("로그인 시 오류가 발생했습니다.");
      req.setAttribute("errMessage", "로그인 시 오류가 발생했습니다.");
      req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
      e.printStackTrace();
    } finally {
      dao.dbClose();
    }
  }
}
