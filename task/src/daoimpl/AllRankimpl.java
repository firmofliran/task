package daoimpl;

import dao.SelectRank;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import pojo.Student;
import pojo.StudentRank;
import utils.DBUtils;

public class AllRankimpl implements SelectRank {
	//搜索所有的学生并进行排序，加上排名
	public List<Student> selectRank() {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		List<Student> allstu;
		conn = null;
		ps = null;
		rs = null;
		Student stu = null;
		allstu = new ArrayList<>();
		int i=1;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from stu order by score desc";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next(); allstu.add(stu)){
				stu = new Student();
				stu.setScore(rs.getInt("score"));
				stu.setSno(rs.getString("sno"));
				stu.setName(rs.getString("name"));
				stu.setDepartment(rs.getString("department"));
				stu.setSturank(i++);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return allstu;
	}
/*	public List<StudentRank> selectRank() {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		List<StudentRank> listrank;
		conn = null;
		ps = null;
		rs = null;
		StudentRank rank = null;
		int i=1;
		listrank = new ArrayList<>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from studentrank order by score desc";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next(); listrank.add(rank)){
				rank = new StudentRank(rs.getString("stuno"), rs.getString("name"), rs.getString("department"),
						rs.getInt("member"), rs.getString("competition"), rs.getInt("score"));
				rank.setSturank(i++);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listrank;
	}
*/		//分页查询并排序
/*	public List<StudentRank> selectSplitPage(int currentpage, int pagesize) {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		List<StudentRank> listsplitpage;
		conn = null;
		ps = null;
		rs = null;
		StudentRank splitpage = null;
		listsplitpage = new ArrayList<>();
		try {
			conn = DBUtils.getConnection();
			oracle中的分页语句
			String sql = "select * from(select rownum r ,t.* from(select  *
			from studentrank s order by score desc ) t) where  r between ? and ?";
			String sql = "select * from stu order by score desc where  r between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (currentpage - 1) * pagesize + 1);
			ps.setInt(2, currentpage * pagesize);
			ps.setInt(2, pagesize);
			for (rs = ps.executeQuery(); rs.next(); listsplitpage.add(splitpage))
				splitpage = new StudentRank(rs.getString("stuno"), rs.getString("name"), rs.getString("department"),
						rs.getInt("member"), rs.getString("competition"), rs.getInt("score"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listsplitpage;
	}*/
	public List<Student> selectSplitPage(int currentpage, int pagesize) {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		List<Student> allstu;
		conn = null;
		ps = null;
		rs = null;
		Student stu = null;
		allstu = new ArrayList<>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from stu order by score desc   limit ? , ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (currentpage - 1) * pagesize );
			ps.setInt(2, pagesize);
			for (rs = ps.executeQuery(); rs.next(); allstu.add(stu)){
				stu = new Student();
				stu.setScore(rs.getInt("score"));
				stu.setSno(rs.getString("sno"));
				stu.setName(rs.getString("name"));
				stu.setDepartment(rs.getString("department"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return allstu;
	}
	public int selectTotalnum() {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		int count;
		conn = null;
		ps = null;
		rs = null;
		count = 0;
		try {
			conn = DBUtils.getConnection();
			//oracle//String sql = "select count(*) from studentrank ";
			String sql = "select count(*) from stu ";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next();)
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return count;
	}

	/*public StringBuilder Search(String sno) {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		StudentRank rank;
		conn = null;
		ps = null;
		rs = null;
		rank = null;
		try {
			conn = DBUtils.getConnection();
			//oracle String sql = "select * from studentrank where stuno=?";
			 String sql = "select * from stu where stuno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			for (rs = ps.executeQuery(); rs.next();)
				rank = new StudentRank(rs.getString("stuno"), rs.getString("name"), rs.getString("department"),
						rs.getInt("member"), rs.getString("competition"), rs.getInt("score"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		StringBuilder json = new StringBuilder();
		if (rank != null)
			json.append((new StringBuilder("{\"stuno\":\"")).append(rank.getStuno()).append("\",\"name\":\"")
					.append(rank.getName()).append("\",\"department\":\"").append(rank.getDepartment())
					.append("\",\"member\":\"").append(rank.getMember()).append("\",\"competition\":\"")
					.append(rank.getCompetition()).append("\",\"score\":\"").append(rank.getScore()).append("\"}")
					.toString());
		else
			json.append("{\"flag\":false}");
		return json;
	}*/
	public StringBuilder Search(String sno) {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		Student rank;
		conn = null;
		ps = null;
		rs = null;
		rank = null;
		try {
			conn = DBUtils.getConnection();
			//oracle String sql = "select * from studentrank where stuno=?";
			 String sql = "select * from stu where sno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			for (rs = ps.executeQuery(); rs.next();){
				rank = new Student();
				rank.setDepartment(rs.getString("department"));
				rank.setSno(rs.getString("sno"));
				rank.setName(rs.getString("name"));
				rank.setScore(Integer.parseInt(rs.getString("score")));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		StringBuilder json = new StringBuilder();
		if (rank != null)
			/*json.append((new StringBuilder("{\"stuno\":\"")).append(rank.getStuno()).append("\",\"name\":\"")
					.append(rank.getName()).append("\",\"department\":\"").append(rank.getDepartment())
					.append("\",\"member\":\"").append(rank.getMember()).append("\",\"competition\":\"")
					.append(rank.getCompetition()).append("\",\"score\":\"").append(rank.getScore()).append("\"}")
					.toString());*/
		json.append((new StringBuilder("{\"sno\":\"")).append(rank.getSno()).append("\",\"name\":\"")
				.append(rank.getName()).append("\",\"department\":\"").append(rank.getDepartment())
				.append("\",\"score\":\"").append(rank.getScore()).append("\"}")
				.toString());
		else
			json.append("{\"flag\":false}");
		return json;
	}
}