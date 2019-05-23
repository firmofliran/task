package com.manager.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;

import dao.ExchangeFiledao;
import daoimpl.ExchangeFileimpl;
import pojo.DepartSchoolFile;
import pojo.Manager;

@WebServlet("/DepartToSchool")
public class DepartToSchool extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		/*String allschoolinfo = req.getParameter("sign");
		*//**
		 * 搜索所有的校方的信息
		 *//*
		if("schoolinfo".equals(allschoolinfo)){
			ExchangeFiledao ef = new ExchangeFileimpl();
			Manager manager = (Manager) req.getSession().getAttribute("manager");
			String department = manager.getDepartment();
			List<DepartSchoolFile> selectInfoByDepartment = ef.selectInfoByDepartment(department);
			JSONArray arry = new JSONArray(selectInfoByDepartment);
			resp.getWriter().println(arry);
			System.out.println(arry);
		}*/
		/**
		 * 搜索校方发给该院系的所有的消息
		 */
		ExchangeFiledao ef = new ExchangeFileimpl();
		Manager manager = (Manager) req.getSession().getAttribute("manager");
		if(manager != null){
			String department = manager.getDepartment();
			List<DepartSchoolFile> list = ef.selectInfoByDepartment(department);
			JSONArray arry = new JSONArray(list);
			System.out.println(arry);
			resp.getWriter().println(arry);
			return;
		}else{
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * 学院发送文件到校方
		 */
		Manager manager = (Manager) req.getSession().getAttribute("manager");
		if(manager == null){
			req.getRequestDispatcher("manager/manager.jsp").forward(req, resp);
			return;
		}
		// 创建工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//// 进行解析
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		if (!ServletFileUpload.isMultipartContent(req)) // 判断是不是上传文件的请求
			return;
		List list = null;
		// 提示信息
		String message = "";
		Map<String, String> map = new HashMap<>();

		try {
			list = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			FileItem item = (FileItem) iterator.next();
			if (item.isFormField()) {// 是否是普通表单项
				String fieldname = item.getFieldName();
				String fieldvalue = item.getString("utf-8");
				System.out.println((new StringBuilder(String.valueOf(fieldname))).append(fieldvalue).toString());
				map.put(fieldname, fieldvalue);
			} else {
				// 得到文件名
				String filefield = item.getFieldName();
				String filename = item.getName();
				System.out.println(filename);

				if (filename == null || filename.equals("")) {
					System.out.println("文件不能为空");
					req.setAttribute("message", "文件不能为空");
					req.getRequestDispatcher("manager/manager.jsp").forward(req, resp);
				return;
					//continue;
				}
				String fileExt = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
				String prefix = filename.substring(0, filename.lastIndexOf("."));

				// 给上传的新文件用当前时间重新取个名字
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				filename = prefix + "-" + df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;// 扩展名比如.jpg
				// 获取文件流
				InputStream in = item.getInputStream();
				// 得到上传的绝对路径，
				// String savepath =
				// getServletContext().getRealPath("/uploadimages");
				// File file = new File(savepath);
				File file = new File("/allupload/departschool");
				if (!file.exists() && !file.isDirectory()) {
					System.out.println("目录不存在");
					file.mkdirs();
				}

				// FileOutputStream out = new FileOutputStream(
				// (new
				// StringBuilder(String.valueOf(savepath))).append("\\").append(imagename).toString());
				FileOutputStream out = new FileOutputStream(file + "\\" + filename);

				byte buff[] = new byte[1024];
				for (int count = 0; (count = in.read(buff)) != -1;) {
					out.write(buff, 0, count);
				}
				System.out.println("图片上传成功");
				map.put(filefield, filename);
				in.close();
				out.close();
			}
		}
		Iterator<String> it = map.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = map.get(key);
			
			if ("".equals(value)) {
				message = "文本框的值不能为空";
				req.setAttribute("message", message);
				req.getRequestDispatcher("manager/manager.jsp").forward(req, resp);
				return;
			} else {
				// 将上传的信息插入到数据库
				ExchangeFiledao up = new ExchangeFileimpl();
				int count = up.insertFile(map.get("title"), map.get("content"), map.get("sendpeople"),
						map.get("acceptpeople"), map.get("filename"));
				if (count > 0) {
					message = "发送成功";
					req.setAttribute("message", message);
				} else {
					req.setAttribute("message", "发送失败");
				}
				req.getRequestDispatcher("manager/manager.jsp").forward(req, resp);
				return;
			}
		}
	}

}
