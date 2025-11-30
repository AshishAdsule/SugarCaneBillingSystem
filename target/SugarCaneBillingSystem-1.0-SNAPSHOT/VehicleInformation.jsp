<%-- 
    Document   : VehicleInformation
    Created on : 8 Dec 2024, 6:32:32 pm
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.VehicleInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    VehicleInformation VI = new VehicleInformation();
    int MaxId;
    String VehicleName;
    // MaxId code
    void getMaxID() {
        try {
            rs = VI.getVehicleid();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("SNO");
        } catch (Exception ex) {
        }
    }
    
%>
<%
    getMaxID();
    if (request.getParameter("btnSave") != null) {
        try {
            VI.setVehicleType(request.getParameter("txtusername"));
            VI.InsertUser(VI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
           VI.setVehicleType(request.getParameter("txtusername"));
            VI.setVehicleId(Integer.parseInt(request.getParameter("txtnumber")));
            VI.updateVehicleInformation(VI);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    
    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            VI.deleteVehicleInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
     //    Edit code
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));
            ResultSet rs = VI.getVehicleInformation(eid);
            MaxId = rs.getInt(1);
            VehicleName = rs.getString(2);

        } catch (Exception ex) {

            out.println(ex);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <style>
            .card-body{
                background-color: lightblue;
            }
            table {
                background: #fafafa;
                border-radius: 0.25em;
                border-collapse: collapse;
                margin: 1em;
                margin-left: 150px;
                margin-top: 50px;
                width: 79%;
                border: 1px solid #000;
            }
            th {
                border-bottom: 1px solid #364043;
                color: black;
                font-size: 0.85em;
                font-weight: 600;
                padding: 0.5em 1em;
                text-align: left;
            }
            td {
                color: #444;
                font-weight: 400;
                padding: 0.65em 1em;
            }
            tbody tr {
                transition: background 0.25s ease;
            }
            tbody tr:hover {
                background: #d1ecf1;
            }
        </style>
        <%@include file="WEB-INF/Header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Vehicle Information</h3>
                </div>
                <div class="card-body">
                    <form>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Vehicle Id</label>
                                <input type="number" name="txtnumber"  id="txtnumber" class="form-control" value='<%=MaxId%>'>
                            </div>  
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Vehicle Type</lable>
                                <input type="text" name="txtusername"  id="txtusername" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                        </div>
                        <br>
                        <input type="submit" value="Save" name="btnSave" class="btn btn-success">
                        <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                    </form>
                </div>
            </div>
            <table class=" table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Vehicle Type</th>
                            <th>Control</th>
                            <th>Control</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int count = 1;
                            rs = VI.getVehicleInformation();
                            do {
                        %>

                        <tr>
                            <td><%=count%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><a href="?edit=<%=rs.getInt(1)%>" class="btn btn-outline-danger btn-sm">edit</a></td>
                            <td><a href="?delete=<%=rs.getInt(1)%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
                        </tr>
                        <%
                                count++;
                            } while (rs.next());
                        %>
                    </tbody>
                </table>
        </div>
    </body>
</html>
