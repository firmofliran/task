package com.student.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
import pojo.Paper;
import pojo.Student;

@WebServlet("/StuGetPaper")
public class StuGetPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	/**
	 * 学生进去上传论文是获取所有学生上传的论文
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Uploadinfo up = new UploadInfoimpl();
		Student stu = (Student) req.getSession().getAttribute("student");
		if (stu != null) {
			String sno = stu.getSno();
			List<Paper> allPaper = up.selectAllPaperBySno(sno);
			if (allPaper != null && allPaper.size() > 0) {
				req.setAttribute("allPaper", allPaper);
				req.setAttribute("flag", "noblank");
				req.getRequestDispatcher("/studentinfo/publishpaper.jsp").forward(req, resp);
			} else {
				req.setAttribute("flag", "blank");
				req.getRequestDispatcher("/studentinfo/publishpaper.jsp").forward(req, resp);
			}
		}else{
			resp.sendRedirect("shou.jsp");
		}
	}

}
