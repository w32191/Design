package com.eeit40.design.Entity;

import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "commonQuestionType")
public class CommonQuestionType {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;
  
  @Column(name = "commonQuestionType")
  private String commonQuestionType;

  @OneToMany(fetch = FetchType.LAZY,mappedBy = "questionType")
  private Set<CommonQuestion> types = new LinkedHashSet<CommonQuestion>();

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getCommonQuestionType() {
    return commonQuestionType;
  }

  public void setCommonQuestionType(String commonQuestionType) {
    this.commonQuestionType = commonQuestionType;
  }

  @JsonIgnore
  public Set<CommonQuestion> getTypes() {
    return types;
  }

  public void setTypes(Set<CommonQuestion> types) {
    this.types = types;
  }
    
}
