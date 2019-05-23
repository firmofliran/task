package pojo;

public class UploadInfopojo {
	String sno;
	String name;
	String sclass;
	String depart;
	String pid;
	String comname;
	String category;
	String grade;
	String score;
	String imagename;
	String sign;
	String bankcard;

	public UploadInfopojo() {
	}

	

	public UploadInfopojo(String sno, String name, String sclass, String depart, String pid, String comname,
			 String grade,String category, String score, String imagename, String sign, String bankcard) {
		this.sno = sno;
		this.name = name;
		this.sclass = sclass;
		this.depart = depart;
		this.pid = pid;
		this.comname = comname;
		this.category = category;
		this.grade = grade;
		this.score = score;
		this.imagename = imagename;
		this.sign = sign;
		this.bankcard = bankcard;
	}



	public String getBankcard() {
		return bankcard;
	}

	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
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

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

}