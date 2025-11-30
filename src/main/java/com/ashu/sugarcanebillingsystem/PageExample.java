/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ashu.sugarcanebillingsystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PageExample {
public class pagingExample {
    
    public int catid;
    public String catname;

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getCatname() {
        return catname;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }
    
    
      public List<pagingExample> getEmployees(int page, int recordsPerPage) {
        List<pagingExample> cats = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;

        String query = "SELECT * FROM category LIMIT ?, ?";
        try (Connection con = DataAccess.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    pagingExample pe = new pagingExample();
                    pe.setCatid(rs.getInt("categoryId"));
                    pe.setCatname(rs.getString("categoryTitle"));
                    
                    cats.add(pe);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cats;
    }

    public int getNumberOfRows() {
        String query = "SELECT COUNT(*) FROM category";
        try (Connection con = DataAccess.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
         
}
}
