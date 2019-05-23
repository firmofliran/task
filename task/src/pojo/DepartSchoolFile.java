package pojo;

import java.io.Serializable;

public class DepartSchoolFile implements Serializable{
	private static final long serialVersionUID = 1L;
	String title;
	String content;
	String sendpeople;
	String acceptpeople;
	String filename;
	
	public DepartSchoolFile() {
	}
	public DepartSchoolFile(String title, String content, String sendpeople, String acceptpeople, String filename) {
		super();
		this.title = title;
		this.content = content;
		this.sendpeople = sendpeople;
		this.acceptpeople = acceptpeople;
		this.filename = filename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendpeople() {
		return sendpeople;
	}
	public void setSendpeople(String sendpeople) {
		this.sendpeople = sendpeople;
	}
	public String getAcceptpeople() {
		return acceptpeople;
	}
	public void setAcceptpeople(String acceptpeople) {
		this.acceptpeople = acceptpeople;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
