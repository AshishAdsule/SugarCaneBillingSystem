package com.ashu.sugarcanebillingsystem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

  public class CaneInformation {

    public int getCaneId() {
        return CaneId;
    }

    public void setCaneId(int CaneId) {
        this.CaneId = CaneId;
    }

    public String getCaneName() {
        return CaneName;
    }

    public void setCaneName(String CaneName) {
        this.CaneName = CaneName;
    }
    public int CaneId;
    public String CaneName;
    
    // Insert code 
    public boolean InsertUser(CaneInformation b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO caneinformation(CaneId,CaneName) VALUES (?,?)");
        ps.setInt(1,b.getCaneId());
        ps.setString(2,b.getCaneName());
        int i = ps.executeUpdate();

        if(i == 1) {

            return true;

        }

        return false;

    }
    
    // update  code
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
    
    //Max id code
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
    
    //ResultSet code
     public ResultSet getCaneInformation() throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM caneinformation ");
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
     //Delete Code
     public boolean deleteCaneInformation(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            int i = stmt.executeUpdate("delete from caneinformation where CaneId=" + id);
            
            if (i == 1) {
                return true;
            }
        } catch (SQLException ex) {
        }
        return false;
    }
    //Edit by id
    public ResultSet getCaneInformationid(int id) throws SQLException {
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM caneinformationr WHERE CaneId=" + id);
            if (rs.next()) {
                return rs;
            }
        } catch (SQLException ex) {
            System.out.print(ex.toString());
        }
        return null;
    }
    
    
    // Paging code 
    public List<CaneInformation> getEmployees(int page, int recordsPerPage) {
        List<CaneInformation> cats = new ArrayList<CaneInformation>();
        int start = (page - 1) * recordsPerPage;

        String query = "SELECT * FROM caneinformation LIMIT ?, ?";
        try (Connection con = DataAccess.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CaneInformation pe = new CaneInformation();
                    pe.setCaneId(rs.getInt("CaneId"));
                    pe.setCaneName(rs.getString("CaneName"));
                    
                    cats.add(pe);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cats;
    }
    public int getNumberOfRows() {
        String query = "SELECT COUNT(*) FROM caneinformation";
        try (Connection con = DataAccess.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
         
}

