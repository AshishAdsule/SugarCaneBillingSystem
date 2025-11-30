<%-- 
    Document   : PageExample
    Created on : 4 Jan 2025, 3:12:40 pm
    Author     : ASUS
--%>

<%@page import="com.ashu.sugarcanebillingsystem.CaneInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.PageExample.pagingExample"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    int page1 = 1;
    int recordsPerPage = 3;

    if (request.getParameter("page1") != null) {
        page1 = Integer.parseInt(request.getParameter("page1"));
    }

    CaneInformation dao = new CaneInformation();
    List<CaneInformation> pe = dao.getEmployees(page1, recordsPerPage);
    int noOfRecords = dao.getNumberOfRows();
    int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
%>

<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h2>Employee List</h2>
    <table border="1" width="50%">
        <tr>
            <th>ID</th>
            <th>Name</th>
          
        </tr>
        <%
            for (CaneInformation p : pe) {
        %>
        <tr>
            <td><%= p.getCaneId()%></td>
            <td><%= p.getCaneName()%></td>
            
        </tr>
        <%
            }
        %>
    </table>
    <%
        for (int i = 1; i <= noOfPages; i++) {
    %>
        <a href="pagingdemo.jsp?page1=<%= i %>"><%= i %></a>
    <%
        }
    %>
</body>
</html>
    </body>
</html>
