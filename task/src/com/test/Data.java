package com.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.Publish;
import dao.StudentJoin;
import dao.UploadPatentdao;
import dao.Uploadinfo;
import daoimpl.Publishimpl;
import daoimpl.StudentJoinimpl;
import daoimpl.UploadInfoimpl;
import daoimpl.UploadPatentimpl;
import pojo.Paper;
import pojo.Patent;
import pojo.PublishCompetition;
import pojo.StudentJoinpojo;

@WebServlet("/Datashow")
public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String sign = req.getParameter("sign");
		String category = req.getParameter("category");
		Map<String, String> newmap = new HashMap<>();
		JSONObject obj = null;
		if ("allarticle".equals(sign)) {
			Uploadinfo up = new UploadInfoimpl();
			List<Paper> allPaper = up.selectAllPaper();
			UploadPatentdao uppatent = new UploadPatentimpl();
			List<Patent> allPatent = uppatent.selectAllPatent();
			int sizepaper = allPaper.size();
			int sizepatent = allPatent.size();
			newmap.put("论文", String.valueOf(sizepaper));
			newmap.put("专利", String.valueOf(sizepatent));

		} else if ("prizeinfo".equals(sign)) {
			Publish pu = new Publishimpl();
			List<PublishCompetition> publish = pu.selectAllPublish("学科竞赛"); 
			publish.addAll(pu.selectAllPublish("科研立项"));
			for (PublishCompetition publishCompetition : publish) {
				String pid = publishCompetition.getPid();
				// 根据一个id搜索一个比赛
				PublishCompetition pname = pu.selPublishByPid(pid);
				StudentJoin stu = new StudentJoinimpl();
				Map<String, StudentJoinpojo> map = stu.selectJoinpid(pid);
				int size = map.size();
				newmap.put(pname.getPname(), String.valueOf(size));

				// JSONArray arry = new JSONArray(map);
			}
		}
		obj = new JSONObject(newmap);
		System.out.println(obj);
		resp.getWriter().println(obj);

	}
}
