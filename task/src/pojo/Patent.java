package pojo;

import java.io.Serializable;

public class Patent implements Serializable {
	private static final long serialVersionUID = 1L;
	String patentid;
	String sno;
	String title;
	String keyword;
	String summary;
	String author;
	String sclass;
	String department;
	String grade;
	String bankcard;
	String telephone;
	String patentimg;
	String checksign;
	String historysign;
	public String getPatentid() {
		return patentid;
	}
	public void setPatentid(String patentid) {
		this.patentid = patentid;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getBankcard() {
		return bankcard;
	}
	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPatentimg() {
		return patentimg;
	}
	public void setPatentimg(String patentimg) {
		this.patentimg = patentimg;
	}
	public String getChecksign() {
		return checksign;
	}
	public void setChecksign(String checksign) {
		this.checksign = checksign;
	}
	public String getHistorysign() {
		return historysign;
	}
	public void setHistorysign(String historysign) {
		this.historysign = historysign;
	}
	public Patent(String patentid, String sno, String title, String keyword, String summary, String author,
			String sclass, String department, String grade, String bankcard, String telephone, String patentimg,
			String checksign, String historysign) {
		this.patentid = patentid;
		this.sno = sno;
		this.title = title;
		this.keyword = keyword;
		this.summary = summary;
		this.author = author;
		this.sclass = sclass;
		this.department = department;
		this.grade = grade;
		this.bankcard = bankcard;
		this.telephone = telephone;
		this.patentimg = patentimg;
		this.checksign = checksign;
		this.historysign = historysign;
	}
	public Patent() {
	}



}
