package dao;

import java.util.List;

import pojo.Manager;
import pojo.Paper;
import pojo.UploadInfopojo;

public interface Uploadinfo {
	/**
	 * 学生上传获奖信息
	 * @author Asus
	 *
	 */
	// 将学生上传的信息插入到数据库中
	public abstract int insertUploadInfo(String sno, String name, String sclass, String depart, String pid,
			String comname, String category, String grade, String score, String imagenam, String bankcard);

	// 修改数据库中审核的标志为
	public abstract int updateSign(String sign, String sno, String pid);

	// 通过pid，sno来搜索单个学生的上传信息
	public abstract UploadInfopojo selectUploadInfo(String sno, String pid);

	// 搜索所有上传信息的学生
	public abstract List<UploadInfopojo> selectAllUploadByDepartment(String department);
	
	//高校搜索所有学院的
	public abstract List<UploadInfopojo> selectAllDepartUpload();

	/**
	 * 学生上传论文
	 */
	// 插入所有上传论文的信息
	public int insertPaper(Paper paper);

	// 搜索所有上传论文的信息
	public List<Paper> selectAllPaper();
	
	//根据学号搜索一个学生上传的所有论文
	public List<Paper> selectAllPaperBySno(String sno) ;
	
	//将history改为历史记录标志由0变为1
	public int updateHistorysign(String paperid);
	
	/**
	 * 院系高校审核论文
	 * 
	 */
	//修改审核字段
	public int updatePaperSign(String sign , String paperid);
	
	//高校根据选择的学院，论文来获取，相应的论文
	public List<Paper> selectAllPaperByDepartment(String department);
	
	//高校获取数据库里面的所有学院信息
	public List<Manager> selectAllDepartment();
}