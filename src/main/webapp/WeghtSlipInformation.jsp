<%-- 
    Document   : WeghtSlipInformation
    Created on : 10 Dec 2024, 9:51:20 pm
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.CultivatorInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneCutSlipInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.WaterInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.VillageGroupInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.VehicleInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.VillageInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.WeghtSlipInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet Rs;
    WeghtSlipInformation ws = new WeghtSlipInformation();
    int MaxId;

    void getMaxID() {
        try {
            Rs = ws.getWeightSlipid();
            //out.print(rs.getInt(1));
            MaxId = Rs.getInt("SNO");
        } catch (Exception ex) {
        }
    }
%>
<%    ResultSet Rs1;
    VillageInformation VI = new VillageInformation();
    VehicleInformation Vi = new VehicleInformation();
    CaneInformation CI = new CaneInformation();
    VillageGroupInformation VGI=new VillageGroupInformation();
    WaterInformation WI = new WaterInformation();
    CultivatorInformation CVI = new CultivatorInformation();
    CaneCutSlipInformation CCSI = new CaneCutSlipInformation();
    String cultivatorName;
    String cultivatorType;
    int cultivatorId;
    String CaneCutSlipInformation;
    int CaneCutSlipInformationId;
    String WaterType;
    int WaterId;
    String villageGroupName;
    int villageGroupNameid;
    String village;
    int villageid;
    String vehicle;
    int vehicleid;
    String CaneName;
    int CaneId;
