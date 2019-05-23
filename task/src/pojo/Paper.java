package pojo;

import java.io.Serializable;

public class Paper implements Serializable {
	private static final long serialVersionUID = 1L;
	String paperid;
	String sno;
	String title;
	String keyword;
	String summary;
	String author;
	String department;
	String articlename;
	String telephone;
	String paperimg;
	String bankcard;
	String checksign;
	String historysign;


	public String getPaperid() {
		return paperid;
	}

	public void setPaperid(String paperid) {
		this.paperid = paperid;
	}

	public String getHistorysign() {
		return historysign;
	}

	public void setHistorysign(String historysign) {
		this.historysign = historysign;
	}

	public String getChecksign() {
		return checksign;
	}

	public void setChecksign(String checksign) {
		this.checksign = checksign;
	}


	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
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

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPaperimg() {
		return paperimg;
	}

	public void setPaperimg(String paperimg) {
		this.paperimg = paperimg;
	}

	

	public Paper(String paperid, String sno, String title, String keyword, String summary, String author,
			String department, String articlename, String telephone, String paperimg, String bankcard, String checksign,
			String historysign) {
		this.paperid = paperid;
		this.sno = sno;
		this.title = title;
		this.keyword = keyword;
		this.summary = summary;
		this.author = author;
		this.department = department;
		this.articlename = articlename;
		this.telephone = telephone;
		this.paperimg = paperimg;
		this.bankcard = bankcard;
		this.checksign = checksign;
		this.historysign = historysign;
	}

	public Paper() {
	}

}
