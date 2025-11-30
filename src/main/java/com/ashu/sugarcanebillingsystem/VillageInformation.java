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
public class VillageInformation {

    public int VillageId;
    public String VillageName;

    public int getVillageId() {
        return VillageId;
    }

    public void setVillageId(int VillageId) {
        this.VillageId = VillageId;
    }

    public String getVillageName() {
        return VillageName;
    }

    public void setVillageName(String VillageName) {
        this.VillageName = VillageName;
    }

    public boolean InsertUser(VillageInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO villageinformation(VillageId,VillageName) VALUES (?,?)");
        ps.setInt(1, b.getVillageId());
        ps.setString(2, b.getVillageName());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }

        return false;

    }

    public ResultSet getVillageInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM villageinformation ");
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

    public boolean updateVillageInformation(VillageInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update villageinformation SET VillageName=? where VillageId=?");
            ps.setString(1, b.getVillageName());
            ps.setInt(2, b.getVillageId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }

    public ResultSet getVillageid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(VillageId+1),1) as SNO from villageinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean deleteVillageInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from villageinformation where VillageId=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
    //Edit by id
    public ResultSet getVillageInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM villageinformation WHERE VillageId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
}
