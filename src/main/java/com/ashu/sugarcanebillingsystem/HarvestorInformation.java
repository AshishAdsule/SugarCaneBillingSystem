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

/**
 *
 * @author ASUS
 */
public class HarvestorInformation {

    public int HarvestorId;
    public String HarvestorName;
    public String HarvestorAddress;
    public int TotalWorkers;

    public int getHarvestorId() {
        return HarvestorId;
    }

    public void setHarvestorId(int HarvestorId) {
        this.HarvestorId = HarvestorId;
    }

    public String getHarvestorName() {
        return HarvestorName;
    }

    public void setHarvestorName(String HarvestorName) {
        this.HarvestorName = HarvestorName;
    }

    public String getHarvestorAddress() {
        return HarvestorAddress;
    }

    public void setHarvestorAddress(String HarvestorAddress) {
        this.HarvestorAddress = HarvestorAddress;
    }

    public int getTotalWorkers() {
        return TotalWorkers;
    }

    public void setTotalWorkers(int TotalWorkers) {
        this.TotalWorkers = TotalWorkers;
    }

    public boolean InsertUser(HarvestorInformation b) throws SQLException {
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO harvestorinformation(HarvestorId,HarvestorName,HarvestorAddress,TotalWorkers)VALUES(?,?,?,?)");
        ps.setInt(1, b.getHarvestorId());
        ps.setString(2, b.getHarvestorName());
        ps.setString(3, b.getHarvestorAddress());
        ps.setInt(4, b.getTotalWorkers());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return false;
    }

    public boolean updateHarvestorInformation(HarvestorInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update harvestorinformation SET HarvestorName=?,HarvestorAddress=?,TotalWorkers=? where HarvestorId=?");
            ps.setString(1, b.getHarvestorName());
            ps.setString(2, b.getHarvestorAddress());
            ps.setInt(3, b.getTotalWorkers());
            ps.setInt(4, b.getHarvestorId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }

    public ResultSet getHarvestorid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(HarvestorId+1),1) as SNO from harvestorinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public ResultSet getHarvestorInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM harvestorinformation ");
            if (rs.next()) {

                return rs;

            } else {
                String strErr = "Record not found";
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }

    public boolean deleteCaneInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from harvestorinformation where HarvestorId=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
    //edit code 
     public ResultSet getHarvestorInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM harvestorinformation WHERE HarvestorId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
}
