package com.eeit40.design.Service;
import com.eeit40.design.Dto.AnnouncementDto;
import com.eeit40.design.Entity.Announcement;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

public interface AnnouncementService {


  List<Announcement> findAll();

  boolean deleteByID(int id);

  Announcement insertAnnouncement(AnnouncementDto dto) throws IOException;
}
