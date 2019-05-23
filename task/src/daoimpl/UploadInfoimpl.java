package daoimpl;

import dao.Uploadinfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import pojo.Manager;
import pojo.Paper;
import pojo.UploadInfopojo;
import utils.DBUtils;

public class UploadInfoimpl implements Uploadinfo {
	/**
	 * 学生上传获奖信息
	 * @author Asus
	 *
	 */
	
	// 将学生上传的信息插入到数据库中
	public int insertUploadInfo(String sno, String name, String sclass, String depart, String pid, String comname,
			String category, String grade, String score, String imagename,String bankcard) {
		String sql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		sql = "insert into uploadprize( sno,name,sclass,department,pid,"
				+ "comname,grade,category,score,imagename,sign,bankcard) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			ps.setString(2, name);
			ps.setString(3, sclass);
			ps.setString(4, depart);
			ps.setString(5, pid);
			ps.setString(6, comname);
			ps.setString(7, grade);
			ps.setString(8, category);
			ps.setString(9, score);
			ps.setString(10, imagename);
			ps.setString(11, "0");//默认插入0
			ps.setString(12, bankcard);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	// 修改数据库中审核的标志为
	public int updateSign(String sign, String sno, String pid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "update uploadprize set sign=? where sno=? and pid=?";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, sign);
			ps.setString(2, sno);
			ps.setString(3, pid);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	// 通过pid，sno来搜索单个学生的上传的获奖信息
	public UploadInfopojo selectUploadInfo(String sno, String pid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		UploadInfopojo uploadpojo = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadprize where sno=? and pid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			ps.setString(2, pid);
			for (rs = ps.executeQuery(); rs.next();)
				uploadpojo = new UploadInfopojo(rs.getString("sno"), rs.getString("name"), rs.getString("sclass"),
						rs.getString("department"), rs.getString("pid"), rs.getString("comname"), rs.getString("grade"),
						rs.getString("category"), rs.getString("score"), rs.getString("imagename"),
						rs.getString("sign"),rs.getString("bankcard"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return uploadpojo;
	}

	// 学院根据session中的学院，搜索所有上传获奖信息的学生
	public List<UploadInfopojo> selectAllUploadByDepartment(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UploadInfopojo> listupload = new ArrayList<>();
		UploadInfopojo uploadpojo = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadprize where department=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			for (rs = ps.executeQuery(); rs.next(); listupload.add(uploadpojo))
				uploadpojo = new UploadInfopojo(rs.getString("sno"), rs.getString("name"), rs.getString("sclass"),
						rs.getString("department"), rs.getString("pid"), rs.getString("comname"), rs.getString("grade"),
						rs.getString("category"), rs.getString("score"), rs.getString("imagename"),
						rs.getString("sign"),rs.getString("bankcard"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listupload;
	}
	
	// 高校搜索所有上传获奖信息的学生，
	@Override
	public List<UploadInfopojo> selectAllDepartUpload() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UploadInfopojo> listupload = new ArrayList<>();
		UploadInfopojo uploadpojo = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadprize";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next(); listupload.add(uploadpojo))
				uploadpojo = new UploadInfopojo(rs.getString("sno"), rs.getString("name"), rs.getString("sclass"),
						rs.getString("department"), rs.getString("pid"), rs.getString("comname"), rs.getString("grade"),
						rs.getString("category"), rs.getString("score"), rs.getString("imagename"),
						rs.getString("sign"),rs.getString("bankcard"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listupload;
	}
	/**
	 * 学生上传论文
	 * 
	 */
	//学生上传论文
	@Override
	public int insertPaper(Paper paper) {
		String sql = null;
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		sql = "insert into uploadpaper( paperid,sno,title,keyword,summary,author,"
				+ "department,articlename,telephone,paperimg,bankcard,checksign,historysign) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, paper.getPaperid());
			ps.setString(2, paper.getSno());
			ps.setString(3, paper.getTitle());
			ps.setString(4, paper.getKeyword());
			ps.setString(5, paper.getSummary());
			ps.setString(6, paper.getAuthor());
			ps.setString(7, paper.getDepartment());
			ps.setString(8, paper.getArticlename());
			ps.setString(9, paper.getTelephone());
			ps.setString(10, paper.getPaperimg());
			ps.setString(11, paper.getBankcard());
			ps.setString(12,"0");//checksign默认0，history默认0
			ps.setString(13, "0");
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	@Override
	//搜索所有学生上传的论文
	public List<Paper> selectAllPaper() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Paper> list = new ArrayList<>();
		Paper paper = null;

		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadpaper";
			ps = conn.prepareStatement(sql);
			for (rs = ps.executeQuery(); rs.next(); list.add(paper))
				paper = new Paper(rs.getString("paperid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"), rs.getString("department"), rs.getString("articlename"),
						rs.getString("telephone"), rs.getString("paperimg"), rs.getString("bankcard"),rs.getString("checksign"),rs.getString("historysign"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}
	@Override
	//根据学号搜索学生上传的所有论文
	public List<Paper> selectAllPaperBySno(String sno) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Paper> list = new ArrayList<>();
		Paper paper = null;
		
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from uploadpaper where sno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			rs = ps.executeQuery();
			while(rs.next()){
				paper = new Paper(rs.getString("paperid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"), rs.getString("department"), rs.getString("articlename"),
						rs.getString("telephone"), rs.getString("paperimg"), rs.getString("bankcard"),rs.getString("checksign"),rs.getString("historysign"));
				     list.add(paper);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}
	/**
	 * 院系审核论文
	 * 
	 */
	@Override
	public int updatePaperSign(String sign,String paperid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		try {
			conn = DBUtils.getConnection();
			String sql = "update uploadpaper set checksign=? where paperid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sign);
			ps.setString(2, paperid);
			count=ps.executeUpdate();
				//checksign默认0，history默认0
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	@Override
	/**
	 * 各层审核通过时，修改审核标志
	 */
	public int updateHistorysign(String paperid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int count = 0;
		String sql = "update uploadpaper set historysign=? where paperid=?";
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "1");
			ps.setString(2, paperid);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}
	/**
	 * 高校根据选择的学院，相来获取应的论文
	 */
	@Override
	public List<Paper> selectAllPaperByDepartment(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Paper> list = new ArrayList<>();
		Paper paper = null;
		
		try {
			conn = DBUtils.getConnection();
			//String sql = "select * from uploadpaper u inner join stu s  on u.sno=s.sno where s.department=? and u.checksign=?";
			String sql = "select * from uploadpaper  where department=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			rs = ps.executeQuery();
			while(rs.next()){
				paper = new Paper(rs.getString("paperid"),rs.getString("sno"), rs.getString("title"), rs.getString("keyword"),
						rs.getString("summary"), rs.getString("author"), rs.getString("department"), rs.getString("articlename"),
						rs.getString("telephone"), rs.getString("paperimg"), rs.getString("bankcard"),rs.getString("checksign"),rs.getString("historysign"));
				     list.add(paper);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

	@Override
	public List<Manager> selectAllDepartment() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Manager> list = new ArrayList<>();
		Manager manager = null;
		
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from manager";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				manager = new Manager();
				manager.setDepartment(rs.getString("department"));
				     list.add(manager);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return list;
	}

	
}