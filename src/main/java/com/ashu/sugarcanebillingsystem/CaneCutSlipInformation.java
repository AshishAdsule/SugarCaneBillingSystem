/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ashu.sugarcanebillingsystem;

/**
 *
 * @author ASUS
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class CaneCutSlipInformation {
public int CaneCutId;
    public String CultivatorName;
    public String PartnerName;
    public String VillageGroupId;
    public String HarvesterName;
    public String TransportName;
    public String CaneCutDate;
    public String CultivatorType;
    public String WaterSupplierName;
    public String VillageId;
    public double TotalArea;
    public String VehicleType;
    public String LaganKhodvaDate;
    public String CaneType;
    public String WaterType;
    public String CaneName;
    public int GatNo;
    public String VehicleNo;
    public int getCaneCutId() {
        return CaneCutId;
    }

    public void setCaneCutId(int CaneCutId) {
        this.CaneCutId = CaneCutId;
    }

    public String getCultivatorName() {
        return CultivatorName;
    }

    public void setCultivatorName(String CultivatorName) {
        this.CultivatorName = CultivatorName;
    }

    public String getPartnerName() {
        return PartnerName;
    }

    public void setPartnerName(String PartnerName) {
        this.PartnerName = PartnerName;
    }

    public String getVillageGroupId() {
        return VillageGroupId;
    }

    public void setVillageGroupId(String VillageGroupId) {
        this.VillageGroupId = VillageGroupId;
    }

    public String getHarvesterName() {
        return HarvesterName;
    }

    public void setHarvesterName(String HarvesterName) {
        this.HarvesterName = HarvesterName;
    }

    public String getTransportName() {
        return TransportName;
    }

    public void setTransportName(String TransportName) {
        this.TransportName = TransportName;
    }

    public String getCaneCutDate() {
        return CaneCutDate;
    }

    public void setCaneCutDate(String CaneCutDate) {
        this.CaneCutDate = CaneCutDate;
    }

    public String getCultivatorType() {
        return CultivatorType;
    }

    public void setCultivatorType(String CultivatorType) {
        this.CultivatorType = CultivatorType;
    }

    public String getWaterSupplierName() {
        return WaterSupplierName;
    }

    public void setWaterSupplierName(String WaterSupplierName) {
        this.WaterSupplierName = WaterSupplierName;
    }

    public String getVillageId() {
        return VillageId;
    }

    public void setVillageId(String VillageId) {
        this.VillageId = VillageId;
    }

    public double getTotalArea() {
        return TotalArea;
    }

    public void setTotalArea(double TotalArea) {
        this.TotalArea = TotalArea;
    }

    public String getVehicleType() {
        return VehicleType;
    }

    public void setVehicleType(String VehicleType) {
        this.VehicleType = VehicleType;
    }

    public String getLaganKhodvaDate() {
        return LaganKhodvaDate;
    }

    public void setLaganKhodvaDate(String LaganKhodvaDate) {
        this.LaganKhodvaDate = LaganKhodvaDate;
    }

    public String getCaneType() {
        return CaneType;
    }

    public void setCaneType(String CaneType) {
        this.CaneType = CaneType;
    }

    public String getWaterType() {
        return WaterType;
    }

    public void setWaterType(String WaterType) {
        this.WaterType = WaterType;
    }

    public String getCaneName() {
        return CaneName;
    }

    public void setCaneName(String CaneName) {
        this.CaneName = CaneName;
    }

    public int getGatNo() {
        return GatNo;
    }

    public void setGatNo(int GatNo) {
        this.GatNo = GatNo;
    }

    public String getVehicleNo() {
        return VehicleNo;
    }

    public void setVehicleNo(String VehicleNo) {
        this.VehicleNo = VehicleNo;
    }
         public boolean InsertUser(CaneCutSlipInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO canecutslipinformation(CultivatorName,PartnerName,VillageGroupId,HarvesterName,TransportName,CaneCutDate,CultivatorType,WaterSupplierName,VillageId,TotalArea,VehicleType,LaganKhodvaDate,CaneType,WaterType,CaneName,GatNo,VehicleNo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,getCultivatorName());
        ps.setString(2,getPartnerName());
        ps.setString(3,getVillageGroupId());
        ps.setString(4, getHarvesterName());
        ps.setString(5,getTransportName());
        ps.setString(6,getCaneCutDate());
        ps.setString(7, getCultivatorType());
        ps.setString(8,getWaterSupplierName());
        ps.setString(9, getVillageId());
        ps.setDouble(10,getTotalArea());
        ps.setString(11, getVehicleType());
        ps.setString(12, getLaganKhodvaDate());
        ps.setString(13, getCaneType());
        ps.setString(14, getWaterType());
        ps.setString(15, getCaneName());
        ps.setInt(16, getGatNo());
        ps.setString(17, getVehicleNo());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return true;
    }
         public ResultSet getCaneCutSlipInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM canecutslipinformation");
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;

    }
}
