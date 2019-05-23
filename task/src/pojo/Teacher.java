package pojo;

import java.io.Serializable;

public class Teacher implements Serializable{
	private static final long serialVersionUID = 1L;
	String tid;
	String tname;
	String department;
	
	public Teacher() {
	}
	public Teacher(String tid, String tname, String department) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.department = department;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
}
