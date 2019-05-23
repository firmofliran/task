package com.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownloadExchangeFile")
public class DownloadExchangeFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * --------下载校方或者院系发送过来文件------------
		 */
		String filename = req.getParameter("filename").trim();
		if (filename != null && !"".equals(filename)) {
			filename = new String(filename.getBytes("iso-8859-1"), "utf-8");
			File file = new File("/allupload/departschool/" + filename);
			if (file.exists()) {
				resp.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "utf-8"));
				FileInputStream in = new FileInputStream(file);
				BufferedInputStream bis = new BufferedInputStream(in);
				OutputStream out = resp.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(out);
				byte[] buff = new byte[1024];
				int len = -1;
				while ((len = bis.read(buff)) != -1) {
					bos.write(buff, 0, len);
				}
				if (bis != null) {
					bis.close();
				}
				if (bos != null) {
					bos.close();
				}
			} else {
				System.out.println("文件资源已被删除");
				String str = "文件资源已被删除";
				req.setAttribute("deletesign", "filedelete");
				req.getRequestDispatcher("/manager/manager.jsp").forward(req, resp);
			}
		}
	}

}
