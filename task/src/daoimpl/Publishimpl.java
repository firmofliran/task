package daoimpl;

import dao.Publish;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import pojo.PublishCompetition;
import utils.DBUtils;

public class Publishimpl implements Publish {
	public int add(String pid, String pname, String grade, String category, String xdepartment, String publishtime,
			String competitionplace, int score, String content,String filename) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "insert into projectone( pid,pname,grade,category,xdepartment,"
				+ "publishtime,competitionplace,score,content,publishimg) values (?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			ps.setString(2, pname);
			ps.setString(3, grade);
			ps.setString(4, category);
			ps.setString(5, xdepartment);
			ps.setString(6, publishtime);
			ps.setString(7, competitionplace);
			ps.setInt(8, score);
			ps.setString(9, content);
			ps.setString(10, filename);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	public List<PublishCompetition> selectAllPublish(String category) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PublishCompetition> listpc = null;
		listpc = new ArrayList<>();
		PublishCompetition pc = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from projectone where category=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			for (rs = ps.executeQuery(); rs.next(); listpc.add(pc))
				pc = new PublishCompetition(rs.getString("pid"), rs.getString("pname"), rs.getString("grade"),
						rs.getString("category"), rs.getString("xdepartment"), rs.getString("publishtime"),
						rs.getString("competitionplace"), rs.getInt("score"), rs.getString("content"), rs.getString("publishimg"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listpc;
	}

	@Override
	public PublishCompetition selPublishByPid(String pid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PublishCompetition pc = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from projectone where pid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			rs = ps.executeQuery();
			while (rs.next())
				pc = new PublishCompetition(rs.getString("pid"), rs.getString("pname"), rs.getString("grade"),
						rs.getString("category"), rs.getString("xdepartment"), rs.getString("publishtime"),
						rs.getString("competitionplace"), rs.getInt("score"), rs.getString("content"),rs.getString("publishimg"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return pc;
	}
	}
