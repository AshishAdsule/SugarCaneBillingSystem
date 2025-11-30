package com.ashu.sugarcanebillingsystem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CaneBillInformation {
  public int BillId;
  public String BillDate;
  public String AccountHolderName;
  public String BillPassDate;
  public String VillageName;
  public int CultivatorId;
  public String BankName;
  public int AccountNo;
  public int CaneNetWeight;
  public double TotalAmount;
  public double CaneRate;
  public double NetAmount;
  public String CultivatorMobileNo;

    public int getBillId() {
        return BillId;
    }

    public void setBillId(int BillId) {
        this.BillId = BillId;
    }

    public String getBillDate() {
        return BillDate;
    }

    public void setBillDate(String BillDate) {
        this.BillDate = BillDate;
    }

    public String getAccountHolderName() {
        return AccountHolderName;
    }

    public void setAccountHolderName(String AccountHolderName) {
        this.AccountHolderName = AccountHolderName;
    }

    public String getBillPassDate() {
        return BillPassDate;
    }

    public void setBillPassDate(String BillPassDate) {
        this.BillPassDate = BillPassDate;
    }

    public String getVillageName() {
        return VillageName;
    }

    public void setVillageName(String VillageName) {
        this.VillageName = VillageName;
    }

    public int getCultivatorId() {
        return CultivatorId;
    }

    public void setCultivatorId(int CultivatorId) {
        this.CultivatorId = CultivatorId;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String BankName) {
        this.BankName = BankName;
    }

    public int getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(int AccountNo) {
        this.AccountNo = AccountNo;
    }

    public int getCaneNetWeight() {
        return CaneNetWeight;
    }

    public void setCaneNetWeight(int CaneNetWeight) {
        this.CaneNetWeight = CaneNetWeight;
    }

    public double getTotalAmount() {
        return TotalAmount;
    }

    public void setTotalAmount(double TotalAmount) {
        this.TotalAmount = TotalAmount;
    }

    public double getCaneRate() {
        return CaneRate;
    }

    public void setCaneRate(double CaneRate) {
        this.CaneRate = CaneRate;
    }

    public double getNetAmount() {
        return NetAmount;
    }

    public void setNetAmount(double NetAmount) {
        this.NetAmount = NetAmount;
    }

    public String getCultivatorMobileNo() {
        return CultivatorMobileNo;
    }

    public void setCultivatorMobileNo(String CultivatorMobileNo) {
        this.CultivatorMobileNo = CultivatorMobileNo;
    }
        public boolean InsertUser(CaneBillInformation b) throws SQLException {
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO canebillinformation(BillDate,AccountHolderName,BillPassDate,VillageName,CultivatorId,BankName,AccountNo,CaneNetWeight,TotalAmount,CaneRate,NetAmount,CultivatorMobileNo)VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
//        ps.setInt(1,getBillId());
        ps.setString(1,getBillDate());
        ps.setString(2,getAccountHolderName());
        ps.setString(3,getBillPassDate());
        ps.setString(4,getVillageName());
        ps.setInt(5,getCultivatorId());
        ps.setString(6, getBankName());
        ps.setInt(7,getAccountNo());
        ps.setInt(8,getCaneNetWeight());
        ps.setDouble(9, getTotalAmount());
        ps.setDouble(10, getCaneRate());
        ps.setDouble(11,getNetAmount());
        ps.setString(12,getCultivatorMobileNo());
         int i = ps.executeUpdate();

        if(i == 1) {

            return true;

        }
        return false;
    }
        
        public boolean updateCaneBillInformation(CaneBillInformation b) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update canebillinformation SET BillDate=?, AccountHolderName=?, BillPassDate=?, VillageName=?, CultivatorId=?,  BankName=?, AccountNo=? ,CaneNetWeight=? ,TotalAmount=? ,CaneRate=? ,NetAmount=? ,CultivatorMobileNo=? where BillId=?");
            ps.setString(1,getBillDate());
            ps.setString(2,getAccountHolderName());
            ps.setString(3,getBillPassDate());
        ps.setString(4,getVillageName());
        ps.setInt(5,getCultivatorId());
        ps.setString(6, getBankName());
        ps.setInt(7,getAccountNo());
        ps.setInt(8,getCaneNetWeight());
        ps.setDouble(9, getTotalAmount());
        ps.setDouble(10, getCaneRate());
        ps.setDouble(11,getNetAmount());
        ps.setString(12,getCultivatorMobileNo());
        ps.setInt(13, b.getBillId());
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