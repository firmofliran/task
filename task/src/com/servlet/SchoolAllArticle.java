package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import dao.UploadPatentdao;
import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
import daoimpl.UploadPatentimpl;
import pojo.Manager;
import pojo.Paper;
import pojo.Patent;
@WebServlet("/SchoolAllArticle")
public class SchoolAllArticle extends HttpServlet{
	private static final long serialVersionUID = 1L;
/**
 * 搜索论文和专利
 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String sign = req.getParameter("sign");
		if(sign!=null && !sign.equals("")){
			/**
			 * 检索出所有上传的论文跳转到校方
			 */
		
			if(sign.equals("allpaper")){
				Uploadinfo up = new UploadInfoimpl();
				List<Paper> allPaper = up.selectAllPaper();
				List<Manager> allDepartment = up.selectAllDepartment();
				//将审核标志位为3，4，5的所有要审核的上传论文的信息遍历出来
				List<Paper> passPaper = new ArrayList<>();
				if (!allPaper.isEmpty()) {
					for (Paper Paper : allPaper) {
						if(Paper.getChecksign().equals("3")||Paper.getChecksign().equals("4")||Paper.getChecksign().equals("5")){
							passPaper.add(Paper);
						}
					}
				}
				req.setAttribute("allDepartment", allDepartment);
				req.setAttribute("passPaper", passPaper);
				req.getRequestDispatcher("supermanager/checkarticle.jsp").forward(req, resp);
			}else if(sign.equals("paper")){
				/**
				 * 根据学院搜索某个学院上传的所有的论文
				 */
				String oldpart = req.getParameter("department");
				if(oldpart ==null){
					return;
				}
				String department = new String(oldpart.getBytes("iso-8859-1"),"utf-8");
				Uploadinfo up = new UploadInfoimpl();
				List<Paper> allPaperByDepartment = up.selectAllPaperByDepartment(department);
				List<Paper> allPaper = new ArrayList<>();
				if ( !allPaperByDepartment.isEmpty()) {
					for (Paper paper : allPaperByDepartment) {
						if(paper.getChecksign().equals("3")||paper.getChecksign().equals("4")||paper.getChecksign().equals("5")){
							allPaper.add(paper);
						}
					}
				}
					JSONArray json = new JSONArray(allPaper);
					System.out.println(json);
					resp.getWriter().println(json);
			}else if(sign.equals("allpatent")){
				UploadPatentdao up = new UploadPatentimpl();
			    List<Patent> selectAllPatent = up.selectAllPatent();
				List<Patent> allPatent = new ArrayList<>();
				if (!selectAllPatent.isEmpty()) {
					for (Patent patent : selectAllPatent) {
						if(patent.getChecksign().equals("3")||patent.getChecksign().equals("4")||patent.getChecksign().equals("5")){
							allPatent.add(patent);
						}
					}
				}
				JSONArray arry = new JSONArray(allPatent);
				System.out.println(arry);
				resp.getWriter().println(arry);
			}else if("patent".equals(sign)){
				/**
				 * 根据学院搜索某个学院上传的所有的专利
				 */				String oldpart = req.getParameter("department");
				String department = new String(oldpart.getBytes("iso-8859-1"),"utf-8");
				UploadPatentdao up = new UploadPatentimpl();
				List<Patent> allPaperByDepartment = up.selectAllPatentBydepartment(department);
				List<Patent> allPatent = new ArrayList<>();
				if (!allPaperByDepartment.isEmpty()) {
					for (Patent patent : allPaperByDepartment) {
						if(patent.getChecksign().equals("3")||patent.getChecksign().equals("4")||patent.getChecksign().equals("5")){
							allPatent.add(patent);
						}
					}
				}
					JSONArray json = new JSONArray(allPatent);
					System.out.println(json);
					resp.getWriter().println(json);
			}else{
				return;
			}
		}
	}

}
