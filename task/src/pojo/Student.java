package pojo;

import java.io.Serializable;

public class Student implements Serializable{
	private static final long serialVersionUID = 1L;
	String sno;
	String passward;
	String name;
	String sclass;
	String department;
	int score;
	String identify;
	int sturank;

	public Student(String sno, String passward, String name, String sclass, String department, int score,
			String identify) {
		this.sno = sno;
		this.passward = passward;
		this.name = name;
		this.sclass = sclass;
		this.department = department;
		this.score = score;
		this.identify = identify;
	}
	public Student() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getPassward() {
		return passward;
	}

	public void setPassward(String passward) {
		this.passward = passward;
	}
	public int getSturank() {
		return sturank;
	}
	public void setSturank(int sturank) {
		this.sturank = sturank;
	}

}