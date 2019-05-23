package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
import pojo.UploadInfopojo;
@WebServlet("/SuperCheckimage")
public class SuperCheckimage extends HttpServlet{
	private static final long serialVersionUID = 1L;
	/**
	 * 高校获取院系端上传的学生获奖的信息
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		Uploadinfo up = new UploadInfoimpl();
		//将所有学院，所有学生上传获奖的的信息
		List<UploadInfopojo> listallupload = up.selectAllDepartUpload();
		List<UploadInfopojo> list = new ArrayList<>();
		if (listallupload != null &&!listallupload.isEmpty()) {
			//将标志位为3的所有要审核的上传获奖的信息遍历出来
			for (UploadInfopojo uploadInfopojo : listallupload) {
				if(uploadInfopojo.getSign().equals("3")||uploadInfopojo.getSign().equals("4")||uploadInfopojo.getSign().equals("5")){
					list.add(uploadInfopojo);
				}
			}
			req.setAttribute("list", list);
			req.getRequestDispatcher("/supermanager/schcheckprize.jsp").forward(req, resp);
		} else {
			System.out.println("数据库中没有一个学生上传信息");
		}
	}

}
