package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UploadPatentdao;
import daoimpl.UploadPatentimpl;

@WebServlet("/SchoolCheckPatent")
public class SchoolCheckPatent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String patentid = req.getParameter("patentid");
		String sign = req.getParameter("sign");
		UploadPatentdao up = new UploadPatentimpl();
		if (sign != null && patentid != null && !"".equals(sign) && !"".equals(patentid)) {
			int count = up.updatePatentChecksign(patentid, sign);
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
