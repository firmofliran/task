package dao;

import java.util.List;
import java.util.Map;

import pojo.StudentJoinpojo;
import pojo.Teacher;

public interface StudentJoin {
	//插入学生的报名信息
	public abstract int insertJoininfo(String sno, String name, String stuclass, String department, String pid,String guider);
	//根据比赛id搜索参加一个比赛的所有学生并将学号作为map集合的key
	public abstract Map<String, StudentJoinpojo> selectJoinpid(String pid);
	//分配指导老师
	//搜索所有的指导老师
	public List<Teacher> selectTeacher(String department);
	//将指导老师插入到学生报名表中
	public int updateGuider(String tname,String sno,String pid);
}