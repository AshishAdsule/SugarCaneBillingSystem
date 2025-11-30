<%-- 
    Document   : LogOut
    Created on : 11 Jan 2025, 10:29:47 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Invalidate the current session
    session.invalidate();
    
    // Redirect to the login page
    response.sendRedirect("FirstPage.jsp"); // Change "demo1.jsp" to your actual login page filename if different
%>
