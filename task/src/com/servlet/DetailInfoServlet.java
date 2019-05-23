package com.servlet;

import dao.Publish;
import daoimpl.Publishimpl;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import pojo.PublishCompetition;

@WebServlet("/DetailInfoServlet")
public class DetailInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		//根据标志来判断是学科竞赛还是科研立项
		String sign = req.getParameter("sign");
		String projection ="";
		if (sign.equals("1")) {
			 projection = "学科竞赛";
		} else {
			 projection = "科研立项";
		}
		Publish p = new Publishimpl();
		// 搜索所有发布的信息
		List<PublishCompetition> list = p.selectAllPublish(projection);
		for (Iterator<PublishCompetition> iterator = list.iterator(); iterator.hasNext();) {// 将想查看的信息筛选出来
			PublishCompetition publishCompetition = (PublishCompetition) iterator.next();
			// 通过点击超链接传递的pid来筛选当前比赛信息
			if (publishCompetition.getPid().equals(pid)) {
				req.setAttribute("detail", publishCompetition);
				req.getRequestDispatcher("/showdetail/detail.jsp").forward(req, resp);
			}
		}

	}

}