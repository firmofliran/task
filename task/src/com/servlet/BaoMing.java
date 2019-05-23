package com.servlet;

import dao.StudentJoin;
import daoimpl.StudentJoinimpl;
import java.io.*;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import pojo.Student;
import pojo.StudentJoinpojo;

@WebServlet("/baoming")
public class BaoMing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
//		resp.setCharacterEncoding("utf-8");
//		resp.setContentType("text/html;charset=utf-8");
//		String pid = req.getParameter("pid").trim();
//		StudentJoin sj = new StudentJoinimpl();
//		// 在数据库报名表中根据pid检索出一条报名信息
//		Map<String, StudentJoinpojo> mapstu = sj.selectJoinpid(pid);
//		Student stu = (Student) req.getSession().getAttribute("student");
//		String sno = "";
//		if (stu == null) {
//			System.out.println("session里面的用户信息不存在");
//			String s = "{\"flag\":\"loser\"}";
//			resp.getWriter().print(s);
//			System.out.println("session里面的信息丢失");
//			return;
//		} else {
//			// 取出存在session中学生的学号
//			sno = stu.getSno();
//		}
//		if (mapstu != null) {
//			// 根据session中学生的学号在数据库中的报名表中进行检索是否存在相对应的报名信息
//			StudentJoinpojo stujp = (StudentJoinpojo) mapstu.get(sno);
//			if (stujp != null) {
//				String s = "{\"flag\":true}";
//				resp.getWriter().print(s);
//			} else {
//				String s = "{\"flag\":false}";
//				resp.getWriter().print(s);
//			}
//		}
	}

	// 将报名信息插入到数据库中
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String sno = req.getParameter("sno").trim();
		String name = req.getParameter("name").trim();
		String stuclass = "";
		String department ="";
		String pid = req.getParameter("pid").trim();

		StudentJoin sj = new StudentJoinimpl();
		// 在数据库报名表中根据pid检索出该项目的所有学生报名信息
		Map<String, StudentJoinpojo> mapstu = sj.selectJoinpid(pid);
		Student stu = (Student) req.getSession().getAttribute("student");
		String sessionsno = "";
		if (stu == null) {
			System.out.println("session里面的用户信息不存在");
			String s = "{\"flag\":\"failed\"}";
			resp.getWriter().print(s);
			System.out.println("session里面的信息丢失");
			return;
		} else {
			// 取出存在session中学生的学号
			sessionsno = stu.getSno();
			stuclass = stu.getSclass();
			department = stu.getDepartment();
		}
		if (mapstu != null) {
			// 根据session中学生的学号在数据库中的报名表中进行检索是否存在相对应的报名信息
			StudentJoinpojo stujp = (StudentJoinpojo) mapstu.get(sessionsno);
			if (stujp != null) {
				// 已经报过名
				String s = "{\"flag\":false}";
				resp.getWriter().print(s);
				return;
			} else {
				// 没有报过名
				// 将报名信息插入到数据库中
				StudentJoin stujoin = new StudentJoinimpl();
				int count = stujoin.insertJoininfo(sno, name, stuclass, department, pid,"未分配");
				if (count > 0) {
					System.out.println("报名成功");
					// req.getSession().setAttribute("flag", "报名成功");
					String s = "{\"flag\":true}";
					resp.getWriter().print(s);
					// resp.sendRedirect((new
					// StringBuilder(String.valueOf(req.getContextPath())))
					// .append("/DetailInfoServlet?pid=").append(pid).toString());
					return;
				} else {
					System.out.println("报名失败，插入数据库失败");
					return;
				}

			}
		}

	}

}