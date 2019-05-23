
package com.manager.servlet;

import dao.Publish;
import dao.StudentJoin;
import dao.Uploadinfo;
import daoimpl.Publishimpl;
import daoimpl.StudentJoinimpl;
import daoimpl.UploadInfoimpl;
import pojo.Manager;
import pojo.PublishCompetition;
import pojo.StudentJoinpojo;
import pojo.Teacher;
import pojo.UploadInfopojo;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/MaupLoadservlet")
public class MaupLoadservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		resp.setContentType("text/html;charset=utf-8");
		String sign = req.getParameter("sign");
		if (sign != null) {
			/**
			 * sign为1就是将所有类型的比赛信息检索出来,
			 */
			if (sign.equals("1")) {
				Publish publish = new Publishimpl();
				List<PublishCompetition> listxk = publish.selectAllPublish("学科竞赛");
				List<PublishCompetition> listky = publish.selectAllPublish("科研立项");
				req.setAttribute("listxk", listxk);
				req.setAttribute("listky", listky);
				req.getRequestDispatcher("/manager/allocateguider.jsp").forward(req, resp);
			} else if (sign.equals("2")) {
				/**
				 * sign等于2就是院系端审核报名学生并将参加某个比赛的学生分配指导老师
				 */
				String pid = req.getParameter("pid");
				StudentJoin sj = new StudentJoinimpl();
				Map<String, StudentJoinpojo> map = sj.selectJoinpid(pid);
				// 讲一个比赛筛选出来，然后再根据学院筛选出来放到一个map里
				Iterator<String> it = map.keySet().iterator();
				Map<String, StudentJoinpojo> newmap = new HashMap<>();
				HttpSession session = req.getSession();
				Manager manager = (Manager) session.getAttribute("manager");
				String department = manager.getDepartment();
				while (it.hasNext()) {
					String key = it.next();
					StudentJoinpojo stuJoinpojo = map.get(key);
					if(manager != null){
						if (department.equals(stuJoinpojo.getDepartment())) {
							newmap.put(stuJoinpojo.getSno(), stuJoinpojo);
						}
					}else{
						return;
					}
				}

				List<Teacher> listtea = sj.selectTeacher(department);
				JSONObject json = new JSONObject(newmap);
				JSONArray js = new JSONArray(listtea);
				json.put("all", js);
				String jsonstr = json.toString();
				// for (Teacher teacher : listtea) {
				// json.put(teacher.getTid(), teacher.getTname());
				// }
				// System.out.println(jsonstr.toString());
				// 转为json格式的字符串
				resp.getWriter().println(jsonstr);
				return;
			} else if (sign.equals("3")) {
				/**
				 * 将该学院的所有学生，上传的获奖的信息检索出来进入校方审核
				 */
				HttpSession session = req.getSession();
				Manager manager = (Manager) session.getAttribute("manager");
				if (manager != null) {
					String department = manager.getDepartment();
					Uploadinfo up = new UploadInfoimpl();
					List<UploadInfopojo> listallupload = up.selectAllUploadByDepartment(department);

					if (listallupload != null && !listallupload.isEmpty()) {
						req.setAttribute("listallupload", listallupload);
					} else {
						req.setAttribute("yesornoblank", "blank");
						System.out.println("数据库中没有一个学生上传信息");
					}
					req.getRequestDispatcher("/manager/managercheck.jsp").forward(req, resp);
					return;
				}
			} else if (sign.equals("4")) {
				/**
				 * 将分配指导老师插入到学生报名表中的指导老师字段
				 */
				String tname = req.getParameter("tname");
				String sno = req.getParameter("sno");
				String pid = req.getParameter("pid");
				StudentJoin sj = new StudentJoinimpl();
				int count = sj.updateGuider(tname, sno, pid);
				if (count > 0) {
					System.out.println("插入成功");
					String str = "{\"flag\":\"success\"}";
					resp.getWriter().println(str);
				} else {
					System.out.println("分配失败");
					String str = "{\"flag\":\"error\"}";
					resp.getWriter().println(str);
				}
				return;
			}
		}
	}
}