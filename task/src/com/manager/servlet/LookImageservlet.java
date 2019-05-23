
package com.manager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Logindao;
import dao.Uploadinfo;
import daoimpl.Loginimpl;
import daoimpl.UploadInfoimpl;
import pojo.Student;
import pojo.UploadInfopojo;

/**
 * 院系和高校方审核学生获奖信息都在此处处理
 * 
 * @author Asus
 *
 */
@WebServlet("/LookImageservlet")
public class LookImageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 根据院方，校方处理不同来进行标志的不同转变和信息筛选
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String sign = req.getParameter("sign");
		if (sign != null && !"".equals(sign)) {

			// 等于1就是院系审核未通过
			if (sign.equals("1") || sign.equals("4")) {
				String sno = req.getParameter("sno");
				String pid = req.getParameter("pid");
				if (pid == null || "".equals(pid)) {
					return;
				}
				Uploadinfo up = new UploadInfoimpl();
				int count = up.updateSign(sign, sno, pid);
				if (count > 0) {
					String strjson = "{\"flag\":\"false\"}";
					resp.getWriter().print(strjson);
				}
			} // 等于2就是院系审核通过，等于5就是校方审核通过
			else if (sign.equals("2") || sign.equals("5")) {
				String sno = req.getParameter("sno");
				String pid = req.getParameter("pid");
				Uploadinfo up = new UploadInfoimpl();
				if (pid == null || "".equals(pid)) {
					return;
				}
				if (sign.equals("5")) {
					UploadInfopojo uppojo = up.selectUploadInfo(sno, pid);
					// 将校方审核通过的学生-----自己填写获奖信息中的比赛积分(自己填写的可能有误后期要验证,还未验证)-----取出来
					int score = Integer.parseInt(uppojo.getScore());
					// 再取出学生表里面的总积分
					Logindao stu = new Loginimpl();
					// 通过学生提交获奖信息中的--学号--查找数据库中学生表中是否有对应此学号的学生
					Student s = stu.select(sno);
					if (s == null) {
						System.out.println("学生表中不存在此学生的学号,不会加分");
						String strjson = "{\"flag\":\"blank\"}";
						resp.getWriter().print(strjson);
						return;
					} else {
						// 获取学生已有的分
						int stutotalscore = s.getScore();
						// 将校方审核通过---学生自己填写的积分---加到学生表总积分中
						int totalscore = score + stutotalscore;
						int count = stu.updateTatolScore(totalscore, sno);
						if (count > 0) {
							System.out.println("加分成功");
						} else {
							System.out.println("加分失败");
							return;
						}
					}
				}
				// 修改标志位
				int count = up.updateSign(sign, sno, pid);
				if (count > 0) {
					String strjson = "{\"flag\":\"success\"}";
					resp.getWriter().print(strjson);
				}
			}

			// 等三就是上传给校方
			else if (sign.equals("3")) {
				String snopid = req.getParameter("snopid");
				// System.out.println(snopid);
				if (snopid == null || "".equals(snopid)) {
					return;
				}
				String[] single = snopid.split(",");
				System.out.println("一共有" + single.length + "个学生上传校方");
				String strjson = "";
				int count = 0;
				for (int i = 0; i < single.length; i++) {
					String[] split = single[i].split("-");
					String sno = split[0];
					String pid = split[1];
					System.out.println("---sno---" + sno + "  -pid---" + pid);
					Uploadinfo up = new UploadInfoimpl();
					int num = up.updateSign(sign, sno, pid);
					if (num > 0) {

						count++;
					}
				}
				if (count == single.length) {
					strjson = "{\"flag\":\"success1\"}";
					resp.getWriter().print(strjson);
					return;
				}
			} else {
				return;
			}
		}
	}
}
