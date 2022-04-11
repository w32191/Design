package com.eeit40.design.Service;

import com.eeit40.design.Dao.ProductRepository;
import com.eeit40.design.Entity.Product;
import java.util.List;
import java.util.Optional;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class ProductService {

  @Autowired
  private ProductRepository productDao;

  public void insert(Product product){
    productDao.save(product);
  }

  public Product findById(Integer id){
    Optional<Product> option = productDao.findById(id);
    if(option.isPresent()){
      return  option.get();
    }
    return null;
  }

  public void deleteById(Integer id){
    productDao.deleteById(id);
  }

  public List<Product> findAllProduct(){
    return productDao.findAll();
  }

  public Page<Product> findByPAge(Integer pageNumber){
    Pageable pgb = PageRequest.of(pageNumber-1,18, Direction.DESC,"added");
    Page<Product> page = productDao.findAll(pgb);
    return page;

  }


}


//@Service
//@Transactional
//public class WorkMessagesService {
//
//  @Autowired
//  private WorkMessagesRepository workMessagesDao;
//
//  public void insert(WorkMessages messages) {
//    workMessagesDao.save(messages);
//  }
//
//  public WorkMessages findById(Integer id) {
//    Optional<WorkMessages> option = workMessagesDao.findById(id);
//
//    if(option.isPresent()) {
//      return option.get();
//    }
//
//    return null;
//  }
//
//  public void deleteById(Integer id) {
//    workMessagesDao.deleteById(id);
//  }
//
//  public List<WorkMessages> findAllMessages(){
//    return workMessagesDao.findAll();
//  }
//
//  public Page<WorkMessages> findByPage(Integer pageNumber){
//    Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
//
//    Page<WorkMessages> page = workMessagesDao.findAll(pgb);
//
//    return page;
//  }
//
//  public WorkMessages getLastest() {
//    return workMessagesDao.findFirstByOrderByAddedDesc();
//  }
//
//}
