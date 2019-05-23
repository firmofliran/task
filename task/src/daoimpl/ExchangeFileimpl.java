package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.ExchangeFiledao;
import pojo.DepartSchoolFile;
import pojo.PublishCompetition;
import utils.DBUtils;

public class ExchangeFileimpl implements ExchangeFiledao{

	@Override
	public int insertFile(String title,String content,String sendpeople, String acceptpeople, String filename) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "insert into department_school(title,content,sendpeople,acceptpeople,filename) values (?,?,?,?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, sendpeople);
			ps.setString(4, acceptpeople);
			ps.setString(5, filename);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	@Override
	public List<DepartSchoolFile> selectInfoByDepartment(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DepartSchoolFile ds = null;
		List<DepartSchoolFile> list = new ArrayList<>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from department_school where acceptpeople=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			rs = ps.executeQuery();
			while(rs.next()){
				ds = new DepartSchoolFile(rs.getString("title"), rs.getString("content"), rs.getString("sendpeople"),
						rs.getString("acceptpeople"), rs.getString("filename"));
			list.add(ds);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

	@Override
	public List<DepartSchoolFile> shoolSelectByDepartment(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		DepartSchoolFile ds = null;
		List<DepartSchoolFile> list = new ArrayList<>();
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from department_school where sendpeople=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			rs = ps.executeQuery();
			while(rs.next()){
				ds = new DepartSchoolFile(rs.getString("title"), rs.getString("content"), rs.getString("sendpeople"),
						rs.getString("acceptpeople"), rs.getString("filename"));
			list.add(ds);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

}
