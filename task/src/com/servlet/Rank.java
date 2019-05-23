package com.servlet;

import dao.SelectRank;
import daoimpl.AllRankimpl;
import pojo.Student;
import pojo.StudentRank;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/rank.do")
public class Rank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		SelectRank sr = new AllRankimpl();
		//搜索所有学生排名信息
		List<Student> listrank = sr.selectRank();
		req.setAttribute("listrank", listrank);
		req.getRequestDispatcher("/studentrank.jsp").forward(req, resp);
	}
}