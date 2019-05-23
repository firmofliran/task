package dao;

import pojo.*;

/**
 * 登陆操作
 * 
 * @author Asus
 *
 */
public interface Logindao {
	// 登录时通过学号查询学生
	public abstract Student select(String sno);

	// 插入学生学号，密码,此功能暂时不用，用时改一下数据
	public abstract int add(String name, String passward);

	// 修改学生总积分
	int updateTatolScore(int score, String sno);

	// 修改学生密码
	int updatePassword(String newpassword, String sno);

	// 登录时通过学号查询管理员
	public abstract Manager selectManager(String s);

	// 登录时通过学号查询超级管理员
	public abstract SuperManager selectSuperManager(String s);

}