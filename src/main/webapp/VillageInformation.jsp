<%-- 
    Document   : VillageInformation
    Created on : 13 Dec 2024, 10:50:17 pm
    Author     : ASUS
--%>

<%@page import="com.ashu.sugarcanebillingsystem.VillageInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    ResultSet rs;
    VillageInformation VI = new VillageInformation();
    String VillageName;
    int MaxId;
    // MaxId code

    void getMaxID() {
        try {
            rs = VI.getVillageid();
            //out.print(rs.getInt(1));
            MaxId = rs.getInt("SNO");
        } catch (Exception ex) {
        }
    }
%>
<%
    //Save Code
    getMaxID();
    if (request.getParameter("btnSave") != null) {
        try {
            VI.setVillageName(request.getParameter("txtVillageName"));
            VI.InsertUser(VI);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
    // Update Code
    if (request.getParameter("btnUpdate") != null) {
        try {
            VI.setVillageName(request.getParameter("txtVillageName"));
            VI.setVillageId(Integer.parseInt(request.getParameter("txtVillageId")));
            VI.updateVillageInformation(VI);
            getMaxID();
        } catch (Exception ex) {
            out.print(ex);
        }
    }

    // Delete Code
    if (request.getParameter("delete") != null) {

        try {

            int id = Integer.parseInt(request.getParameter("delete"));

            VI.deleteVillageInformation(id);
        } catch (Exception ex) {

            out.println(ex);
        }
    }
     // Edit Code
    if (request.getParameter("edit") != null) {
        try {

            int eid = Integer.parseInt(request.getParameter("edit"));

            ResultSet rs = VI.getVillageInformation(eid);
            MaxId = rs.getInt(1);
            VillageName = rs.getString(2);

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
                background-color:lightblue;
            }
            table{
                margin-top: 200px;
                margin-left: 150px;
            }
        </style>
        <%@include file="WEB-INF/Header.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="container">
                <div class="card product-form">
                    <div class="card-header panel-heading">
                        <h3>Village Information </h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Village Id</label>
                                    <input type="number" name="txtVillageId" class="form-control" value='<%=MaxId%>'>
                                </div>
                                    <div class="col-md-4">
                                    <label>Village Name</label>
                                    <input type="text" name="txtVillageName" class="form-control">
                                </div>
                            </div>
                                <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="submit" name="btnSave" id="btnSave" value="Save" class="btn btn-success">
                                    <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                                    <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <table class=" table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>village Name</th>
                            <th>Control</th>
                            <th>Control</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  int count = 1;
                            rs = VI.getVillageInformation();
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
