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

@Entity
@Table(name = "account")
public class Account {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Column(name = "email", length = 60)
  private String email;

  @Column(name = "pwd", length = 60)
  private String pwd;

  @Column(name = "permission")
  private Integer permission;

  @OneToMany(mappedBy = "fkAccount")
  private Set<Question> questions = new LinkedHashSet<>();

  @OneToOne(fetch = FetchType.LAZY, mappedBy = "fkAccount")
  private Member members;

  @OneToMany(mappedBy = "fkAccount")
  private Set<OrderInformation> orderInformations = new LinkedHashSet<>();

  @OneToOne(fetch = FetchType.LAZY, mappedBy = "fkAccount")
  private ShoppingCard shoppingCards;

  public Account() {
  }

  public ShoppingCard getShoppingCards() {
    return shoppingCards;
  }

  public void setShoppingCards(ShoppingCard shoppingCards) {
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
}
