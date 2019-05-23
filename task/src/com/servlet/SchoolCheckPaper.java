package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;

@WebServlet("/SchoolCheckPaper")
public class SchoolCheckPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String paperid = req.getParameter("paperid");
		String sign = req.getParameter("sign");
		Uploadinfo up = new UploadInfoimpl();
		if (sign != null && paperid != null && !"".equals(sign) && !"".equals(paperid)) {
			int count = up.updatePaperSign(sign, paperid);
			String str = "";
			if (count > 0) {
				str = "{\"flag\":\"success\"}";
				resp.getWriter().println(str);
			} else {
				str = "{\"flag\":\"error\"}";
				resp.getWriter().println(str);
			}
		}
	}
}