%>
<%
    if (request.getParameter("btnSave") != null) {
        try {
            ws.setCultivatorName(request.getParameter("ddlCultivatorName"));
            ws.setVillageGroupId(request.getParameter("ddlVillageGroupName"));
            ws.setPartnerName(request.getParameter("txtpartnername"));
            ws.setTransporterName(request.getParameter("txttransportername"));
            ws.setHarvestorName(request.getParameter("txtharvestername"));
            ws.setCaneCutId(request.getParameter("ddlCaneCutSlipInformation"));
            ws.setCultivatorType(request.getParameter("ddlCultivatoType"));
            ws.setVillageId(request.getParameter("ddlVillageName"));
            ws.setWaterSupplierName(request.getParameter("watersuppliername"));
            ws.setBankName(request.getParameter("txtbankname"));
            ws.setVehicleType(request.getParameter("ddlVehicleType"));
            ws.setWeightSlipDate(request.getParameter("txtweightslipDate"));
            ws.setCaneName(request.getParameter("ddlCaneName"));
            ws.setWaterType(request.getParameter("txtwatertype"));
            ws.setAccountNo(Integer.parseInt(request.getParameter("txtaccountno")));
            ws.setVehicleNo(request.getParameter("txtvehicleno"));
            ws.setCultivatorMobileNo(request.getParameter("txtmobileno"));
            ws.InsertUser(ws);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            ws.setCultivatorName(request.getParameter("ddlCultivatorName"));
            ws.setVillageGroupId(request.getParameter("txtvillagegroupid"));
            ws.setPartnerName(request.getParameter("txtpartnername"));
            ws.setTransporterName(request.getParameter("txttransportername"));
            ws.setHarvestorName(request.getParameter("txtharvestername"));
            ws.setCaneCutId(request.getParameter("txtcancutid"));
            ws.setCultivatorType(request.getParameter("ddlCultivatoType"));
            ws.setVillageId(request.getParameter("txtvillageid"));
            ws.setWaterSupplierName(request.getParameter("watersuppliername"));
            ws.setBankName(request.getParameter("txtbankname"));
            ws.setVehicleType(request.getParameter("txtvehicleType"));
            ws.setWeightSlipDate(request.getParameter("txtweightslipDate"));
            ws.setCaneName(request.getParameter("txtcanename"));
            ws.setWaterType(request.getParameter("txtwatertype"));
            ws.setAccountNo(Integer.parseInt(request.getParameter("txtaccountno")));
            ws.setVehicleNo(request.getParameter("txtvehicleno"));
            ws.setCultivatorMobileNo(request.getParameter("txtmobileno"));
            ws.setWeightSlipId(Integer.parseInt(request.getParameter("txtweightslipid")));
            ws.updateWeghtSlipInformation(ws);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            ws.deleteWeghtSlipInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <style>
            .panel-heading{
                background-color: #007bff;
                color: white
            }
            .card-body{
                background-color: lightblue;
            }
            table {
                background: #fafafa;
                border-radius: 0.25em;
                border-collapse: collapse;
                margin: 1em;
                margin-left: 412px;
                margin-top: 650px;
                width: 68%;
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
    </head>
    <body>

        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Weight Slip Information</h3>
                </div>
                <div class="card-body">
                    <form action="WeghtSlipInformation.jsp" method="post">
                        <div class="form-group row">
                            <div class="col-md-4 ">
                                <label > Weight Slip Id</label>
                                <input type="number" name="txtweightslipid"  id="txtweightslipid" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>

                                <div class="col-md-4 ">
                                    <label>Cultivator Name</label>
                                    <% try {
                                            Rs1 = CVI.getCultivatorInformation();
                                    %>
                                    <select class="form-control" name="ddlCultivatorName" id="ddlCultivatorName">
                                        <%
                                            while (Rs1.next()) {
                                                cultivatorName = Rs1.getString("CultivatorName");
                                                cultivatorId = Rs1.getInt("CultivatorId");
                                        %>
                                        <option value="<%=cultivatorId%>"><%=cultivatorName%> </option>
                                        <% } %>
                                    </select>
                                    <%
                                        } catch (Exception sqe) {
                                            out.println(sqe);
                                        }
                                    %>
                                </div>
                            <div class="col-md-4 ">
                                <label for="ddlCategory"> Village Group Id</label>
                                <% try {
                                        Rs1 = VGI.getVillageGroupInformation();
                                %>
                                <select class="form-control" name="ddlVillageGroupName" id="ddlVillageGroupName">
                                    <%
                                        while (Rs1.next()) {
                                            villageGroupName = Rs1.getString("VillageGroupName");
                                            villageGroupNameid = Rs1.getInt("VillageGroupId");
                                    %>
                                    <option value="<%=villageGroupNameid%>"><%=villageGroupName%> </option>
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
                        <div class="form-group row">
                            <div class="col-md-4 ">  
                                <label >Partner Name</label>
                                <input type="text" name="txtpartnername"  id="txtpartnername" class="form-control" required="" maxlength="20"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4 ">  
                                <label>Transporter Name</label>
                                <input type="text" name="txttransportername"  id="txttransportername" class="form-control" required="" maxlength="20"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4 ">  
                                <label>Harvester Name</label>
                                <input type="text" name="txtharvestername"  id="txtharvestername" class="form-control" required="" maxlength="20"  onchange="return validateEmail();">
                            </div>
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="col-md-4 ">  
                                <label>Cane Cut Id</label>
                                <% try {
                                        Rs1 = CCSI.getCaneCutSlipInformation();
                                %>
                                <select class="form-control" name="ddlCaneCutSlipInformation" id="ddlCaneCutSlipInformation">
                                    <%
                                        while (Rs1.next()) {
                                            
                                            CaneCutSlipInformationId = Rs1.getInt("CaneCutId");
                                    %>
                                    <option value="<%=CaneCutSlipInformationId%>"><%=CaneCutSlipInformationId%></option>
                                    <% } %>
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
                            </div>
                            
                                <div class="col-md-4 ">
                                <label>Cultivator Type</label>
                                <% try {
                                        Rs1 = CVI.getCultivatorInformation();
                                %>
                                <select class="form-control" name="ddlCultivatoType" id="ddlCultivatorType">
                                    <%
                                        while (Rs1.next()) {
                                            cultivatorType = Rs1.getString("CultivatorType");
                                            cultivatorId = Rs1.getInt("CultivatorId");
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
                         
                            <div class="col-md-4 ">
                                <label for="ddlCategory"> Village Id</label>
                                <% try {
                                        Rs1 = VI.getVillageInformation();
                                %>
                                <select class="form-control" name="ddlVillageName" id="ddlVillageName">
                                    <%
                                        while (Rs1.next()) {
                                            village = Rs1.getString("VillageName");
                                            villageid = Rs1.getInt("VillageId");
                                    %>
                                    <option value="<%=villageid%>"><%=village%> </option>
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
                        <div class="form-group row">                            
                            <div class="col-md-4 ">  
                                <label >Water Supplier Name</label>
                                <input type="text" name="watersuppliername"  id="watersuppliername" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4 ">  
                                <label>Bank Name</label>
                                <input type="text" name="txtbankname"  id="txtbankname" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>

                            <!-- Drop down list box (ddl)-->
                            <div class="col-md-4"> 
                                <label>Vehicle Type</label>
                                <% try {

                                        Rs1 = Vi.getVehicleInformation();
                                %>
                                <select class="form-control" name="ddlVehicleType" id="ddlVehicleType">
                                    <%
                                        while (Rs1.next()) {
                                            vehicle = Rs1.getString("VehicleType");
                                            vehicleid = Rs1.getInt("VehicleId");
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
                        </div>
                        <br>

                        <!-- Drop down list box (ddl)-->

                        <div class="form-group row">                           
                            <div class="col-md-4 ">  
                                <label>Weight Slip Date</label>
                                <input type="date" name="txtweightslipDate"  id="txtweightslipDate" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>                            
                            <div class="col-md-4 ">  
                                <label>Cane Name</label>
                                <% try {
                                        Rs1 = CI.getCaneInformation();
                                %>
                                <select class="form-control" name="ddlCaneName" id="ddlCaneName">
                                    <%
                                        while (Rs1.next()) {
                                            CaneName = Rs1.getString("CaneName");
                                            CaneId = Rs1.getInt("CaneId");
                                    %>
                                    <option value="<%=CaneId%>"><%=CaneName%> </option>
                                    <% } %>
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
                            </div>


                            <!-- Drop down list box (ddl)-->
                            <div class="col-md-4 ">
                                <label for="ddlCategory"> Village Id</label>
                                <% try {
                                        Rs1 = VI.getVillageInformation();
                                %>
                                <select class="form-control" name="ddlVillageName" id="ddlVillageName">
                                    <%
                                        while (Rs1.next()) {
                                            village = Rs1.getString("VillageName");
                                            villageid = Rs1.getInt("VillageId");
                                    %>
                                    <option value="<%=villageid%>"><%=village%> </option>
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
                        <div class="form-group row">
                            <div class="col-md-4 ">  
                                <label>Water  Type</label>
                                <% try {
                                        Rs1 = WI.getWaterInformation();
                                %>
                                <select class="form-control" name="ddlVillageName" id="ddlVillageName">
                                    <%
                                        while (Rs1.next()) {
                                            WaterType = Rs1.getString("WaterType");
                                            WaterId = Rs1.getInt("WaterId");
                                    %>
                                    <option value="<%=WaterId%>"><%=WaterType%> </option>
                                    <% } %>
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
                            </div>
                            <div class="col-md-4 ">  
                                <label>Account No</label>
                                <input type="number" name="txtaccountno"  id="txtaccountno" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4 ">  
                                <label>Vehicle No</label>
                                <input type="text" name="txtvehicleno"  id="txtvehicleno" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                        </div>
                            <br>
                        <div class="form-group row">
                            <div class="col-md-4 ">  
                                <label>Cultivator Mobile No</label>
                                <input type="number" name="txtmobileno"  id="txtmobileno" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>                        
                        </div>
                        <br>
                        <!-- Buttons for Save, Update, and Delete -->
                        <input type="submit" name="btnSave" class="btn btn-success" value="Save">
                        <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                    </form>
                </div>
            </div> 
        </div>
        <div class="row">
            <div class="col-md-10">
                <table class="table-bordered">
                    <thead>
                        <tr>
                            <th>Weight slip id</th>
                            <th>Cultivator Name</th>                            
                            <th>Partner Name</th>                           
                            <th>Account No</th>
                            <th>Control</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int count = 1;
                            Rs = ws.getWeghtSlipInformation();
                            do {
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=Rs.getString(2)%></td>
                            <td><%=Rs.getString(4)%></td>
                            <td><%=Rs.getString(16)%></td>       
                            <td><a href="?delete=<%=Rs.getInt(1)%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
                        </tr>
                        <%
                                count++;
                            } while (Rs.next());
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
