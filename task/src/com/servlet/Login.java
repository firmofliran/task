package com.servlet;

import dao.Logindao;
import daoimpl.Loginimpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import pojo.*;

@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String sno = req.getParameter("name");
		String passward = req.getParameter("passward");
		String identify = req.getParameter("identify");
		// 学生登录
		if (!sno.equals("") && !passward.equals("")) {
			if ("xs".equals(identify)) {
				Logindao d = new Loginimpl();
				Student s = d.select(sno);
				if (s != null) {
					if (s.getPassward().equals(passward)) {
						System.out.println("学生登陆成功");
						HttpSession session = req.getSession();
						session.setAttribute("student", s);
						String strjson = "{\"flag\":\"success1\"}";
						resp.getWriter().print(strjson);
						// req.getRequestDispatcher("/student.jsp").forward(req,
						// resp);
						return;
					} else {
						// 密码错误
						String strjson = "{\"flag\":\"mmerror\"}";
						resp.getWriter().print(strjson);
						return;
					}
				} else {
					// 该学号不存在
					String strjson = "{\"flag\":\"error\"}";
					resp.getWriter().print(strjson);
					// req.getRequestDispatcher("/err.jsp").forward(req, resp);
				} // 管理员登录
			} else if ("gly".equals(identify)) {
				Logindao d = new Loginimpl();
				Manager manager = d.selectManager(sno);
				if (manager != null) {
					if (manager.getPassward().equals(passward)) {
						System.out.println("管理员登录成功");
						HttpSession session = req.getSession();
						session.setAttribute("manager", manager);
						String strjson = "{\"flag\":\"success2\"}";
						resp.getWriter().print(strjson);
						return;
					} else {
						// 密码错误
						String strjson = "{\"flag\":\"mmerror\"}";
						resp.getWriter().print(strjson);
						return;
					}
				} else {
					// 该学号不存在
					String strjson = "{\"flag\":\"error\"}";
					resp.getWriter().print(strjson);
					return;
				} // 超级管理员登陆
			} else if ("cjgly".equals(identify)) {
				Logindao d = new Loginimpl();
				SuperManager sm = d.selectSuperManager(sno);
				if (sm != null) {
					if (sm.getPassward().equals(passward)) {
						System.out.println("超级管理员登录成功");
						HttpSession session = req.getSession();
						session.setAttribute("supermanager", sm);
						String strjson = "{\"flag\":\"success3\"}";
						resp.getWriter().print(strjson);
						return;
					} else {
						// 密码错误
						String strjson = "{\"flag\":\"mmerror\"}";
						resp.getWriter().print(strjson);
						return;
					}
				} else {
					// 该学号不存在
					String strjson = "{\"flag\":\"error\"}";
					resp.getWriter().print(strjson);
					return;
				}
			} else {
				System.out.println("没有选择身份");// 这个不会出现
			}
		} else {
			String strjson = "{\"flag\":\"blank\"}";
			resp.getWriter().print(strjson);
		}
	}

}