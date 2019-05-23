package pojo;

public class StudentRank {
	private String stuno;
	private String name;
	private String department;
	private int member;
	private String competition;
	private int score;
	private int sturank;
	public StudentRank(String stuno, String name, String department, int member, String competition, int score) {
		this.stuno = stuno;
		this.name = name;
		this.department = department;
		this.member = member;
		this.competition = competition;
		this.score = score;
	}

	public int getSturank() {
		return sturank;
	}

	public void setSturank(int sturank) {
		this.sturank = sturank;
	}

	public String getStuno() {
		return stuno;
	}

	public void setStuno(String stuno) {
		this.stuno = stuno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getCompetition() {
		return competition;
	}

	public void setCompetition(String competition) {
		this.competition = competition;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}