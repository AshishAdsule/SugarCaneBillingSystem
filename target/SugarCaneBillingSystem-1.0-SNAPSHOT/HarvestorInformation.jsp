<%-- 
    Document   : HarvestorInformation
    Created on : 7 Dec 2024, 9:27:25 pm
    Author     : ASUS
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ashu.sugarcanebillingsystem.HarvestorInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    HarvestorInformation bg = new HarvestorInformation();
    int MaxId;
    String HarvesterName;
    // MaxId code
    void getMaxID() {
        try {
            rs = bg.getHarvestorid();
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
            bg.setHarvestorName(request.getParameter("txtname"));
            bg.setHarvestorAddress(request.getParameter("txtaddress"));
            bg.setTotalWorkers(Integer.parseInt(request.getParameter("txtworkers")));
            bg.InsertUser(bg);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            bg.setHarvestorName(request.getParameter("txtname"));
            bg.setHarvestorAddress(request.getParameter("txtaddress"));
            bg.setTotalWorkers(Integer.parseInt(request.getParameter("txtworkers")));
            bg.setHarvestorId(Integer.parseInt(request.getParameter("txtid")));
            bg.updateHarvestorInformation(bg);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    
    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            bg.deleteCaneInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
    //    Edit code
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));
            ResultSet rs = bg.getHarvestorInformation (eid);
            MaxId = rs.getInt(1);
            HarvesterName = rs.getString(2);

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
        <link href="Style1.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
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
                if (str === null || str === "") {
                    var id1 = document.getElementById('txtaddress');
                    id1.innerHTML = "This fild is required";
                    alert("All Fields are Mendatory");

                    id1.style.color = "red";

                } else {
                    document.getElementById('txtaddress').innerHTML = "";
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
        <%@include file="WEB-INF/Header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Harvestor Master</h3>
                </div>
                <div class="card-body">
                    <form onsubmit="data() action="HarvestorInformation.jsp" method="post" >
                        <div class="row">
                            <div class="col-md-6">
                                 <lable>Harvester Id</lable>
                                <input type="number" name="txtid"  id="txtid" class="form-control" value='<%=MaxId%>'>
                            </div>
                            <div class="col-md-6">
                                <lable>Harvester Name</lable>
                                <span id="validationerror"></span>
                                <input type="text" name="txtname" id="txtname"class="form-control" onkeyup="validationName(this.value)">
                            </div>

                        </div>
                            <br>
                        <div class="row">
                            <div class="col-md-6">
                                 <label>Harvester Address</label>
                                <span id="txtaddress"></span>
                                <input type="text" name="txtaddress"  id="txtaddress" class="form-control" onkeyup="validationName(this.value)">
                            </div>
                            <div class="col-md-6">
                                 <label>Total workers </label>
                                <input type="number" name="txtworkers"  id="txtworkers" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
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
                            <th>Harvester Name</th>
                            <th>Harvester Address</th>
                            <th>Total Workers</th>
                            <th>Control</th>
                            <th>Control</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int count = 1;
                            rs = bg.getHarvestorInformation();
                            do {
                        %>
                        <tr>
                            <td><%=count%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getInt(4)%></td>
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
