package com.manager.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import dao.UploadPatentdao;
import daoimpl.UploadPatentimpl;
import pojo.Manager;
import pojo.Patent;
@WebServlet("/CheckPatent")
public class CheckPatent extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charst=utf-8");
		Manager manager = (Manager) req.getSession().getAttribute("manager");
		if(manager !=null){
			//检索出所有该院系的论文
			UploadPatentdao up = new UploadPatentimpl();
			List<Patent> patent = up.selectAllPatentBydepartment(manager.getDepartment());
			JSONArray arry = new JSONArray(patent);
			resp.getWriter().println(arry);
			System.out.println(arry);
			return;
		}
	}@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		//所有方传过来的论文编号可能是单个可能是多个，后期根据标志来进行分割
		String patentid = req.getParameter("paperid");
		// 审核标志
		String sign = req.getParameter("sign");
		UploadPatentdao up = new UploadPatentimpl();// 提示信息
		String flag = "";
		if (sign != null && patentid != null && !sign.equals("") && !patentid.equals("")) {
			/**
			 * 院方单个审核论文
			 */
			if (sign.equals("1") || sign.equals("2")) {
				int count = up.updatePatentChecksign(patentid, sign);
				if (count > 0) {
					System.out.println("审核通过" + sign);
					flag = "{\"flag\":\"success\"}";
					resp.getWriter().println(flag);
				} else {
					System.out.println("审核出现异常" + sign);
					flag = "{\"flag\":\"error\"}";
					resp.getWriter().println(flag);
				}
				/**
				 * 上传校方批量审核
				 */
			} else if (sign.equals("3")) {
				String[] patentArry = patentid.split(",");
				int allNum = 0;
				for (String singlePatentid : patentArry) {
					int count = up.updatePatentChecksign(singlePatentid, sign);
					if (count > 0) {
						allNum++;
					}
				}
				// 符合则所有的都上传給校方成功反之则失败,但是还是会有部分插入，待解决
				if (allNum == patentArry.length) {
					flag = "{\"flag\":\"allsuccess\"}";
				} else {
					flag = "{\"flag\":\"parterror\"}";
				}
				resp.getWriter().println(flag);
			}

		}else{
			return;
		}
	}

}
