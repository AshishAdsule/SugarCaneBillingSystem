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
public class TransportInformation {

    public int TransporterId;
    public String TransporterName;
    public String TransporterAddress;
    public String TransporterMobilNo;
    public String VehicleType;
    public String VehicleNo;
    public String VitnessName;
    public String VitnessAddress;
    public String CultivatorType;

    public int getTransporterId() {
        return TransporterId;
    }

    public void setTransporterId(int TransporterId) {
        this.TransporterId = TransporterId;
    }

    public String getTransporterName() {
        return TransporterName;
    }

    public void setTransporterName(String TransporterName) {
        this.TransporterName = TransporterName;
    }

    public String getTransporterAddress() {
        return TransporterAddress;
    }

    public void setTransporterAddress(String TransporterAddress) {
        this.TransporterAddress = TransporterAddress;
    }

    public String getTransporterMobilNo() {
        return TransporterMobilNo;
    }

    public void setTransporterMobilNo(String TransporterMobilNo) {
        this.TransporterMobilNo = TransporterMobilNo;
    }

    public String getVehicleType() {
        return VehicleType;
    }

    public void setVehicleType(String VehicleType) {
        this.VehicleType = VehicleType;
    }

    public String getVehicleNo() {
        return VehicleNo;
    }

    public void setVehicleNo(String VehicleNo) {
        this.VehicleNo = VehicleNo;
    }

    public String getVitnessName() {
        return VitnessName;
    }

    public void setVitnessName(String VitnessName) {
        this.VitnessName = VitnessName;
    }

    public String getVitnessAddress() {
        return VitnessAddress;
    }

    public void setVitnessAddress(String VitnessAddress) {
        this.VitnessAddress = VitnessAddress;
    }

    public String getCultivatorType() {
        return CultivatorType;
    }

    public void setCultivatorType(String CultivatorType) {
        this.CultivatorType = CultivatorType;
    }

    public boolean InsertUser(TransportInformation b) throws SQLException {
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO transporterinformation(TransporterId,TransporterName,TransporterAddress,TransporterMobilNo,VehicleType,VehicleNo,VitnessName,VitnessAddress,CutlivatorType)VALUES(?,?,?,?,?,?,?,?,?)");
//        ps.setInt(1,getBillId());
        ps.setInt(1, getTransporterId());
        ps.setString(2, getTransporterName());
        ps.setString(3, getTransporterAddress());
        ps.setString(4, getTransporterMobilNo());
        ps.setString(5, getVehicleType());
        ps.setString(6, getVehicleNo());
        ps.setString(7, getVitnessName());
        ps.setString(8, getVitnessAddress());
        ps.setString(9, getCultivatorType());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return false;
    }

    public boolean updateTransportInformation(TransportInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update transporterinformation SET TransporterName=?,TransporterAddress=?,TransporterMobilNo=?,VehicleType=?,VehicleNo=?,VitnessName=?,VitnessAddress=?,CutlivatorType=? where TransporterId=?");
            ps.setString(1, getTransporterName());
            ps.setString(2, getTransporterAddress());
            ps.setString(3, getTransporterMobilNo());
            ps.setString(4, getVehicleType());
            ps.setString(5, getVehicleNo());
            ps.setString(6, getVitnessName());
            ps.setString(7, getVitnessAddress());
            ps.setString(8, getCultivatorType());
            ps.setInt(9, getTransporterId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }

    public ResultSet getTransporterid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(TransporterId+1),1) as SNO from transporterinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public ResultSet getTransportInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM transporterinformation ");
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

    public boolean deleteTransportInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from transporterinformation where TransporterId=" + id);

            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
}
