package com.manager.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
import pojo.Manager;
import pojo.Paper;

@WebServlet("/AllPaperInfoservlet")
public class AllPaperInfoservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		String sign = req.getParameter("sign");
		/**
		 * 搜索该院系所有上传的论文
		 */
		if ("1".equals(sign)) {
			Uploadinfo allpaper = new UploadInfoimpl();
			List<Paper> list = allpaper.selectAllPaper();
			//根据院系筛选该院系的所有论文
			List<Paper> newlist = new ArrayList<>();
			Manager manager = (Manager) req.getSession().getAttribute("manager");
			if(manager !=null){
				//检索出所有该院系的论文
				for (Paper paper : list) {
					if(paper.getDepartment().equals(manager.getDepartment())){
						newlist.add(paper);
					}
				}
				
			}
			req.setAttribute("list", newlist);
			req.getRequestDispatcher("/manager/checkpaper.jsp").forward(req, resp);
			return;
		} else if ("2".equals(sign)) {
			/**
			 * --------下载上传的某个论文------------
			 */
			String filename = req.getParameter("filename");
			if(filename!=null&&!"".equals(filename)){
			filename = new String(filename.getBytes("iso-8859-1"),"utf-8");
			File file = new File("f:/allupload/uploadpaper/" + filename);
			if (file.exists()) {
				resp.setHeader("Content-disposition", "attachment;filename="+URLEncoder.encode(filename, "utf-8"));
				FileInputStream in = new FileInputStream(file);
				BufferedInputStream bis = new BufferedInputStream(in);
				OutputStream out = resp.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(out);
				byte[] buff = new byte[1024];
				int len = -1;
				while((len = bis.read(buff)) != -1) {
					bos.write(buff, 0, len);	
				}
				if(bis!=null){
					bis.close();
				}
				if(bos!=null){
					bos.close();
				}
			}else{
				System.out.println("文件资源已被删除");
			}
		}
	}
	}
}
