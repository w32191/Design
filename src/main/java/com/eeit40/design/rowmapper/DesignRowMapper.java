package com.eeit40.design.rowmapper;

import com.eeit40.design.Entity.Design;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DesignRowMapper implements RowMapper<Design> {
    @Override
    public Design mapRow(ResultSet rs, int i) throws SQLException {
        Design design = new Design();

        design.setId(rs.getInt("id"));
        design.setName(rs.getString("name"));
        design.setClassification(rs.getString("classification"));
        design.setPrice(rs.getInt("price"));
        design.setMessage(rs.getString("message"));
        design.setCoverPhoto(rs.getString("cover_photo"));
        design.setTitle(rs.getString("title") );
        design.setCreatTime(rs.getDate("create_time"));
        design.setPhoto_1(rs.getString("photo_1"));
        design.setPhoto_2(rs.getString("photo_2"));

        return design;
    }
}
