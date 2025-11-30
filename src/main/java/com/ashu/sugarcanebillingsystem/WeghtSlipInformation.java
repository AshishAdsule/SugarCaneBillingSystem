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


public class WeghtSlipInformation {
  public int   WeightSlipId;
  public String CultivatorName;
  public String VillageGroupId;
  public String PartnerName;
  public String TransporterName;
  public String HarvestorName;
  public String CaneCutId;
  public String CultivatorType;
  public String villageId;
  public String WaterSupplierName;
  public String BankName;
  public String VehicleType;
  public String WeightSlipDate;
  public String CaneName;
  public String VillageName;
  public String WaterType;
  public int AccountNo;
  public String VehicleNo;
  public String CultivatorMobileNo;
    public int getWeightSlipId() {
        return WeightSlipId;
    }

    public void setWeightSlipId(int WeightSlipId) {
        this.WeightSlipId = WeightSlipId;
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

    public String getPartnerName() {
        return PartnerName;
    }

    public void setPartnerName(String PartnerName) {
        this.PartnerName = PartnerName;
    }

    public String getTransporterName() {
        return TransporterName;
    }

    public void setTransporterName(String TransporterName) {
        this.TransporterName = TransporterName;
    }

    public String getHarvestorName() {
        return HarvestorName;
    }

    public void setHarvestorName(String HarvestorName) {
        this.HarvestorName = HarvestorName;
    }

    public String getCaneCutId() {
        return CaneCutId;
    }

    public void setCaneCutId(String CaneCutId) {
        this.CaneCutId = CaneCutId;
    }

    public String getCultivatorType() {
        return CultivatorType;
    }

    public void setCultivatorType(String CultivatorType) {
        this.CultivatorType = CultivatorType;
    }

    public String getVillageId() {
        return villageId;
    }

    public void setVillageId(String villageId) {
        this.villageId = villageId;
    }

    public String getWaterSupplierName() {
        return WaterSupplierName;
    }

    public void setWaterSupplierName(String WaterSupplierName) {
        this.WaterSupplierName = WaterSupplierName;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String BankName) {
        this.BankName = BankName;
    }

    public String getVehicleType() {
        return VehicleType;
    }

    public void setVehicleType(String VehicleType) {
        this.VehicleType = VehicleType;
    }

    public String getWeightSlipDate() {
        return WeightSlipDate;
    }

    public void setWeightSlipDate(String WeightSlipDate) {
        this.WeightSlipDate = WeightSlipDate;
    }

    public String getCaneName() {
        return CaneName;
    }

    public void setCaneName(String CaneName) {
        this.CaneName = CaneName;
    }
    
    public String getVillageName() {
        return VillageName;
    }

    public void setVillageName(String VillageName) {
        this.VillageName = VillageName;
    }
    public String getWaterType() {
        return WaterType;
    }

    public void setWaterType(String WaterType) {
        this.WaterType = WaterType;
    }

    public int getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(int AccountNo) {
        this.AccountNo = AccountNo;
    }

    public String getVehicleNo() {
        return VehicleNo;
    }

    public void setVehicleNo(String VehicleNo) {
        this.VehicleNo = VehicleNo;
    }

    public String getCultivatorMobileNo() {
        return CultivatorMobileNo;
    }

    public void setCultivatorMobileNo(String CultivatorMobileNo) {
        this.CultivatorMobileNo = CultivatorMobileNo;
    }
    
    public ResultSet getWeghtSlipInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM weghtslipinformation");
            if (rs.next()) {

                return rs;

            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;

    }
    public boolean InsertUser(WeghtSlipInformation b) throws SQLException {
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO weghtslipinformation(WeightSlipId,CultivatorName,VillageGroupId,PartnerName,TransporterName,HarvestorName,CaneCutId,CultivatorType,villageId,WaterSupplierName,BankName,VehicleType,WeightSlipDate,CaneName,WaterType,AccountNo,VehicleNo,CultivatorMobileNo)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setInt(1,b.getWeightSlipId());
        ps.setString(2,b.getCultivatorName());
        ps.setString(3,b.getVillageGroupId());
        ps.setString(4, b.getPartnerName());
        ps.setString(5,b.getTransporterName());
        ps.setString(6,b.getHarvestorName());
        ps.setString(7,b.getCaneCutId());
        ps.setString(8, b.getCultivatorType());
        ps.setString(9,b.getVillageId());
        ps.setString(10, b.getWaterSupplierName());
        ps.setString(11,b.getBankName());
        ps.setString(12,b.getVehicleType());
        ps.setString(13,b.getWeightSlipDate());
        ps.setString(14,b.getCaneName());
        ps.setString(15, b.getWaterType());
        ps.setInt(16, b.getAccountNo());
        ps.setString(17, b.getVehicleNo());
        ps.setString(18, b.getCultivatorMobileNo());
         int i = ps.executeUpdate();

        if(i == 1) {

            return true;

        }
        return false;
    }
    public boolean updateWeghtSlipInformation(WeghtSlipInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update weghtslipinformation SET WeightSlipId=?,CultivatorName=?,VillageGroupId=?,PartnerName=?,TransporterName=?,HarvestorName=?,CaneCutId=?,CultivatorType=?,villageId=?,WaterSupplierName=?,BankName=?,VehicleType=?,WeightSlipDate=?,CaneName=?,WaterType=?,AccountNo=?,VehicleNo=?,CultivatorMobileNo=? where WeightSlipId=?");
            ps.setString(1,b.getCultivatorName());
        ps.setString(2,b.getVillageGroupId());
        ps.setString(3, b.getPartnerName());
        ps.setString(4,b.getTransporterName());
        ps.setString(5,b.getHarvestorName());
        ps.setString(6,b.getCaneCutId());
        ps.setString(7, b.getCultivatorType());
        ps.setString(8,b.getVillageId());
        ps.setString(9, b.getWaterSupplierName());
        ps.setString(10,b.getBankName());
        ps.setString(11,b.getVehicleType());
        ps.setString(12,b.getWeightSlipDate());
        ps.setString(13,b.getCaneName());
        ps.setString(15, b.getWaterType());
        ps.setInt(16, b.getAccountNo());
        ps.setString(17, b.getVehicleNo());
        ps.setString(18, b.getCultivatorMobileNo());
            ps.setInt(19, b.getWeightSlipId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;

    }
    public ResultSet getWeightSlipid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(WeightSlipId+1),1) as SNO from weghtslipinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
    public boolean deleteWeghtSlipInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from weghtslipinformation where WeightSlipId=" + id);
            
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
}
