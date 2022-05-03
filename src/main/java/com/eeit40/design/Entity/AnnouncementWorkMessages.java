package com.eeit40.design.Entity;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="announcement")
public class AnnouncementWorkMessages {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	
	// 搭配 controller @Valid, BindingResult
	// https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#section-builtin-constraints
//	@Size(min = 2, max = 199, message = "請輸入 2 到 199 個字串")
	@Column(name="content", columnDefinition = "nvarchar(200)")
	private String content;
	
	@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="added", columnDefinition = "date")
	private Date added;

	public AnnouncementWorkMessages() {
	}
	
	@PrePersist   // 再轉換到 Persist 狀態以前去做以下方法
	public void onCreate() {
		if(added == null) {
			added = new Date();
		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	@Override
	public String toString() {
		return "announcementWorkMessages [id=" + id + ", content=" + content + ", added=" + added + "]";
	}
	
	

}
