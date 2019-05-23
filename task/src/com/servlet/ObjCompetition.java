package com.servlet;

import dao.Publish;
import daoimpl.Publishimpl;
import pojo.PublishCompetition;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/objcompetion.do")
public class ObjCompetition extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String leibie = req.getParameter("lb");
		// 1是学科竞赛
		if ("1".equals(leibie)) {
			String projection = "学科竞赛";
			Publish p = new Publishimpl();
			List<PublishCompetition> listpc = p.selectAllPublish(projection);
			req.setAttribute("listpc", listpc);
			req.getRequestDispatcher("/superjsp/objcompetition.jsp").forward(req, resp);
			return;
		}
		// 2是科研立项
		if ("2".equals(leibie)) {
			String projection = "科研立项";
			Publish p = new Publishimpl();
			List<PublishCompetition> listpc = p.selectAllPublish(projection);
			req.setAttribute("listpc", listpc);
			req.getRequestDispatcher("/superjsp/scientific.jsp").forward(req, resp);
			return;
		} else {
			return;
		}
	}

	private static final long serialVersionUID = 1L;
}