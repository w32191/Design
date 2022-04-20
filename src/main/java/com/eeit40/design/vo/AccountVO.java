package com.eeit40.design.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class AccountVO {
	
	private Integer id;
	
	@Email(message = "帳號必須是Email格式")
	@NotBlank(message = "帳號不可為空")
	private String email;
	
	@NotBlank(message = "密碼不可為空")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[\\w]{6,16}$", 
	 		 message = "密碼必須為長度6~16位碼大小寫英文加數字")
	private String pwd;
	
	@NotBlank(message = "再次輸入密碼不可為空")
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
