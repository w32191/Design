package com.eeit40.design.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "activities")
@Getter
@Setter
@NoArgsConstructor
//@EntityListeners(AuditingEntityListener.class)
public class Activity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private Integer id;

  @Column(name = "subject")
  private String subject;

  @Lob
  @Column(name = "content")
  private String content;

  @Column(name = "discount_percentage")
  private Integer discountPercentage;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @Column(name = "start_date")
  private LocalDate startDate;

  @JsonFormat(pattern = "yyyy-MM-dd")
  @Column(name = "end_date")
  private LocalDate endDate;

  @Column(name = "photo")
  private byte[] photo;

  @ManyToMany(cascade = {javax.persistence.CascadeType.ALL})
  @JoinTable(name = "activities_product",
      joinColumns = @JoinColumn(name = "fk_activities_id", referencedColumnName = "id"),
      inverseJoinColumns = @JoinColumn(name = "fk_product_id", referencedColumnName = "id"))
  private Set<Product> products = new LinkedHashSet<>();

  @OneToMany(mappedBy = "fkActivity", cascade = javax.persistence.CascadeType.ALL)
  private Set<ImgurImg> imgurImgs = new LinkedHashSet<>();


  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Activity{");
    sb.append("id=").append(id);
    sb.append(", subject='").append(subject).append('\'');
    sb.append(", content='").append(content).append('\'');
    sb.append(", discountPercentage=").append(discountPercentage);
    sb.append(", startDate=").append(startDate);
    sb.append(", endDate=").append(endDate);
    sb.append(", photo=").append(Arrays.toString(photo));
    sb.append(", products=").append(products);
    sb.append(", imgurImgs=").append(imgurImgs);
    sb.append('}');
    return sb.toString();
  }
}
