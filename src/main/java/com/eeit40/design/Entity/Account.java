package com.eeit40.design.Entity;

import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "account")
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;

	@NotBlank(message = "帳號不可空白")
	@Email(message = "帳號必須是Email格式")
	@Column(name = "email", length = 60)
	private String email;

	@NotBlank(message = "密碼欄不可空白")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[\\w]{6,16}$", message = "密碼必須為長度6~16位碼大小寫英文加數字")
	@Size(min = 6, max = 16)
	@Column(name = "pwd", length = 60)
	private String pwd;

	@Column(name = "salt")
	private String salt;

	@Column(name = "permission")
	private Integer permission;

	@OneToMany(mappedBy = "fkAccount")
	private Set<Question> questions = new LinkedHashSet<>();

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "fkAccount")
	private Member members;

	@OneToMany(mappedBy = "fkAccount")
	private Set<OrderInformation> orderInformations = new LinkedHashSet<>();

	@OneToMany(mappedBy = "fkAccount")
	private Set<ShoppingCard> shoppingCards = new LinkedHashSet<>();

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "fkAccount")
	private ImgurImg imgurImgs;

	public Account() {
	}

	public Set<ShoppingCard> getShoppingCards() {
		return shoppingCards;
	}

	public void setShoppingCards(Set<ShoppingCard> shoppingCards) {
		this.shoppingCards = shoppingCards;
	}

	public Set<OrderInformation> getOrderInformations() {
		return orderInformations;
	}

	public void setOrderInformations(Set<OrderInformation> orderInformations) {
		this.orderInformations = orderInformations;
	}

	public Member getMembers() {
		return members;
	}

	public void setMembers(Member members) {
		this.members = members;
	}

	public Set<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}

	public Integer getPermission() {
		return permission;
	}

	public void setPermission(Integer permission) {
		this.permission = permission;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ImgurImg getImgurImgs() {
		return imgurImgs;
	}

	public void setImgurImgs(ImgurImg imgurImgs) {
		this.imgurImgs = imgurImgs;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", pwd=" + pwd + ", checkpwd=" + ", salt=" + salt
				+ ", permission=" + permission + ", questions=" + questions + ", members=" + members
				+ ", orderInformations=" + orderInformations + ", shoppingCards=" + shoppingCards + ", imgurImgs="
				+ imgurImgs + "]";
	}

}
