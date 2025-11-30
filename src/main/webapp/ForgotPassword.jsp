<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ashu.sugarcanebillingsystem.DataAccess"%>
<%@page import="java.sql.*"%>

<%
    String message = "";
    if (request.getParameter("resetPassword") != null) {
        String username = request.getParameter("username");

        try (Connection conn = DataAccess.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT Password FROM tbl_registration WHERE UserName = ?")) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String password = rs.getString("Password"); // Corrected column name
                message = "Your password is: " + password;  // In real applications, send an email instead.
            } else {
                message = "User not found!";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #aaa;
            width: 350px;
            text-align: center;
            margin-top: 100px;
        }
        h2 {
            color: #4CAF50;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
        .message {
            color: red;
        }
    </style>
</head>
<body>
    <%@include file="WEB-INF/Header.jsp" %>  
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="ForgotPassword.jsp" method="post">
            <label>Enter Username:</label>
            <input type="text" name="username" required>
            <button type="submit" name="resetPassword">Recover Password</button>
        </form>
        <p class="message"><%= message %></p>
        <a href="LogIn.jsp">Back to Login</a>
    </div>
</body>
</html>
