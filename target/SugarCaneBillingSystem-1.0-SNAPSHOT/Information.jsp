<%-- 
    Document   : Information
    Created on : 28 Feb 2025, 9:45:27 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sugarcane Factory Billing System</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            margin-top: 50px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #aaa;
        }
        h1 {
            color: #4CAF50;
            text-align: center;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        li {
            padding: 8px 0;
        }
    </style>
</head>
<body>
    <%@include file="WEB-INF/Header.jsp" %>
    <div class="container">
        <h1>Sugarcane Factory Billing System</h1>
        <p>
            The <b>Sugarcane Factory Billing System</b> is designed to manage and streamline the process of recording, processing, and billing sugarcane deliveries efficiently. 
        </p>
        
        <h3>Key Features:</h3>
        <ul>
            <li>✔ Automated calculation of sugarcane weight and price</li>
            <li>✔ Generate weight slips and invoices</li>
            <li>✔ Secure user authentication and role management</li>
            <li>✔ Search and filter records based on date and vehicle number</li>
            <li>✔ Generate reports for cultivators and suppliers</li>
            <li>✔ Easy data entry and retrieval</li>
        </ul> 
        <h3>Benefits:</h3>
        <ul>
            <li>✅ Reduces manual errors and ensures accuracy</li>
            <li>✅ Increases efficiency in record-keeping</li>
            <li>✅ Provides secure data storage and backup</li>
            <li>✅ Improves transparency between farmers and factories</li>
        </ul> 
        <h3>Contact Us:</h3>
        <p>
            For more details, please contact our support team at <b>support@sugarcanebilling.com</b> or visit our office.
        </p>
        <a href="index.jsp" class="btn btn-success">Back to Home</a>
    </div>
</body>
</html>
