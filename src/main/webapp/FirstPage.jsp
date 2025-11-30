<%-- 
    Document   : FirstPage
    Created on : 6 Jan 2025, 12:09:51 pm
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugarcane Billing System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image:url(images/scProject2.jpg);
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        h1 {
            color: #4CAF50;
        }
        p {
            color: #555;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background: #45a049;
        }
    </style>
    
</head>
<body>
    
    <div class="container">
        <form action="Demo.jsp" method="post">
        <h1>Welcome to the Sugarcane Billing System</h1>
        <p>Please log in to access the system.</p>
        <a href="LogIn.jsp" class="btn">Login</a>
        <a href="AdminRegistration.jsp" class="btn">Register</a>
        </form>
    </div>
</body>
</html>

