package pojo;

import java.io.Serializable;

public class PublishCompetition implements Serializable {
	private static final long serialVersionUID = 1L;
	String pid;
	String pname;
	String grade;
	String category;
	String xdepartment;
	String publishtime;
	String competitionplace;
	int score;
	String content;
	String filename;
	public PublishCompetition(String pid, String pname, String grade, String category, String xdepartment,
			String publishtime, String competitionplace, int score, String content,String filename) {
		this.pid = pid;
		this.pname = pname;
		this.grade = grade;
		this.category = category;
		this.xdepartment = xdepartment;
		this.publishtime = publishtime;
		this.competitionplace = competitionplace;
		this.score = score;
		this.content = content;
		this.filename = filename;
	}

	public PublishCompetition() {}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getXdepartment() {
		return xdepartment;
	}

	public void setXdepartment(String xdepartment) {
		this.xdepartment = xdepartment;
	}

	public String getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}

	public String getCompetitionplace() {
		return competitionplace;
	}

	public void setCompetitionplace(String competitionplace) {
		this.competitionplace = competitionplace;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}