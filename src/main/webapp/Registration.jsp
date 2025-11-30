<%-- 
    Document   : Registration
    Created on : 5 Dec 2024, 9:32:07 pm
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.VillageInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ashu.sugarcanebillingsystem.RegistrationForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    RegistrationForm bg = new RegistrationForm();
     int MaxId;
    String BGroupName;
%>
<%
    ResultSet Rs1;
    VillageInformation VI = new VillageInformation();
    String village;
    int villageid;
   
%>
<%!

    void getMaxID() {
        try {
            rs = bg.getRegistrationForm();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("SNO");
        } catch (Exception ex) {
        }
    }


%>
<%
    if (request.getParameter("btnSave") != null) {
        try {
            bg.setCultivatorId(request.getParameter("txtcultivator"));
            bg.setCultivatorName(request.getParameter("txtcultivatorname"));
            bg.setVillageGroupId(request.getParameter("txtvillagegroup"));
            bg.setWaterSupplierName(request.getParameter("txtwater"));
            bg.setCaneId(request.getParameter("txtcane"));
            bg.setVillageName(request.getParameter("txtvillagename"));
            bg.setTotalAreaOfCane(request.getParameter("txtareaofcane"));
            bg.setRegistrationDate(request.getParameter("txtregistrationdate"));
            bg.setCultivatorType(request.getParameter("txtcultivatortype"));
            bg.setParthnerName(request.getParameter("txtpartnername"));
            bg.setVillageId(request.getParameter("txtvillageid"));
            bg.setWaterType(request.getParameter("txtwatertype"));
            bg.setCaneName(request.getParameter("txtcanename"));
            bg.setLaganKhodvaDate(request.getParameter("txtkhodvadate"));
            bg.setGatNo(request.getParameter("txtgatno"));
            bg.setCultivatorMobileNo(request.getParameter("txtmobileno"));
            bg.InsertUser(bg);
//            out.print("Saved !");
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    if (request.getParameter("btnUpdate") != null) {

        bg.setRegistrationId(Integer.parseInt(request.getParameter("txtRegestrationId")));
        bg.setCultivatorName(request.getParameter("txtcultivatorname"));
        bg.updateRegistrationForm(bg);
        getMaxID();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Style1.css" rel="stylesheet" type="text/css"/>
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
                margin-left: 0px;
                margin-top: 50px;
                width: 100%;
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
        <%@include file="WEB-INF/Header.jsp" %>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Cane Registration </h3>
                </div>
                <div class="card-body">
                    <form action="Registration.jsp" method="post">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Registration Id:-</label>
                                <input type="number" name="txtRegestrationId" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Cultivator Id:-</lable>
                                <input type="number" name="txtcultivator"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Cultivator Name:-</lable>
                                <input type="text" name="txtcultivatorname"class="form-control"  >
                            </div>
                        </div>            
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Village Group Id</lable>
                                <input type="text" name="txtvillagegroup"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Water Supplier Name</lable>
                                <input type="text" name="txtwater"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Cane Id</label>
                                <input type="number" name="txtcane"class="form-control">
                            </div>
                        </div> 
                        <br>
                        <div class="row">
                            <div class="col-md-4 form-group"> 
                                <label for="ddlCategory"> Village Name</label>
                                <% try {

                                        Rs1 = VI.getVillageInformation();
                                %>
                                <select class="form-control" name="ddlCategory" id="ddlCategory">

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

                            <div class="col-md-4">
                                <lable>Total Area Of Cane:-</lable>
                                <input type="text" name="txtareaofcane" class="form-control">
                            </div>  
                            <div class="col-md-4">
                                <lable>Registration Date:-</lable>
                                <input type="date" name="txtregistrationdate"class="form-control">
                            </div>
                        </div>
                              
                        <div class="row">
                            <div class="col-md-4">
                                <label>Cultivator Type:-</label>
                                <input type="text" name="txtcultivatortype"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Partner Name:-</lable>
                                <input type="text" name="txtpartnername"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lavle>Village Id:-</lavle>
                                <input type="text" name="txtvillageid"class="form-control">
                            </div>
                        </div> 
                                <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Water Type:-</lable>
                                <input type="text" name="txtwatertype"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Cane Name</lable>
                                <input type="text" name="txtcanename"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Lagan Khodva Date:-</lable>
                                <input type="date" name="txtkhodvadate"class="form-control">
                            </div>
                        </div> 
                                <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Gat No:-</lable>
                                <input type="number" name="txtgatno"class="form-control">
                            </div>
                            <div class="col-md-4">
                                <lable>Cultivator Mobile No:-</lable>
                                <input type="number" name="txtmobileno"class="form-control">
                            </div>
                        </div> 
                                <input type="Submit" value="Save" name="btnSave" class="btn btn-success">
                                <input type="submit" value="Update" name="btnUpdate" class="btn btn-primary">
                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
