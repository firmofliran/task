
package pojo;

import java.io.Serializable;

public class Manager implements Serializable{

	private static final long serialVersionUID = 1L;
	String name;
	String passward;
	String department;
	String identify;


	
	public Manager(String name, String passward, String department, String identify) {
		this.name = name;
		this.passward = passward;
		this.department = department;
		this.identify = identify;
	}
	public Manager() {
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getIdentify() {
		return identify;
	}
	
	public void setIdentify(String identtify) {
		identify = identtify;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassward() {
		return passward;
	}

	public void setPassward(String passward) {
		this.passward = passward;
	}

}