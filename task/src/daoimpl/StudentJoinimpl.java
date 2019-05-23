package daoimpl;

import dao.StudentJoin;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pojo.PublishCompetition;
import pojo.StudentJoinpojo;
import pojo.Teacher;
import utils.DBUtils;

public class StudentJoinimpl implements StudentJoin {
	public int insertJoininfo(String sno, String name, String stuclass, String department, String pid,String guider) {
		Connection conn;
		PreparedStatement ps;
		int count;
		conn = null;
		ps = null;
		count = 0;
		try {
			conn = DBUtils.getConnection();
			String sql = "insert into stujoin(sno,name,stuclass,department,pid,guider) values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sno);
			ps.setString(2, name);
			ps.setString(3, stuclass);
			ps.setString(4, department);
			ps.setString(5, pid);
			ps.setString(6, "未分配");
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
	}

	public Map<String, StudentJoinpojo> selectJoinpid(String pid) {
		Connection conn;
		PreparedStatement ps;
		ResultSet rs;
		Map<String, StudentJoinpojo> mapstu;
		conn = null;
		ps = null;
		rs = null;
		StudentJoinpojo sj = null;
		PublishCompetition publishcompe=null;
		mapstu = new HashMap<>();
		try {
			conn = DBUtils.getConnection();
			//String sql = "select stujoin.*,p.* from(select pr.* from projectone  pr where pr.pid=?)p,stujoin where p.pid=stujoin.pid ";
			String sql = "select * from stujoin s inner join projectone p on s.pid=p.pid where s.pid=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			rs = ps.executeQuery();
			while ( rs.next()){
				publishcompe=new PublishCompetition();
				publishcompe.setPid(rs.getString("pid"));
				publishcompe.setPname(rs.getString("pname"));
				publishcompe.setScore(rs.getInt("score"));
				publishcompe.setCategory(rs.getString("category"));
				sj = new StudentJoinpojo(rs.getString("sno"), rs.getString("name"), rs.getString("stuclass"),
						rs.getString("department"), publishcompe, rs.getString("guider"));
				mapstu.put(sj.getSno(),sj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return mapstu;
	}

	@Override
	//将所有数学与大数据的的老师检索出来
	public List<Teacher> selectTeacher(String department) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Teacher> listtea=new ArrayList<>();
		Teacher tea = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from teacher where department=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, department);
			rs = ps.executeQuery();
			while (rs.next()){
				tea = new Teacher(rs.getString("tno"),rs.getString("tname"),
						  rs.getString("department"));
				listtea.add(tea);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(rs, ps, conn);
		return listtea;
	}
	//将分配的老师插入到学生报名表的指导老师字段
	public int updateGuider(String tname,String sno,String pid) {
		Connection conn=null;
		PreparedStatement ps=null;
		int count=0;
		try {
			conn = DBUtils.getConnection();
			String sql = "update stujoin set guider=?where sno=? and pid=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tname);
			ps.setString(2, sno);
			ps.setString(3, pid);
			count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBUtils.close(null, ps, conn);
		return count;
}
}