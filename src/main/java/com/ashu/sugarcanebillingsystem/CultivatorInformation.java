package com.ashu.sugarcanebillingsystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CultivatorInformation {
    public int CultivatorId;
    public String CultivatorAddress;
    public String VillageGroupName;
    public String BankName;
    public String CultivatorName;
    public String CultivatorType;
    public Double TotalAreaOfCane;
    public int AccountNo;
    public String CultivatorMobileNo;

    public int getCultivatorId() {
        return CultivatorId;
    }

    public void setCultivatorId(int CultivatorId) {
        this.CultivatorId = CultivatorId;
    }

    public String getCultivatorAddress() {
        return CultivatorAddress;
    }

    public void setCultivatorAddress(String CultivatorAddress) {
        this.CultivatorAddress = CultivatorAddress;
    }

    public String getVillageGroupName() {
        return VillageGroupName;
    }

    public void setVillageGroupName(String VillageGroupName) {
        this.VillageGroupName = VillageGroupName;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String BankName) {
        this.BankName = BankName;
    }

    public String getCultivatorName() {
        return CultivatorName;
    }

    public void setCultivatorName(String CultivatorName) {
        this.CultivatorName = CultivatorName;
    }

    public String getCultivatorType() {
        return CultivatorType;
    }

    public void setCultivatorType(String CultivatorType) {
        this.CultivatorType = CultivatorType;
    }

    public Double getTotalAreaOfCane() {
        return TotalAreaOfCane;
    }

    public void setTotalAreaOfCane(Double TotalAreaOfCane) {
        this.TotalAreaOfCane = TotalAreaOfCane;
    }

    public int getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(int AccountNo) {
        this.AccountNo = AccountNo;
    }

    public String getCultivatorMobileNo() {
        return CultivatorMobileNo;
    }

    public void setCultivatorMobileNo(String CultivatorMobileNo) {
        this.CultivatorMobileNo = CultivatorMobileNo;
    }

    //    ResultSet
    public ResultSet getCultivatorInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM cultivatorinformation ");
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

    //insert
    public boolean InsertUser(CultivatorInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO cultivatorinformation(CultivatorAddress,VillageGroupName,BankName,CultivatorName,CultivatorType,TotalAreaOfCane,AccountNo,CultivatorMobileNo) VALUES (?,?,?,?,?,?,?,?)");

        ps.setString(1, getCultivatorAddress());
        ps.setString(2, getVillageGroupName());
        ps.setString(3, getBankName());
        ps.setString(4, getCultivatorName());
        ps.setString(5, getCultivatorType());
        ps.setDouble(6, getTotalAreaOfCane());
        ps.setInt(7, getAccountNo());
        ps.setString(8, getCultivatorMobileNo());
        int i = ps.executeUpdate();

        if (i == 1) {

            return true;

        }
        return true;
    }
    
     //update
    public boolean updateCultivatorInformation(CultivatorInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update cultivatorinformation SET CultivatorAddress=?,VillageGroupName=?,BankName=?,CultivatorName=?,CultivatorType=?,TotalAreaOfCane=?,AccountNo=?,CultivatorMobileNo=? where CultivatorId=?");
            ps.setString(1, getCultivatorAddress());
            ps.setString(2, getVillageGroupName());
            ps.setString(3, getBankName());
            ps.setString(4, getCultivatorName());
            ps.setString(5, getCultivatorType());
            ps.setDouble(6, getTotalAreaOfCane());
            ps.setInt(7, getAccountNo());
            ps.setString(8, getCultivatorMobileNo());
            ps.setInt(9, b.getCultivatorId());
            int i = ps.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return false;
    }
    
    
//    MaxId
    public ResultSet getCultivatorid() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select ifnull(max(CultivatorId+1),1) as SNO from cultivatorinformation");
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
        }
        return null;
    }
     public boolean deleteCultivatorInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete  from cultivatorinformation where CultivatorId=" + id);
            
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
     // Edit code
     public ResultSet getCultivatorInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM cultivatorinformation WHERE CultivatorId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
}
