package com.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.Logindao;
import dao.Publish;
import dao.Uploadinfo;
import daoimpl.Loginimpl;
import daoimpl.Publishimpl;
import daoimpl.UploadInfoimpl;
import pojo.PublishCompetition;
import pojo.Student;
import pojo.UploadInfopojo;
@WebServlet("/StuOperate")
public class StuOperate extends HttpServlet{
	private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setCharacterEncoding("utf-8");
	String pid = req.getParameter("pid");
	Student stu = (Student) req.getSession().getAttribute("student");
	if(stu == null)
		return;
	String sno = stu.getSno();
	Publish pu = new Publishimpl();
	PublishCompetition publishByPid = pu.selPublishByPid(pid);
	if(publishByPid==null){
		String str = "{\"flag\":\"publishnull\"}";
		resp.getWriter().println(str);
		return;
	}
	Uploadinfo up = new UploadInfoimpl();
	UploadInfopojo uploadInfo = up.selectUploadInfo(sno, pid);
	if(uploadInfo==null){
		String str = "{\"flag\":\"uploadinfonull\"}";
		resp.getWriter().println(str);
		return;
	}
	String sign = uploadInfo.getSign();
	JSONObject json = new JSONObject(uploadInfo);
	System.out.println(json);
	
	if("5".equals(sign)){
		json.put("flag", "checksign5");
	}else if("4".equals(sign)){
		json.put("flag", "checksign4");
	}else if("3".equals(sign)){
		json.put("flag", "checksign3");
	}else if("2".equals(sign)){
		json.put("flag", "checksign2");
	}else if("1".equals(sign)){
		json.put("flag", "checksign1");
	}
	resp.getWriter().println(json);
}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String oldpassword = req.getParameter("oldpassword").trim();
		String newpassword = req.getParameter("newpassword").trim();
		HttpSession session = req.getSession();
		Student stu = (Student)session.getAttribute("student");
		if(stu==null){
			System.out.println("session中消息丢失");
			return;
		}
		//Student stu=(Student)stu1;
		//session里面的密码是否与输入的旧密码相同
		if(!stu.getPassward().equals(oldpassword)){
			String str = "{\"flag\":\"error\"}";
			resp.getWriter().print(str);
		}else{
			String sno = stu.getSno();
			Logindao updatepass = new Loginimpl();
			int count = updatepass.updatePassword(newpassword, sno);
			if(count>0){
			String str = "{\"flag\":\"success\"}";
			session.invalidate();
			resp.getWriter().println(str);
			}
		}
	}

}
