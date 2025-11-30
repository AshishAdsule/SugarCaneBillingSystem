<%-- 
    Document   : TrasnportInformation
    Created on : 24 Dec 2024, 11:03:21 am
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.CultivatorInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.VehicleInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.TransportInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    TransportInformation TI = new TransportInformation();
    VehicleInformation Vi = new VehicleInformation();
    CultivatorInformation CVI = new CultivatorInformation();
    String cultivatorType;
    int cultivatorId;
    String vehicle;
    int vehicleid;
    int MaxId;
    // MaxId code
    void getMaxID() {
        try {
            rs = TI.getTransporterid();
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
            TI.setTransporterName(request.getParameter("txtTransporterName"));
            TI.setTransporterAddress(request.getParameter("txtTransporterAddress"));
            TI.setTransporterMobilNo(request.getParameter("txtTransporterMobileNo"));
            TI.setVehicleType(request.getParameter("txtVehicleType"));
            TI.setVehicleNo(request.getParameter("txtvehicleNo"));
            TI.setVitnessName(request.getParameter("txtWitnessName"));
            TI.setVitnessAddress(request.getParameter("txtWitnessAddress"));
            TI.setCultivatorType(request.getParameter("ddlCultivatoType"));
            TI.InsertUser(TI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            TI.setTransporterName(request.getParameter("txtTransporterName"));
            TI.setTransporterAddress(request.getParameter("txtTransporterAddress"));
            TI.setTransporterMobilNo(request.getParameter("txtTransporterMobileNo"));
            TI.setVehicleType(request.getParameter("txtVehicleType"));
            TI.setVehicleNo(request.getParameter("txtvehicleNo"));
            TI.setVitnessName(request.getParameter("txtWitnessName"));
            TI.setVitnessAddress(request.getParameter("txtWitnessAddress"));
            TI.setCultivatorType(request.getParameter("txtCultivator"));
            TI.setTransporterId(Integer.parseInt(request.getParameter("txtTrasnporterId")));
            TI.updateTransportInformation(TI);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            TI.deleteTransportInformation(id);
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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
                ;
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
        <script>
            function  validationName(str) {

                if (str === null || str === "") {
                    var id1 = document.getElementById('validationerror');
                    id1.innerHTML = "This fild is required";
                    alert("All Fields are Mendatory");

                    id1.style.color = "red";

                } else {
                    document.getElementById('validationerror').innerHTML = "";
                }
            }
            function data()
            {
                var a = document.getElementById("txtTrasnporterId").value;
                var b = document.getElementById("txtTransporterName").value;
                var c = document.getElementById("txtTransporterAddress").value;
                var d = document.getElementById("txtTransporterMobileNo").value;
                var e = document.getElementById("txtVehicleType").value;
                var f = document.getElementById("txtvehicleNo").value;
                var g = document.getElementById("txtWitnessName").value;
                var h = document.getElementById("txtWitnessAddress").value;
                var i = document.getElementById("txtCultivator").value;
                if (a === "" || b === "" || c === "" || d === "" || e === "" || f === "" || g === "" || h === "" || i === "")

                {
                    alert("All fields are mendatory");
                    return false;
                } else {
                    true;
                }
            }
        </script>
        
    </head>
    <body>
        <%@include file="WEB-INF/Header.jsp" %>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Transport Information</h3>
                </div>
                <div class="card-body">
                    <form  onsubmit="return data()">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Transporter Id</label>
                                <input type="number" name="txtTrasnporterId"  id="txtTrasnporterId" class="form-control" value='<%=MaxId%>'>
                            </div>
                            <div class="col-md-4">
                                <label>Transporter Name</label>
                                <input type="text" name="txtTransporterName"  id="txtTransporterName" class="form-control" required="" maxlength="100"  onchange="return validateEmail();">
                            </div> 
                            <div class="col-md-4">
                                <label>Transporter Address</label>
                                <input type="text" name="txtTransporterAddress"  id="txtTransporterAddress" class="form-control" required="" maxlength="100"  onchange="return validateEmail();">
                            </div>
                        </div>
                            <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Transporter Mobile No</label>
                                <input type="text" name="txtTransporterMobileNo"  id="txtTransporterMobileNo" class="form-control" required="" maxlength="100"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4">
                                <label>Vehicle Type</label>
                                <% try {

                                        rs = Vi.getVehicleInformation();
                                %>
                                <select class="form-control" name="ddlVehicleType" id="ddlVehicleType">
                                    <%
                                        while (rs.next()) {
                                            vehicle = rs.getString("VehicleType");
                                            vehicleid = rs.getInt("VehicleId");
                                    %>
                                    <option value="<%=vehicleid%>"> <%=vehicle%> </option>
                                    <% } %>     
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
                            </div>
                            <div class="col-md-4">
                                <label>Vehicle No</label>
                                <input type="text" name="txtvehicleNo"  id="txtvehicleNo" class="form-control" required="" maxlength="100"  onchange="return validateEmail();">
                            </div>
                        </div>
                            <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Witness Name</label>
                                <input type="text" name="txtWitnessName"  id="txtWitnessName" class="form-control" required="" maxlength="100"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4">
                                <label> Witness Address</label>
                                <span id="validationerror"></span>
                                <input type="text" name="txtWitnessAddress"  id="txtWitnessAddress" class="form-control" onkeyup="validationName(this.value)">
                            </div>
                            <div class="col-md-4 ">
                                <label>Cultivator Type</label>
                                <% try {
                                        rs = CVI.getCultivatorInformation();
                                %>
                                <select class="form-control" name="ddlCultivatoType" id="ddlCultivatorType">
                                    <%
                                        while (rs.next()) {
                                            cultivatorType = rs.getString("CultivatorType");
                                            cultivatorId = rs.getInt("CultivatorId");
                                    %>
                                    <option value="<%=cultivatorId%>"><%=cultivatorType%> </option>
                                    <% } %>
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
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
                        <th>Transporter Name</th>
                        <th>Transporter Address</th>
                        <th>Transporter Mobil No</th>
                        <th>Vehicle Type</th>
                        <th>Vehicle No</th>
                        <th>Witness Name</th>
                        <th>Witness Address</th>
                        <th>Cutlivator Type</th>
                        <th>Control</th>
                        <th>Control</th>
                    </tr>
                </thead>
                <tbody>
                    <%  int count = 1;
                        rs = TI.getTransportInformation();
                        do {
                    %>

                    <tr>
                        <td><%=count%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
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
