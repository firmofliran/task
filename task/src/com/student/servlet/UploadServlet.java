package com.student.servlet;

import dao.Publish;
import dao.Uploadinfo;
import daoimpl.Publishimpl;
import daoimpl.UploadInfoimpl;
import pojo.PublishCompetition;
import pojo.Student;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	/**
	 * 表单验证，根据学生填写的比赛编号，查找数据库中是否存在此编号
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String pid = req.getParameter("pid");
		Publish pu = new Publishimpl();
		PublishCompetition pc = pu.selPublishByPid(pid);
		String flag = "";
		if(pc!=null){
			flag = "{\"flag\":\"success\"}";
			resp.getWriter().println(flag);
			return;
		}else{
			flag = "{\"flag\":\"error\"}";
			resp.getWriter().println(flag);
			return;
		}
	}
	/**
	 * 学生上传获奖信息
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
				// 创建工厂
				DiskFileItemFactory factory = new DiskFileItemFactory();
				//// 进行解析
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setHeaderEncoding("utf-8");
				if (!ServletFileUpload.isMultipartContent(req)) // 判断是不是上传文件的请求
					return;
				List list = null;
				// 提示信息
				String str = "";
				String sno = "";
				String name = "";
				String sclass = "";
				String depart = "";
				String pid = "";
				String comname = "";
				String category = "";
				String grade = "";
				String score = "";
				String imagename = "";
				String bankcard = "";
				HttpSession session = req.getSession();
				
				Student stu = (Student) session.getAttribute("student");
				if(stu!=null){
					sclass = stu.getSclass();
					depart = stu.getDepartment();
				}
				try {
					list = upload.parseRequest(req);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					FileItem item = (FileItem) iterator.next();
					if (item.isFormField()) {// 是否是普通表单项
						String filename = item.getFieldName();
						String filevalue = item.getString("utf-8");
						System.out.println((new StringBuilder(String.valueOf(filename))).append(filevalue).toString());
						if ("sno".equals(filename))
							sno = filevalue;
						else if ("name".equals(filename))
							name = filevalue;
						else if ("pid".equals(filename)){
							//根据pid获取对应积分
							pid = filevalue;
							Publish pu = new Publishimpl();
							PublishCompetition pc = pu.selPublishByPid(pid);
							score =String.valueOf(pc.getScore());
							category = pc.getCategory();
							comname = pc.getPname();
						}
						else if ("grade".equals(filename))
							grade = filevalue;
						else if ("bankcard".equals(filename))
							bankcard = filevalue;
					} else {
						// 得到文件名
						imagename = item.getName();
						System.out.println(imagename);

						if (imagename == null||imagename.equals("")) {
							System.out.println("文件不能为空");
							continue;
						}
						String fileExt = imagename.substring(imagename.lastIndexOf(".") + 1).toLowerCase();

						// 给上传的新文件用当前时间重新取个名字
						SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
						imagename = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;// 扩展名比如.jpg
						// 获取文件流
						InputStream in = item.getInputStream();
						// 得到上传的绝对路径，
						// String savepath =
						// getServletContext().getRealPath("/uploadimages");
						// File file = new File(savepath);
						File file = new File("/allupload/uploadimages");
						if (!file.exists() && !file.isDirectory()) {
							System.out.println("目录存在");
							file.mkdirs();
						}

						// FileOutputStream out = new FileOutputStream(
						// (new
						// StringBuilder(String.valueOf(savepath))).append("\\").append(imagename).toString());
						FileOutputStream out = new FileOutputStream(file + "\\" + imagename);

						byte buff[] = new byte[1024];
						for (int count = 0; (count = in.read(buff)) != -1;) {
							out.write(buff, 0, count);
						}
						System.out.println("图片上传成功");

						in.close();
						out.close();
					}
				}

				if (sno.equals("") || name.equals("") || sclass.equals("") || depart.equals("") || pid.equals("")
						|| comname.equals("") || category.equals("") || grade.equals("") || score.equals("")|| bankcard.equals("")) {
					str = "文本框中所有的值必须填写";
					req.setAttribute("flag", str);
					req.getRequestDispatcher("/studentinfo/uploadprize.jsp").forward(req, resp);
					return;
				}
				if (imagename == null||imagename.equals("") ) {
					System.out.println("文件不能为空");
					str = "文件不能为空  ";
					req.setAttribute("flag", str);
					req.getRequestDispatcher("/studentinfo/uploadprize.jsp").forward(req, resp);
					return;
				}
				// 将上传的信息插入到数据库
				Uploadinfo up = new UploadInfoimpl();
				int count = up.insertUploadInfo(sno, name, sclass, depart, pid, comname, category, grade, score,
						imagename,bankcard);
				if (count > 0) {
					str = "上传成功";
					req.getSession().setAttribute("uploadflag", str);

					resp.sendRedirect(req.getContextPath() + "/studentinfo/uploadprize.jsp");
					return;
				} else {
					req.setAttribute("flag", "上传失败");
					req.getRequestDispatcher("/studentinfo/uploadprize.jsp").forward(req, resp);
					return;
				}
			}
		
			
	}
