package com.servlet;

import dao.SelectRank;
import daoimpl.AllRankimpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/search.do")
public class SearchStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 在校方的查看学生排名里面的ajax查找单个学生
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charst=utf-8");
		resp.setCharacterEncoding("utf-8");
		//通过ajax查询单个学生排名所有信息展示出来
		String search = req.getParameter("search").trim();
		SelectRank singlerank = new AllRankimpl();
		StringBuilder singlestudent = singlerank.Search(search);
		resp.getWriter().print(singlestudent);
	}
}