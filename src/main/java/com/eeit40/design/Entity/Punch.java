package com.eeit40.design.Entity;

import java.time.Instant;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "punch")
public class Punch {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "fk_member_id")
  private Member fkMember;

  @Column(name = "employee_name", length = 60)
  private String employeeName;

  @Column(name = "punch_in")
  private Instant punchIn;

  @Column(name = "punch_out")
  private Instant punchOut;

  @Column(name = "attend")
  private Integer attend;

  @Column(name = "late_time")
  private Integer lateTime;

  @Column(name = "leave")
  private Integer leave;

  public Punch() {
  }

  public Integer getLeave() {
    return leave;
  }

  public void setLeave(Integer leave) {
    this.leave = leave;
  }

  public Integer getLateTime() {
    return lateTime;
  }

  public void setLateTime(Integer lateTime) {
    this.lateTime = lateTime;
  }

  public Integer getAttend() {
    return attend;
  }

  public void setAttend(Integer attend) {
    this.attend = attend;
  }

  public Instant getPunchOut() {
    return punchOut;
  }

  public void setPunchOut(Instant punchOut) {
    this.punchOut = punchOut;
  }

  public Instant getPunchIn() {
    return punchIn;
  }

  public void setPunchIn(Instant punchIn) {
    this.punchIn = punchIn;
  }

  public String getEmployeeName() {
    return employeeName;
  }

  public void setEmployeeName(String employeeName) {
    this.employeeName = employeeName;
  }

  public Member getFkMember() {
    return fkMember;
  }

  public void setFkMember(Member fkMember) {
    this.fkMember = fkMember;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

}
