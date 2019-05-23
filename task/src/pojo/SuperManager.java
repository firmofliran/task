package pojo;

import java.io.Serializable;

public class SuperManager implements Serializable{

	private static final long serialVersionUID = 1L;
	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public SuperManager(String name, String passward, String identify) {
		this.name = name;
		this.passward = passward;
		this.identify = identify;
	}

	public SuperManager() {
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

	String name;
	String passward;
	String identify;
}