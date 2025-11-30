<%-- 
    Document   : WaterInformation
    Created on : 8 Dec 2024, 7:18:24 pm
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.WaterInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    WaterInformation WI = new WaterInformation();
    int MaxId;
    String WaterType;
    // MaxId code
    void getMaxID() {
        try {
            rs = WI.getWaterid();
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
            WI.setWaterType(request.getParameter("txtname"));
            WI.InsertUser(WI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    if (request.getParameter("btnUpdate") != null) {
        try {
            WI.setWaterType(request.getParameter("txtname"));
            WI.setWaterId(Integer.parseInt(request.getParameter("txtnumber")));
            WI.updateWaterInformation(WI);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }
 if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            WI.deleteWaterInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
    //    Edit code
    if (request.getParameter("edit") != null) {

        try {

            int eid = Integer.parseInt(request.getParameter("edit"));
            ResultSet rs = WI.getWaterInformation(eid);
            MaxId = rs.getInt(1);
            WaterType = rs.getString(2);
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
                    
                    alert("All Fields are Mendatory");
                    id1.innerHTML = "This fild is required";
                    id1.style.color = "red";

                } else {
                    document.getElementById('validationerror').innerHTML = "";
                }
            }
            function data()
            {
                var a = document.getElementById("txtnumber").value;
                var b = document.getElementById("txtname").value;
                if (a === "" || b === "")
                {
                    alert("All fields are mendatory");
                    return false;
                } else {
                    alert("Data Inserted..");
                    true;
                }
            }
        </script>
        <%@include file="WEB-INF/Header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Water Information </h3>
                </div>
                <div class="card-body">
                    <form onsubmit="return   data()" method="post">
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Water Id</lable>
                                <input type="number" name="txtnumber"  id="txtnumber" class="form-control" value='<%=MaxId%>'>
                            </div> 
                            <br>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Water Type</lable>
                                <span id="validationerror"></span>
                                <input type="text" name="txtname"  id="txtname" class="form-control" onkeyup="validationName(this.value)">
                            </div>
                        </div>
                        <br>
                        <div class="row"> 
                            <div class="col-md-12  form-group"> 
                                <input type="submit" value="Save" name="btnSave" class="btn btn-success">
                                <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
<!--                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">-->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <table class=" table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Water Type</th>
                    <th>Control</th>
                    <th>Control</th>
                </tr>
            </thead>
            <tbody>
                <%  int count = 1;
                    rs = WI.getWaterInformation();
                    do{
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
