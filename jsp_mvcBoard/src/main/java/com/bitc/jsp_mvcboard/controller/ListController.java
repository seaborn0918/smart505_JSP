package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.model.MVCBoardDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/mvcboard/list.do")
public class ListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    MVCBoardDAO dao = new MVCBoardDAO();

    List<MVCBoardDTO> boardList = dao.selectBoardList();
    dao.close();

    req.setAttribute("boardList", boardList);

    req.getRequestDispatcher("/view/List.jsp").forward(req, resp);
  }
}
