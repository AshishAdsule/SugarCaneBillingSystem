<%-- 
    Document   : VillageGroupInformation
    Created on : 8 Dec 2024, 7:01:54 pm
    Author     : ASUS
--%>

<%@page import="com.ashu.sugarcanebillingsystem.VillageGroupInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ResultSet rs;
VillageGroupInformation VGI=new VillageGroupInformation();
%>
<%
if(request.getParameter("btnSave") !=null){
    try{
    VGI.setVillageGroupName(request.getParameter("txtname"));
    VGI.InsertUser(VGI);
    }
    catch(Exception ex){
    out.print(ex);
    }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        
        <%=session.getAttribute("nm")%>
        <div>
            <h3>Village Group Information</h3>
            <form>
                <div class="row">
                    <div class="col-md-4">
                        <lable>village Group Id</lable>
                        <input type="number" name="txtnumber" id="txtnumber" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <lable>Enter village Name</lable> 
                        <input type="text" name="txtname" id="txtname" class="form-control" required="" maxlength="10" onclick="return validateEmail();">
                    </div>                       
                </div>
                <input type="submit" name="btnSave" id="btnSave" value="Save" class="btn btn-success">
                <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
            </form>
        </div>
    </body>
</html>
