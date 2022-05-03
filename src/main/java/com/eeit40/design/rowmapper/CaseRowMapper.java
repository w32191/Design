package com.eeit40.design.rowmapper;

import com.eeit40.design.Entity.Case;
import com.eeit40.design.Entity.CasesPhoto;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class CaseRowMapper implements RowMapper<Case> {
    @Override
    public Case mapRow(ResultSet rs, int i) throws SQLException {
        Case aCase = new Case();

        aCase.setId(rs.getInt("id"));
        aCase.setTitle(rs.getString("title"));
        aCase.setName(rs.getString("name"));
        aCase.setClassification(rs.getString("classification"));
        aCase.setLocation(rs.getString("location"));
        aCase.setMessage(rs.getString("message"));
        aCase.setExpiryDate(rs.getDate("expiry_Date"));
        aCase.setCaseEmail(rs.getString("case_email"));
        aCase.setDateTime(rs.getDate("date_time"));
        aCase.setViewingCount(rs.getInt("viewing_count"));
        aCase.setCoverPhoto(rs.getString("cover_photo"));
//        CasesPhoto casesPhoto = new CasesPhoto();
//        casesPhoto.setCase_photo_id(rs.getInt("case_photo_id"));
//        casesPhoto.setCase_photo_message(rs.getString("case_photo_message"));
//        casesPhoto.setCase_photo_url(rs.getString("case_photo_url"));
//        Set<CasesPhoto> set = new HashSet<>();
//        set.add(casesPhoto);
//        aCase.setCasesPhotos(set);
        return aCase;

    }
}

