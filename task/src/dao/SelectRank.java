package dao;

import java.util.List;

import pojo.Student;
import pojo.StudentRank;

public interface SelectRank {

	// public abstract List<StudentRank> selectRank();
	public abstract List<Student> selectRank();

	// 学生排名信息总量
	public abstract int selectTotalnum();

	// 根据页面信息条数，当前页获取对应的学生信息
	// public abstract List<StudentRank> selectSplitPage(int i, int j);
	public abstract List<Student> selectSplitPage(int i, int j);

	public abstract StringBuilder Search(String s);
}