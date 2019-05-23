package com.student.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Logindao;
import dao.Publish;
import dao.SelectRank;
import daoimpl.AllRankimpl;
import daoimpl.Loginimpl;
import daoimpl.Publishimpl;
import pojo.PublishCompetition;
import pojo.Student;
@WebServlet("/StuAllInfo")
public class StuAllInfo extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		Logindao ld = new Loginimpl();
		Student stu = (Student) req.getSession().getAttribute("student");
		if(stu == null)
			return;
		String sno =stu.getSno();
		Student student = ld.select(sno);
		//搜索所有学生排名信息
		SelectRank sr = new AllRankimpl();
		List<Student> listrank = sr.selectRank();
		for (Student stuRank : listrank) {
			if(stuRank.getSno().equals(sno)){
				student.setSturank(stuRank.getSturank());
				break;
			}
		}
		Publish pu = new Publishimpl();
		//搜索所有学科竞赛类的所有比赛
		List<PublishCompetition> allPublish = pu.selectAllPublish("学科竞赛");
		req.setAttribute("student", student);
		req.setAttribute("allPublish", allPublish);
		req.getRequestDispatcher("/student.jsp").forward(req, resp);
		
	}

}
