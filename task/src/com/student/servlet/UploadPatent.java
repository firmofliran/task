package com.student.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UploadPatentdao;
import daoimpl.UploadPatentimpl;
import pojo.Patent;
import pojo.Student;
import utils.UploadTool;

/**
 * 学生上传专利
 * 
 * @author Asus
 *
 */
@WebServlet("/UploadPatent")
public class UploadPatent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 更改专利历史记录的标志由0变为1
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String sign = req.getParameter("sign");

		String patentid = req.getParameter("patentid");
		if (sign != null && patentid != null && !sign.equals("") && !patentid.equals("")) {
			if (sign.equals("1")) {
				UploadPatentdao up = new UploadPatentimpl();
				int count = up.updateHistorysign(patentid);
				String str = "";
				if (count > 0) {
					str = "{\"flag\":\"success\"}";
				} else {
					str = "{\"flag\":\"error\"}";
				}
				resp.getWriter().println(str);
			}
		}

	}

	/**
	 * 上传专利
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String allExt = "pdf";
		int filesizemax = 1024 * 1024 * 10;
		String filelocation = "/allupload/uploadpatent";
		String str = "";
		// 获取表单和文件信息
		Map<String, String> maptool = UploadTool.uploadTool(req, allExt, filesizemax, filelocation);
		Iterator<String> it = maptool.keySet().iterator();
		while (it.hasNext()){
			String key = it.next();
			String value = maptool.get(key);
			if (value.equals("")) {
				// 文本框中的值没有填写
				str = "文本框中的值没有填写";
				req.setAttribute("flag1", str);
				System.out.println("文本框中的值没有填写");
				req.getRequestDispatcher("/StuGetPatent").forward(req, resp);
				return;
			}
		}
		if (maptool.containsKey("success")) {
			// 上传文件成功且文本框中的值不为空
			HttpSession session = req.getSession();
			Student stu = (Student) session.getAttribute("student");
			// session中没有学生信息，说明没有登陆
			if (stu != null) {
				String sno = stu.getSno();
				String sclass = stu.getSclass();
				String department = stu.getDepartment();
				Patent pa = new Patent(maptool.get("patentid"), sno, maptool.get("title"), maptool.get("keyword"),
						maptool.get("summary"), maptool.get("author"), sclass, department, maptool.get("grade"),
						maptool.get("bankcard"), maptool.get("telephone"), maptool.get("patentimg"), "0", "0");
				UploadPatentdao upa = new UploadPatentimpl();
				int count = upa.insertPatent(pa);
				if (count > 0) {
					str = "上传专利成功";
					session.setAttribute("flag1", str);
					System.out.println("上传并插入到数据库中成功");
					resp.sendRedirect(req.getContextPath() + "/StuGetPatent");
					return;
				} else {
					str = "上传失败";
					req.setAttribute("flag1", str);
					req.getRequestDispatcher("/StuGetPatent").forward(req, resp);
					return;
				}

			} else {
				/**
				 * 连接超时
				 */
				req.getRequestDispatcher("/StuGetPatent").forward(req, resp);
				return;
			}

		} else {
			// 上传文件失败
			if (maptool.containsKey("bigsize")) {
				str = maptool.get("bigsize");
			} else if (maptool.containsKey("blanksize")) {
				str = maptool.get("blanksize");
			} else if (maptool.containsKey("exterror")) {
				str = maptool.get("exterror");
			}
			System.out.println(str);
			req.setAttribute("flag1", str);
			req.getRequestDispatcher("/StuGetPatent").forward(req, resp);
			return;
		}
	}

}
