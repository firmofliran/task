package dao;

import java.util.List;

import pojo.DepartSchoolFile;

public interface ExchangeFiledao {
	
	//高校和各学院互相发送文件到数据库中
	public int insertFile(String title,String content,String sendpeople, String acceptpeople, String filename);
	
	//院方查找校方发送的消息
	public List<DepartSchoolFile> selectInfoByDepartment(String department);
	
	//校方根据学院查找院方发送的消息
	public List<DepartSchoolFile> shoolSelectByDepartment(String department);
}
