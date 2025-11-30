<%-- 
    Document   : Reports
    Created on : 24 Feb 2025, 9:29:31 am
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <style>
            .container{
                margin-left: 25%;
                margin-top: 15%;
                
            }
            .panel-heading{
                width:50%;
            }
            table {
                background: #fafafa;
                border-radius: 0.25em;
                border-collapse: collapse;
                margin: 1em;
                margin-left: 0px;
                margin-top: 50px;
                width: 50%;
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
                    <h1>Report of Cane</h1>
                </div>
                <table class=" table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cane Name</th>
                        </tr>
                        <%
                            for (CaneInformation p : pe) {
                        %>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%=p.getCaneId()%></td>
                            <td><%=p.getCaneName()%></td>                                
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
                        <a class="pagination-item  btn btn-outline-primary mx-1" href="Reports.jsp?page1=<%= i%>"><%= i%></a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </body>
</html>
