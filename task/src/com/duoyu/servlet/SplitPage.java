package com.duoyu.servlet;

import dao.SelectRank;
import daoimpl.AllRankimpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import pojo.Splitentity;
import pojo.Student;
import pojo.StudentRank;

@WebServlet("/SplitPage")
public class SplitPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		SelectRank sr = new AllRankimpl();
		//总条数必须先设置，设置才能自动计算出总页数
		int totalnum = sr.selectTotalnum();
		String cpage = req.getParameter("currentpage");
		String pagenum = req.getParameter("pagesize");
		if (cpage == null){
			cpage = "1";
		}
		int currentpage = Integer.parseInt(cpage);
		//默认一页显示五条记录
		if(pagenum==null){
			  pagenum = "5";
		}
			//显示前台传来的自定义页面显示几条记录
		int pagesize=Integer.parseInt(pagenum);
		//分页查询时的几条数据
		List<Student> listsplitpage = sr.selectSplitPage(currentpage, pagesize);
		//将所有排名信息里面有名次的和当前分页查看的信息比对，符合的筛选出来
		List<Student> finallylist = new ArrayList<>();
		//排序过后的所有学生信息
		List<Student> all = sr.selectRank();
		for (Student stu : listsplitpage) {
			for (Student studentRank : all) {
				if(stu.getSno().equals(studentRank.getSno())){
					finallylist.add(studentRank);
				}
		}
		}
		Splitentity splitentity = new Splitentity();
		splitentity.setTotalnum(totalnum);
		splitentity.setPagesize(pagesize);
		splitentity.setCurrentpage(currentpage);
		splitentity.setListsplitpage(finallylist);
		req.setAttribute("splitentity", splitentity);
		req.getRequestDispatcher("/studentrank1.jsp").forward(req, resp);
	}
}