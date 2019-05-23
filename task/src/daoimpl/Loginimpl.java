package daoimpl;

import java.sql.*;

import dao.Logindao;
import pojo.*;
import utils.DBUtils;
/**
 * 登录操作
 * @author Asus
 *
 */
public class Loginimpl implements Logindao {
	// 登录时通过学号查询学生
	public Student select(String sno) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Student s = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from stu where sno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			rs = ps.executeQuery();
			while (rs.next())
				s = new Student(rs.getString("sno"), rs.getString("passward"),rs.getString("name"),
						 rs.getString("sclass"), rs.getString("department"), rs.getInt("score"),"xs");
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return s;
	}
	@Override
	//修改学生总积分
	public int updateTatolScore(int score,String sno) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "update stu set score=? where sno=?";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, score);
			ps.setString(2, sno);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}
	//修改学生密码
	public int updatePassword(String newpassword,String sno) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "update stu set passward =?where sno=?";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, newpassword);
			ps.setString(2, sno);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}
	
	// 插入学生学号，密码,此功能暂时不用，用时改一下数据
	public int add(String name, String passward) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "insert into stu(name,passward) values (?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, passward);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	// 管理员登录进行验证
	public Manager selectManager(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Manager manager = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from manager where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			for (rs = ps.executeQuery(); rs.next();)
				manager = new Manager(rs.getString("name"), rs.getString("passward"), rs.getString("department"), "gly");

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return manager;
	}

	public SuperManager selectSuperManager(String name) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		SuperManager sm = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select name,passward from supermanager where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			for (rs = ps.executeQuery(); rs.next();)
				sm = new SuperManager(rs.getString("name"), rs.getString("passward"), "cjgly");

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return sm;
	}

}