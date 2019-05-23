package com.servlet;

import dao.Publish;
import daoimpl.Publishimpl;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/scientific.do")
public class Scientific extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Publish p = new Publishimpl();
		List contents = p.selectAllPublish("科研立项");
		req.setAttribute("contents", contents);
		req.getRequestDispatcher("/superjsp/scientific.jsp").forward(req, resp);
	}
}