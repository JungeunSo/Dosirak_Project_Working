package com.join.dto;

public class UserVO {
	
	String username;
	String email;
	String password;
	String usercalory;

	
	public String getUsercalory() {
		return usercalory;
	}
	public void setUsercalory(String usercalory) {
		this.usercalory = usercalory;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
