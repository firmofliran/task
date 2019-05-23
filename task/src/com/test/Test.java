package com.test;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
import pojo.UploadInfopojo;
@WebServlet("/Test")
public class Test extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Uploadinfo up = new UploadInfoimpl();
		List<UploadInfopojo> allUpload = up.selectAllDepartUpload();
		JSONArray arry = new JSONArray(allUpload);
		System.out.println(arry);
		resp.getWriter().println(arry);
		
	}

}
