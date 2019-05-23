package com.servlet;

import dao.Publish;
import daoimpl.Publishimpl;
import utils.UploadTool;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * 校方发布比赛信息
 * @author Asus
 *
 */
@WebServlet("/publish")
public class PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		int filesizemax = 1024 * 1024 * 10;
		String filelocation = "/allupload/publishimg";
		String allExt = "gif,jpg,jpeg,png,bmp";
		Map<String, String> map = UploadTool.uploadTool(req, allExt, filesizemax, filelocation);
		Iterator<String> it = map.keySet().iterator();
		String message = "";
		while (it.hasNext()) {
			String key = it.next();
			String value = map.get(key);
			if ("".equals(value)) {
				System.out.println("文本框中的值为空");
				message = "文本框中的值为空";
				req.setAttribute("message", message);
				req.getRequestDispatcher("/superjsp/addinfo.jsp").forward(req, resp);
				return;
			}
		}
		int score = 0;
		try {
			score = Integer.parseInt(map.get("score").trim());

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("必须填数字");
			message = "积分必须填写数字";
			req.setAttribute("message", message);
			req.getRequestDispatcher("/superjsp/addinfo.jsp").forward(req, resp);
			return;
		}
		if (map.containsKey("success")) {
			// 插入数据库
			Publish p = new Publishimpl();
			int count = p.add(map.get("pid"), map.get("pname"), map.get("grade"), map.get("category"),
					map.get("xdepartment"), map.get("publishtime"), map.get("competitionplace"), score,
					map.get("content"),map.get("filename"));
			if (count > 0) {
				message = "发布信息成功";
				req.getSession().setAttribute("message", message);
				resp.sendRedirect(req.getContextPath() + "/superjsp/addinfo.jsp");
				System.out.println("发布信息成功");
				return;
			} else {
				message = "插入数据库失败";
			}
		} else {
			if (map.containsKey("bigsize")) {
				message = map.get("bigsize");
			} else if (map.containsKey("blanksize")) {
				message = map.get("blanksize");
			} else if (map.containsKey("exterror")) {
				message = map.get("exterror");
			}
			System.out.println(message);
			req.setAttribute("message", message);
			req.getRequestDispatcher("/superjsp/addinfo.jsp").forward(req, resp);
			return;
		}
		/*
		 * String pid = req.getParameter("pid").trim(); String pname =
		 * req.getParameter("pname").trim(); String category =
		 * req.getParameter("category").trim(); String grade =
		 * req.getParameter("grade"); String xdepartment =
		 * req.getParameter("xdepartment").trim(); String publishtime =
		 * req.getParameter("publishtime").trim(); String competitionplace =
		 * req.getParameter("competitionplace").trim(); int score = 0; String
		 * str = ""; try { score =
		 * Integer.parseInt(req.getParameter("score").trim());
		 * 
		 * } catch (Exception e) { e.printStackTrace();
		 * System.out.println("必须填数字"); str = "积分必须填写数字";
		 * req.setAttribute("flag", str);
		 * req.getRequestDispatcher("/superjsp/addinfo.jsp").forward(req, resp);
		 * return; } String content = req.getParameter("content");
		 * 
		 * if (pid != null && pname != null && grade != null && category != null
		 * && xdepartment != null && publishtime != null && competitionplace !=
		 * null && content != null) { if (!pid.equals("") && !pname.equals("")
		 * && !grade.equals("") && !category.equals("") &&
		 * !xdepartment.equals("") && !publishtime.equals("") &&
		 * !competitionplace.equals("") && !content.equals("")) { Publish p =
		 * new Publishimpl(); int count = p.add(pid, pname, grade, category,
		 * xdepartment, publishtime, competitionplace, score, content); if
		 * (count > 0) { str = "发布信息成功"; req.getSession().setAttribute("flag",
		 * str);
		 * resp.sendRedirect(req.getContextPath()+"/superjsp/addinfo.jsp");
		 * System.out.println("发布信息成功"); return; } else { str = "发布信息失败";
		 * 
		 * } } else { str = "所有内容不能为空";
		 * 
		 * } } else { str = "所有字段必须填写"; } // 都会执行 req.setAttribute("flag", str);
		 * req.getRequestDispatcher("/superjsp/addinfo.jsp").forward(req, resp);
		 * return; }
		 */
	}

}