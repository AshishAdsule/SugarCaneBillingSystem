<%-- 
    Document   : CanCutSlipInformation
    Created on : 12 Dec 2024, 1:00:40 pm
    Author     : ASUS
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneCutSlipInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet rs;
    CaneCutSlipInformation CCSI = new CaneCutSlipInformation();
%>
<%
    if (request.getParameter("btnSave") != null) {
        try {
            CCSI.setCultivatorName(request.getParameter("txtCultivatorName"));
            CCSI.setPartnerName(request.getParameter("txtPartnerName"));
            CCSI.setVillageGroupId(request.getParameter("txtVillageGroupId"));
            CCSI.setHarvesterName(request.getParameter("txtHarvesterName"));
            CCSI.setTransportName(request.getParameter("txtTransportName"));
            CCSI.setCaneCutDate(request.getParameter("txtCaneCutDate"));
            CCSI.setCultivatorType(request.getParameter("txtCultivatorType"));
            CCSI.setWaterSupplierName(request.getParameter("txtWaterSupplierName"));
            CCSI.setVillageId(request.getParameter("txtVillageId"));
            CCSI.setTotalArea(Double.parseDouble(request.getParameter("txtTotalArea")));
            CCSI.setVehicleType(request.getParameter("txtVehivleType"));
            CCSI.setLaganKhodvaDate(request.getParameter("txtLaganKhodvaDate"));
            CCSI.setCaneType(request.getParameter("txtCaneType"));
            CCSI.setWaterType(request.getParameter("txtWaterType"));
            CCSI.setCaneName(request.getParameter("txtCaneName"));
            CCSI.setGatNo(Integer.parseInt(request.getParameter("txtGatNo")));
            CCSI.setVehicleNo(request.getParameter("txtVehicleNo"));
            CCSI.InsertUser(CCSI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <script>
            function data(){
                var a=document.getElementById("txtCultivatorName");
                var b=document.getElementById("txtPartnerName");
                var c=document.getElementById("txtVillageGroupId");
                var d=document.getElementById("txtHarvesterName");
                var e=document.getElementById("txtTransportName");
                var f=document.getElementById("txtCaneCutDate");
                var g=document.getElementById("txtCultivatorType");
                var h=document.getElementById("txtWaterSupplierName");
                var i=document.getElementById("txtVillageId");
                var j=document.getElementById("txtTotalArea");
                var k=document.getElementById("txtVehivleType");
                var l=document.getElementById("txtLaganKhodvaDate");
                var m=document.getElementById("txtCaneType");
                var n=document.getElementById("txtWaterType");
                var o=document.getElementById("txtCaneName");
                var p=document.getElementById("txtGatNo");
                var q=document.getElementById("txtVehicleNo");
                if(a===""||b===""||c===""||d===""||e===""||f===""||g===""||h===""||i===""||j===""||k===""||l===""||m==""||n===""||o===""||p===""||q==="")
                {
                  alert("All fields are mendatory");
                    return false;
                } else {
                    true;
                }   
                
            }
        </script>
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Can Cut Slip Information</h3>
                </div>
                <div class="card-body">
                    <form action="CanCutSlipInformation.jsp" method="post" onsubmit="data()">                
                        <div class="row">
                            <div class="col-md-4">
                                <label>Cane Cute Id</label>
                                <input type="text" name="txtCaneCuteId" id="txtCaneCuteId" class="form-control">
                            </div>
                            
                                <label>Cane Cut Date</label>
                                <input type="date" name="txtCaneCutDate"id="txtCaneCutDate" class="form-control">
                            
                            <div class="col-md-4">
                                <label>Lagan Khodva Date</label>
                                <input type="Date" name="txtLaganKhodvaDate" id="txtLaganKhodvaDate" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Cultivator Name</label>
                                <input type="text" name="txtCultivatorName" id="txtCultivatorName" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Cultivator Type</label>
                                <input type="text" name="txtCultivatorType"id="txtCultivatorType" class="form-control">
                            </div>
                             <div class="col-md-4">
                                <label>Cane Type</label>
                                <input type="text" name="txtCaneType"id="txtCaneType" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                             <div class="col-md-4">
                                <label>Partner Name</label>
                                <input type="text" name="txtPartnerName"id="txtPartnerName" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Water Supplier Name</label>
                                <input type="text" name="txtWaterSupplierName"id="txtWaterSupplierName" class="form-control">
                            </div>
                            <div class="col-md-4">
<!--                                Drop Down Box Required-->
                                <label>Water Type</label>
                                <input type="text" name="txtWaterType"id="txtWaterType" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Village Group Id</label>
                                <input type="number" name="txtVillageGroupId"id="txtVillageGroupId" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Village Id</label>
                                <input type="number" name="txtVillageId"id="txtVillageId" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Cane Name</label>
                                <input type="text" name="txtCaneName"id="txtCaneName" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Harvester Name</label>
                                <input type="text" name="txtHarvesterName"id="txtHarvesterName" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Total Area</label>
                                <input type="number" name="txtTotalArea"id="txtTotalArea" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Gat No</label>
                                <input type="number" name="txtGatNo"id="txtGatNo" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Transport Name</label>
                                <input type="text" name="txtTransportName"id="txtTransportName" class="form-control">
                            </div>
                            <div class="col-md-4">
                            <!-- Drop Down Box Required-->
                                <label>Vehicle Type</label>
                                <input type="text" name="txtVehivleType"id="txtVehivleType" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Vehicle No</label>
                                <input type="text" name="txtVehicleNo"id="txtVehicleNo" class="form-control">
                            </div>
                        </div>
                        <br>
                        <input type="submit" value="Save" name="btnSave" class="btn btn-success">
                        <input type="submit" value="Update" name="btnUpdate" class="btn btn-primary">
                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                    </form>
                </div>
            </div>
    </div>
    </body>
</html>
