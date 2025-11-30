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
public class VehicleInformation {

    public int VehicleId;
    public String VehicleType;

    public int getVehicleId() {
        return VehicleId;
    }

    public void setVehicleId(int VehicleId) {
        this.VehicleId = VehicleId;
    }

    public String getVehicleType() {
        return VehicleType;
    }

    public void setVehicleType(String VehicleType) {
        this.VehicleType = VehicleType;
    }

    public boolean InsertUser(VehicleInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO vehicleinformation(VehicleId,VehicleType) VALUES (?,?)");
        ps.setInt(1, b.getVehicleId());
        ps.setString(2, b.getVehicleType());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return true;
    }

    public ResultSet getVehicleInformation() throws SQLException {
        Connection connection = DataAccess.getConnection();

        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vehicleinformation");

            if (rs.next()) {
                //while(rs.next())
                // {
                return rs;
                // }
            }

        } catch (SQLException ex) {

        }

        return null;
    }

    public boolean updateVehicleInformation(VehicleInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update vehicleinformation SET VehicleType=? where VehicleId=?");
            ps.setString(1, b.getVehicleType());
            ps.setInt(2, b.getVehicleId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }

    public ResultSet getVehicleid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(VehicleId+1),1) as SNO from vehicleinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean deleteVehicleInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from vehicleinformation where VehicleId=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
    
    //edit code 
     public ResultSet getVehicleInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM vehicleinformation WHERE VehicleId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
}
