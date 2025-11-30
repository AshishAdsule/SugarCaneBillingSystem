<%-- 
    Document   : CaneInformation
    Created on : 7 Dec 2024, 8:42:50 pm
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    CaneInformation bg = new CaneInformation();
    String CaneName;
    // MaxId code
    int MaxId;

    void getMaxID() {
        try {
            rs = bg.getCaneid();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("SNO");
        } catch (Exception ex) {
        }
    }
%>
<%
    int page1 = 1;
    int recordsPerPage = 5;

    if (request.getParameter("page1") != null) {
        page1 = Integer.parseInt(request.getParameter("page1"));
    }

    CaneInformation dao = new CaneInformation();
    List<CaneInformation> pe = dao.getEmployees(page1, recordsPerPage);
    int noOfRecords = dao.getNumberOfRows();
    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
%>
<%
//    Save code
    getMaxID();
    if (request.getParameter("btnSave") != null) {
        try {
            bg.setCaneName(request.getParameter("txtname"));
            bg.InsertUser(bg);
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            bg.setCaneName(request.getParameter("txtname"));
            bg.setCaneId(Integer.parseInt(request.getParameter("txtCaneId")));
            bg.updateBloodGroups(bg);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Delete Code
    if (request.getParameter("delete") != null) {
        out.print(request.getParameter("delete"));
        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            bg.deleteCaneInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }

    // Edit Code
    if (request.getParameter("edit") != null) {
        try {

            int eid = Integer.parseInt(request.getParameter("edit"));

            ResultSet rs = bg.getCaneInformationid(eid);
            MaxId = rs.getInt(1);
            CaneName = rs.getString(2);

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
        <link href="css/bootstrap.css
              " rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <script src="JavaScriptValidation.js" type="text/javascript"></script>
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
                var a = document.getElementById("txtCaneId").value;
                var b = document.getElementById("txtCaneName").value;
                if (a === "" || b === "")
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
                    <h3>Cane Information</h3>
                </div>
                <div class="card-body">
                    <form  onsubmit="return   data()">
                        <div class="form-group row">
                            <label for="Brandid" class="col-md-3 col-form-label modal-label header">Cane Id</label>
                            <div class="col-md-3 ">
                                <input type="number" class="form-control" name="txtCaneId" id="txtCaneId" value='<%=MaxId%>'>
                            </div> 
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="ProductName" class="col-md-3 col-form-label modal-label header">Cane Name</label>
                            <div class="col-md-3 ">
                                <span id="validationerror"></span>
                                <input type="text" class="form-control" name="txtname" id="txtCaneName" onkeyup="validationName(this.value)">
                            </div> 
                        </div>
                        <br>
                        <input type="submit" name="btnSave" class="btn btn-success" value="Save">
                        <input type="submit" name="btnUpdate" class="btn btn-warning" value="Update">
                        <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                    </form>
                </div>        
                <table class=" table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cane Name</th>
                            <th>Control</th>
                            <th>Control</th>
                        </tr>
                        <%
                            int count=0;
                            for (CaneInformation p : pe) {
                            count++;
                        %>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%=count%></td>
                            <td><%=p.getCaneName()%></td>                                
                            <td><a href="?edit=<%=p.getCaneId()%>" class="btn btn-outline-danger btn-sm">Edit</a></td>
                            <td><a href="?delete=<%=p.getCaneId()%>" class="btn btn-outline-danger btn-sm">Delete</a></td>

                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <ul>
                    <%
                        for (int i = 1; i <= noOfPages; i++) {
                    %>
                    <li class="pagination">
                        <a class="pagination-item  btn btn-outline-primary mx-1" href="CaneInformation.jsp?page1=<%= i%>"><%= i%></a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
        <style>
            .pagination {
                display: inline;
                list-style: none
            }
        </style>
    </body>
</html>