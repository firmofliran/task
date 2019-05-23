package dao;

import java.util.List;

import pojo.Patent;

/**
 * 学生上传专利
 * @author Asus
 *
 */
public interface UploadPatentdao {
		// 插入所有上传专利的信息
		public int insertPatent(Patent patent);

		// 搜索所有上传专利的信息
		public List<Patent> selectAllPatent();
		
		// 根据搜索所有上传专利的信息
		public List<Patent> selectAllPatentBydepartment(String department);
		
		//根据学号搜索一个学生上传的所有专利
		public List<Patent> selectAllPatentBySno(String sno) ;
		
		//将history改为历史记录标志由0变为1
		public int updateHistorysign(String patentid);
		
		//更改审核标志
		public int updatePatentChecksign(String patentid,String sign);
}
