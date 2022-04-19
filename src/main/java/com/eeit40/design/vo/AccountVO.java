package com.eeit40.design.vo;

public class AccountVO {
	
	private Integer id;
	
	private String email;
	
	private String pwd;
	
	private String checkpwd;
	
	public AccountVO() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCheckpwd() {
		return checkpwd;
	}

	public void setCheckpwd(String checkpwd) {
		this.checkpwd = checkpwd;
	}

	@Override
	public String toString() {
		return "AccountVO [id=" + id + ", email=" + email + ", pwd=" + pwd + ", checkpwd=" + checkpwd + "]";
	}

}
