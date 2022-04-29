package com.eeit40.design.rowmapper;

import com.eeit40.design.Entity.Case;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

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
        return aCase;
    }
}

