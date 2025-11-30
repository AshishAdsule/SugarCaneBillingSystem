<%-- 
    Document   : Header
    Created on : 14 Dec 2024, 3:32:08 pm
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="NavBar.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            .dropdown_menu ul li {
                color: black;
            }
        </style>
    </head>
    <body>
         <div class="menu_bar">
             <a href="Information.jsp">   <h1 class="logo">Sugarcane<span>Factory</span></h1></a>
        <ul>
            <li><a href="index.jsp">Home Page</a></li>
            <li><a href="">Master <i class="fas fa-caret-down"></i></a>
                <div class="dropdown_menu">
                    <ul>
                        <li><a href="CaneInformation.jsp">Cane Master</a></li>
                        <li><a href="CultivatorInformation.jsp">Cultivator Master</a></li>
                        <li><a href="HarvestorInformation.jsp">Harvester Master</a></li>
                        <li><a href="VehicleInformation.jsp">Vehicle Master</a></li>
                        <li><a href="TrasnportInformation.jsp">Transport Master</a></li>
                        <li><a href="VillageInformation.jsp">Village Master</a></li>
                        <li><a href="WaterInformation.jsp">Water Information</a></li>
                    </ul>
                </div>
                </li>
            <li><a href="Registration.jsp">Cane Registration</a></li>
            <li><a href="WeghtSlipInformation.jsp">Weight Information</a></li>
            <li><a href="CaneBillInformation.jsp">Cane Bill</a></li>
            <li><a href="">Reports <i class="fas fa-caret-down"></i></a>
                <div class="dropdown_menu">
                    <ul>
                        <li><a href="CaneCutSlipReport.jsp">Cane Cut Slip Report</a></li>
                        <li><a href="CaneBillReport.jsp">Cane Bill Report</a></li>
                        <li><a href="WeghtSlipReport.jsp"targate="_blank">Weight Slip Report</a></li>
                    </ul>
                </div>
                </li>
            <li><a href="ForgotPassword.jsp">Help</a></li>
            <li><a href="LogOut.jsp">LogOut</a>
        </ul>
    </div>
    </body>
</html>
