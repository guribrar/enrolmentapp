package com.fil.enrolmentapp.beans;

public class Role {
	
	private int idrole;
	private String role;
	private String desc;
	
	public Role() {
		
		idrole = 0;
		role = "";
		desc = "";
	}

	public int getIdrole() {
		return idrole;
	}

	public void setIdrole(int idrole) {
		this.idrole = idrole;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
