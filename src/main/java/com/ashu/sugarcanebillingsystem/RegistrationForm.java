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
public class RegistrationForm {
        public int RegistrationId;
    public String CultivatorId;
    public String CultivatorName;
    public String VillageGroupId;
    public String WaterSupplierName;
    public String CaneId;
    public String VillageName;
    public String TotalAreaOfCane;
    public String RegistrationDate;
    public String CultivatorType;
    public String ParthnerName;
    public String VillageId;
    public String WaterType;
    public String CaneName;
    public String LaganKhodvaDate;
    public String GatNo;
    public String CultivatorMobileNo;
    public int getRegistrationId() {
        return RegistrationId;
    }

    public void setRegistrationId(int RegistrationId) {
        this.RegistrationId = RegistrationId;
    }

    public String getCultivatorId() {
        return CultivatorId;
    }

    public void setCultivatorId(String CultivatorId) {
        this.CultivatorId = CultivatorId;
    }

    public String getCultivatorName() {
        return CultivatorName;
    }

    public void setCultivatorName(String CultivatorName) {
        this.CultivatorName = CultivatorName;
    }

    public String getVillageGroupId() {
        return VillageGroupId;
    }

    public void setVillageGroupId(String VillageGroupId) {
        this.VillageGroupId = VillageGroupId;
    }

    public String getWaterSupplierName() {
        return WaterSupplierName;
    }

    public void setWaterSupplierName(String WaterSupplierName) {
        this.WaterSupplierName = WaterSupplierName;
    }

    public String getCaneId() {
        return CaneId;
    }

    public void setCaneId(String CaneId) {
        this.CaneId = CaneId;
    }

    public String getVillageName() {
        return VillageName;
    }

    public void setVillageName(String VillageName) {
        this.VillageName = VillageName;
    }

    public String getTotalAreaOfCane() {
        return TotalAreaOfCane;
    }

    public void setTotalAreaOfCane(String TotalAreaOfCane) {
        this.TotalAreaOfCane = TotalAreaOfCane;
    }

    public String getRegistrationDate() {
        return RegistrationDate;
    }

    public void setRegistrationDate(String RegistrationDate) {
        this.RegistrationDate = RegistrationDate;
    }

    public String getCultivatorType() {
        return CultivatorType;
    }

    public void setCultivatorType(String CultivatorType) {
        this.CultivatorType = CultivatorType;
    }

    public String getParthnerName() {
        return ParthnerName;
    }

    public void setParthnerName(String ParthnerName) {
        this.ParthnerName = ParthnerName;
    }

    public String getVillageId() {
        return VillageId;
    }

    public void setVillageId(String VillageId) {
        this.VillageId = VillageId;
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

    public String getLaganKhodvaDate() {
        return LaganKhodvaDate;
    }

    public void setLaganKhodvaDate(String LaganKhodvaDate) {
        this.LaganKhodvaDate = LaganKhodvaDate;
    }

    public String getGatNo() {
        return GatNo;
    }

    public void setGatNo(String GatNo) {
        this.GatNo = GatNo;
    }

    public String getCultivatorMobileNo() {
        return CultivatorMobileNo;
    }

    public void setCultivatorMobileNo(String CultivatorMobileNo) {
        this.CultivatorMobileNo = CultivatorMobileNo;
    }

   
          public ResultSet getuser() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM caneregistration ");
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
 public boolean InsertUser(RegistrationForm b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO caneregistration(RegistrationId,CultivatorId,CultivatorName,VillageGroupId,WaterSupplierName,CaneId,VillageName,TotalAreaOfCane,RegistrationDate,CultivatorType,ParthnerName,VillageId,WaterType,CaneName,LaganKhodvaDate,GatNo,CultivatorMobileNo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        
        ps.setInt(1, b.getRegistrationId());
        ps.setString(2,b.getCultivatorId());
        ps.setString(3,b.getCultivatorName());
        ps.setString(4,b.getVillageGroupId());
        ps.setString(5,b.getWaterSupplierName());
        ps.setString(6, b.getCaneId());
        ps.setString(7,b.getVillageName());
        ps.setString(8,b.getTotalAreaOfCane());
        ps.setString(9,b.getRegistrationDate());
        ps.setString(10,b.getCultivatorType());
        ps.setString(11,b.getParthnerName());
        ps.setString(12,b.getVillageId());
        ps.setString(13,b.getWaterType());
        ps.setString(14,b.getCaneName());
        ps.setString(15,b.getLaganKhodvaDate());
        ps.setString(16,b.getGatNo());
        ps.setString(17,getCultivatorMobileNo());
        
        int i = ps.executeUpdate();

        if(i == 1) {

            return true;

        }

        return false;

    }
 public ResultSet getRegistrationForm() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(BGID+1),1) as SNO from bloodgroupmaster");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
 public boolean updateRegistrationForm(RegistrationForm b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update bloodgroupmaster SET CultivatorName=? where RegistrationId=?");
            ps.setString(1, b.getCultivatorName());
            ps.setInt(2, b.getRegistrationId());
       
            
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }
}
 