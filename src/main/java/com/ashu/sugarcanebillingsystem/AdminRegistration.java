package com.ashu.sugarcanebillingsystem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminRegistration { 
          public   int RegistrationId;
          public String FullName;
          public String Gender;
          public String ContactNumber;
          public String EmailId;
          public String UserName;
          public String Password;
    public int getRegistrationId() {
        return RegistrationId;
    }

    public void setRegistrationId(int RegistrationId) {
        this.RegistrationId = RegistrationId;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getContactNumber() {
        return ContactNumber;
    }

    public void setContactNumber(String ContactNumber) {
        this.ContactNumber = ContactNumber;
    }

    public String getEmailId() {
        return EmailId;
    }

    public void setEmailId(String EmailId) {
        this.EmailId = EmailId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    } 
    public boolean InsertAdmin(AdminRegistration b) throws SQLException {

        //connector connector = new connector();
        Connection cn = DataAccess.getConnection();
        PreparedStatement ps = cn.prepareStatement("INSERT INTO tbl_registration(RegistrationId, FullName, Gender, ContactNumber, EmailId, UserName, Password) VALUES (?,?,?,?,?,?,?)");
        ps.setInt(1,b.getRegistrationId());
        ps.setString(2,b.getFullName());
        ps.setString(3, b.getGender());
        ps.setString(4, b.getContactNumber());
        ps.setString(5, b.getEmailId());
        ps.setString(6, b.getUserName());
        ps.setString(7, b.getPassword());
        int i = ps.executeUpdate();
        if(i == 1) {

            return true;

        }

        return false;

    }  
}
