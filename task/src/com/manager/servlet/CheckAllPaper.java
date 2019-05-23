package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Uploadinfo;
import daoimpl.UploadInfoimpl;
/**
 * 院方审核论文在此处
 * @author Asus
 *
 */
@WebServlet("/CheckAllPaper")
public class CheckAllPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		//所有方传过来的论文编号可能是单个可能是多个，后期根据标志来进行分割
		String paperid = req.getParameter("paperid");
		// 审核标志
		String sign = req.getParameter("sign");
		Uploadinfo up = new UploadInfoimpl();
		// 提示信息
		String flag = "";
		if (sign != null && paperid != null && !sign.equals("") && !paperid.equals("")) {
			/**
			 * 院方单个审核论文
			 */
			if (sign.equals("1") || sign.equals("2")) {
				int count = up.updatePaperSign(sign, paperid);
				if (count > 0) {
					flag = "{\"flag\":\"success\"}";
					resp.getWriter().println(flag);
				} else {
					flag = "{\"flag\":\"error\"}";
					resp.getWriter().println(flag);
				}
				/**
				 * 院方批量审核給校方
				 */
			} else if (sign.equals("3")) {
				String[] paperArry = paperid.split(",");
				int allNum = 0;
				for (String singlePaperid : paperArry) {
					int count = up.updatePaperSign(sign, singlePaperid);
					if (count > 0) {
						allNum++;
					}
				}
				// 符合则所有的都上传給校方成功反之则失败,但是还是会有部分插入，待解决
				if (allNum == paperArry.length) {
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
