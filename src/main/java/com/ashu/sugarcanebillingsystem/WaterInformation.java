/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ashu.sugarcanebillingsystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class WaterInformation {
  public int WaterId;
  public String WaterType;

    public int getWaterId() {
        return WaterId;
    }

    public void setWaterId(int WaterId) {
        this.WaterId = WaterId;
    }

    public String getWaterType() {
        return WaterType;
    }

    public void setWaterType(String WaterType) {
        this.WaterType = WaterType;
    }
     public boolean InsertUser(WaterInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO waterinformation(WaterId,WaterType) VALUES (?,?)");
        ps.setInt(1,b.getWaterId());
        ps.setString(2,b.getWaterType());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return true;
    }
     public ResultSet getWaterInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM waterinformation ");
            if (rs.next()) {

                return rs;

            }
            else{
                String strErr = "Record not found";
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
      public boolean deleteWaterInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from waterinformation where WaterId=" + id);
            
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
      public ResultSet getWaterid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(WaterId+1),1) as SNO from waterinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
      public boolean updateWaterInformation(WaterInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update waterinformation SET WaterType=? where WaterId=?");
            ps.setString(1, b.getWaterType());
            ps.setInt(2, b.getWaterId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;
    }
      // Edit code
     public ResultSet getWaterInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM waterinformation WHERE WaterId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
}
