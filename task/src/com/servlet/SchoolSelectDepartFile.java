package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import dao.ExchangeFiledao;
import daoimpl.ExchangeFileimpl;
import pojo.DepartSchoolFile;

@WebServlet("/SchoolSelectDepartFile")
public class SchoolSelectDepartFile extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String depart = req.getParameter("department");
		String department = new String(depart.getBytes("iso-8859-1"),"utf-8");
		ExchangeFiledao ef = new ExchangeFileimpl();
		List<DepartSchoolFile> selectInfoByDepartment = ef.shoolSelectByDepartment(department);
		JSONArray json = new JSONArray(selectInfoByDepartment);
		resp.getWriter().println(json);
	}
	
}
