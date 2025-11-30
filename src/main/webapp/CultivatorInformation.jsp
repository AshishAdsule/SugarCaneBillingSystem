<%-- 
    Document   : CultivatorInformation
    Created on : 24 Dec 2024, 9:57:51 am
    Author     : ASUS
--%>

<%@page import="com.ashu.sugarcanebillingsystem.CultivatorInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    CultivatorInformation CVI = new CultivatorInformation();
    int MaxId;
    String CultivatorName;
    // MaxId code
    void getMaxID() {
        try {
            rs = CVI.getCultivatorid();
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
            CVI.setCultivatorAddress(request.getParameter("txtCultivatorAddress"));
            CVI.setVillageGroupName(request.getParameter("txtVillageGroupName"));
            CVI.setBankName(request.getParameter("txBankName"));
            CVI.setCultivatorName(request.getParameter("txtCultivatorName"));
            CVI.setCultivatorType(request.getParameter("txtCultivatorType"));
            CVI.setTotalAreaOfCane(Double.parseDouble(request.getParameter("txtTitalAreaOfCane")));
            CVI.setAccountNo(Integer.parseInt(request.getParameter("txtnumber")));
            CVI.setCultivatorMobileNo(request.getParameter("txtCultivatorMobileNo"));
            CVI.InsertUser(CVI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            CVI.setCultivatorAddress(request.getParameter("txtCultivatorAddress"));
            CVI.setVillageGroupName(request.getParameter("txtVillageGroupName"));
            CVI.setBankName(request.getParameter("txBankName"));
            CVI.setCultivatorName(request.getParameter("txtCultivatorName"));
            CVI.setCultivatorType(request.getParameter("txtCultivatorType"));
            CVI.setTotalAreaOfCane(Double.parseDouble(request.getParameter("txtTitalAreaOfCane")));
            CVI.setAccountNo(Integer.parseInt(request.getParameter("txtnumber")));
            CVI.setCultivatorMobileNo(request.getParameter("txtCultivatorMobileNo"));
            CVI.setCultivatorId(Integer.parseInt(request.getParameter("txtCultivatorId")));
            CVI.updateCultivatorInformation(CVI);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            CVI.deleteCultivatorInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
//    Edit code
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));
            ResultSet rs = CVI.getCultivatorInformation(eid);
            MaxId = rs.getInt(1);
            CultivatorName = rs.getString(2);
        } catch (Exception ex) {

            out.println(ex);
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
            function validationName(str) {

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
                var a = document.getElementById("txtCultivatorId").value;
                var b = document.getElementById("txtCultivatorAddress").value;
                var c = document.getElementById("txtVillageGroupName").value;
                var d = document.getElementById("txtBankName").value;
                var e = document.getElementById("txtCultivatorName").value;
                var f = document.getElementById("txtCultoivatorType").value;
                var g = document.getElementById("txtAreaofCane").value;
                var h = document.getElementById("txtAccountNo").value;
                var i = document.getElementById("txtCultivatorMobileNo").value;
                        if (a === "" || b === "" c === "" || d === "" || e === "" || f === "" || g === "" || h === "" || i === = "")
                {
                    alert("All fields are mendatory");
                    return false;
                }
                else {
                alert("Data Iserted...");
                true;
                }
            }
        </script>
        <title>JSP Page</title>
        <%@include file="WEB-INF/Header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Cultivator Information</h3>
                </div>
                <div class="card-body">
                    <form onsubmit="return   data()" method="post"> 
                        <div class="row">
                            <div class="col-md-4">
                                <label>Cultivator Id</label>
                                <input type="number" name="txtCultivatorId"  id="txtCultivatorId" class="form-control" value='<%=MaxId%>'>
                            </div>

                            <div class="col-md-4">
                                <label>Cultivator Name</label>
                                <span id="validationerror"></span>
                                <input type="text" name="txtCultivatorName"  id="txtCultivatorName" class="form-control" onkeyup="validationName(this.value)">
                            </div>
                            <div class="col-md-4">
                                <label>Cultivator Type</label>
                                <input type="text" name="txtCultivatorType"  id="txtCultoivatorType" class="form-control" >
                            </div>
                        </div>
                            <br>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Cultivator Address</label>
                                <input type="text" name="txtCultivatorAddress"  id="txtCultivatorAddress" class="form-control" >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Bank Name</label>
                                <input type="text" name="txBankName"  id="txtBankName" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Account No</label>
                                <input type="number" name="txtnumber"  id="txtAccountNo" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Village Group Name</label>
                                <input type="text" name="txtVillageGroupName"  id="txtVillageGroupName" class="form-control" >
                            </div>

                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Total Area Of Cane</label>
                                <input type="number" name="txtTitalAreaOfCane"  id="txtAreaofCane" class="form-control" >
                            </div> 
                            
                            <div class="col-md-4">
                                <label>Cultivator Mobile No</label>
                                <input type="number" name="txtCultivatorMobileNo"  id="txtCultivatorMobileNo" class="form-control">
                            </div>
                        </div>
                        <br>
                        <input type="submit" value="Save" name="btnSave" class="btn btn-success">
                        <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                        <input type="submit" value="Delete" name="delete" class="btn btn-danger">
                    </form>
                </div>
            </div>

            <table class=" table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cultivator Address</th>
                        <th>Village Group Name</th>
                        <th>Bank Name</th>
                        <th>Cultivator Name</th>
                        <th>Cultivator Type</th>
                        <th>Total Area Of Cane</th>
                        <th>Account No</th>
                        <th>Cultivator Mobile No</th>
                        <th>Control</th>
                        <th>Control</th>
                    </tr>
                </thead>
                <tbody>
                    <%  int count = 1;
                        rs = CVI.getCultivatorInformation();
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
                        <td><a href="?delete=<%=rs.getInt(1)%>" class="btn btn-outline-danger btn-sm">Delete</a></td>
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
