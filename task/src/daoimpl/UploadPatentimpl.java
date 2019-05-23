package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.UploadPatentdao;
import pojo.Patent;
import utils.DBUtils;

public class UploadPatentimpl implements UploadPatentdao{

	@Override
	public int insertPatent(Patent patent) {
		String sql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		sql = "insert into uploadpatent( patentid,sno,title,keyword,summary,author,"
				+ "department,grade,sclass,telephone,patentfile,bankcard,checksign,historysign) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, patent.getPatentid());
			ps.setString(2, patent.getSno());
			ps.setString(3, patent.getTitle());
			ps.setString(4, patent.getKeyword());
			ps.setString(5, patent.getSummary());
			ps.setString(6, patent.getAuthor());
			ps.setString(7, patent.getDepartment());
			ps.setString(8, patent.getGrade());
			ps.setString(9, patent.getSclass());
			ps.setString(10, patent.getTelephone());
			ps.setString(11, patent.getPatentimg());
			ps.setString(12, patent.getBankcard());
			ps.setString(13,"0");//checksign默认0，history默认0
			ps.setString(14, "0");
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	@Override
	public List<Patent> selectAllPatent() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Patent> list = new ArrayList<>();
		Patent patent = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadpatent";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next(); list.add(patent))
				patent = new Patent(rs.getString("patentid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"),rs.getString("sclass"), rs.getString("department"), rs.getString("grade"),
						 rs.getString("bankcard"),rs.getString("telephone"), rs.getString("patentfile"),rs.getString("checksign"),rs.getString("historysign"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

	@Override
	public List<Patent> selectAllPatentBySno(String sno) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Patent> list = new ArrayList<>();
		Patent patent = null;
		
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadpatent where sno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			rs = ps.executeQuery();
			while(rs.next()){
				patent = new Patent(rs.getString("patentid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"),rs.getString("sclass"), rs.getString("department"), rs.getString("grade"),
						 rs.getString("bankcard"),rs.getString("telephone"), rs.getString("patentfile"),rs.getString("checksign"),rs.getString("historysign"));
				     list.add(patent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

	@Override
	public int updateHistorysign(String patentid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "update uploadpatent set historysign=? where patentid=?";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "1");
			ps.setString(2, patentid);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	@Override
	public List<Patent> selectAllPatentBydepartment(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Patent> list = new ArrayList<>();
		Patent patent = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadpatent where department=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			for (rs = ps.executeQuery(); rs.next(); list.add(patent))
				patent = new Patent(rs.getString("patentid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"),rs.getString("sclass"), rs.getString("department"), rs.getString("grade"),
						 rs.getString("bankcard"),rs.getString("telephone"), rs.getString("patentfile"),rs.getString("checksign"),rs.getString("historysign"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}


	@Override
	public int updatePatentChecksign(String patentid, String sign) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			String sql = "update uploadpatent set checksign=? where patentid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sign);
			ps.setString(2, patentid);
			count=ps.executeUpdate();
				//checksign默认0，history默认0
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

}
