package pojo;

import java.io.Serializable;

public class StudentJoinpojo implements Serializable {
	private static final long serialVersionUID = 1L;
	private String sno;
	private String name;
	private String stuclass;
	private String department;
	private PublishCompetition publishcompe;
	private String guider;
	public StudentJoinpojo() {
	}

	public StudentJoinpojo(String sno, String name, String stuclass, String department,PublishCompetition publishcompe, String guider) {
		this.sno = sno;
		this.name = name;
		this.stuclass = stuclass;
		this.department = department;
		this.publishcompe= publishcompe;
		this.guider = guider;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStuclass() {
		return stuclass;
	}

	public void setStuclass(String stuclass) {
		this.stuclass = stuclass;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public PublishCompetition getPublishcompe() {
		return publishcompe;
	}

	public void setPublishcompe(PublishCompetition publishcompe) {
		this.publishcompe = publishcompe;
	}


	public String getGuider() {
		return guider;
	}

	public void setGuider(String guider) {
		this.guider = guider;
	}


}