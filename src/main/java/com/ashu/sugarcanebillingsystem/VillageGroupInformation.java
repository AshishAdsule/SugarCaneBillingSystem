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

public class VillageGroupInformation {
    public int VillageGroupId;
    public String VillageGroupName;

    public int getVillageGroupId() {
        return VillageGroupId;
    }

    public void setVillageGroupId(int VillageGroupId) {
        this.VillageGroupId = VillageGroupId;
    }

    public String getVillageGroupName() {
        return VillageGroupName;
    }

    public void setVillageGroupName(String VillageGroupName) {
        this.VillageGroupName = VillageGroupName;
    }
    public ResultSet getVillageGroupInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from villagegroupinformation");
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
    public boolean InsertUser(VillageGroupInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO villagegroupinformation(VillageGroupId,VillageGroupName) VALUES (?,?)");
        ps.setInt(1,b.getVillageGroupId());
        ps.setString(2,b.getVillageGroupName());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return true;
    }
    public boolean updateBloodGroups(CaneInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update caneinformation SET CaneName=? where CaneId=?");
            ps.setString(1, b.getCaneName());
            ps.setInt(2, b.getCaneId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }
    public ResultSet getCaneid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(CaneId+1),1) as SNO from caneinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
    public boolean deleteCaneInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from caneinformation where CaneId=" + id);
            
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
    public ResultSet getCaneInformationid(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM caneinformation WHERE CaneId=" + id);
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;

    }
}
