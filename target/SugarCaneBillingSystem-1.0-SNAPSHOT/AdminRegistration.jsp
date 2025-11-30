<%-- 
    Document   : AdminRegistration
    Created on : 4 Mar 2025, 11:08:05 am
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.AdminRegistration"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
ResultSet rs;
AdminRegistration ar=new AdminRegistration();
int getMaxID;
%>
<%
    //   Save code
    if (request.getParameter("btnSave") != null) {
        try {
            ar.setFullName(request.getParameter("txtfullName"));
            ar.setGender(request.getParameter("txtgender"));
            ar.setContactNumber(request.getParameter("txtcontactNumber"));
            ar.setEmailId(request.getParameter("txtemailId"));
            ar.setUserName(request.getParameter("txtusername"));
            ar.setPassword(request.getParameter("txtpassword"));
            ar.InsertAdmin(ar);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Registration</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <link href="NavBar.css" rel="stylesheet" type="text/css"/>
        <style>
            .panel-heading{
                background-color: blue;
            }
                .card-body{
                background-color: lightblue;
            
            }
            .btn-success{
                margin-left: 40%;
            }
            .login{
                margin-left: 30%;
            }
            .panel-heading{
                background-color: #007bff;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="menu_bar">
        <h1 class="logo">Sugarcane<span>Factory</span></h1>
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
            <li><a href="Information.jsp">Information</a></li>
            <li><a href="WeghtSlipInformation.jsp">Weight Information</a></li>
            <li><a href="">Reports <i class="fas fa-caret-down"></i></a>
                <div class="dropdown_menu">
                    <ul>
                        <li><a href="CaneCutSlipReport.jsp">Cane Cut Slip Report</a></li>
                        <li><a href="CaneBillReport.jsp">Cane Bill Report</a></li>
                        <li><a href="WeghtSlipReport.jsp">Weight Slip Report</a></li>
                    </ul>
                </div>
                </li>
            <li><a href="ForgotPassword.jsp">Help</a></li>
            <li><a href="LogOut.jsp">LogOut</a>
        </ul>
    </div>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Admin Registration</h3>
                </div>
                <div class="card-body">
                    <form action="AdminRegistration.jsp" method="post" onsubmit="return   data()">
                        <div class="row">
                            <div class="col-md-4">
                                <label class="form-label">Registration ID</label>
                                <input type="text" name="txtregistrationId" class="form-control" required>
                                <div class="invalid-feedback">Please enter a valid Registration ID.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="txtfullName" id="txtfullName" class="form-control" required>
                                <div class="invalid-feedback">Please enter your full name.</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Contact Number</label>
                                <input type="tel" name="txtcontactNumber"id="txtcontactNumber" class="form-control" pattern="[0-9]{10}" required>
                                <div class="invalid-feedback">Please enter a valid 10-digit contact number.</div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            
                            <div class="col-md-6">
                                <label class="form-label">Email ID</label>
                                <input type="email" name="txtemailId" id="txtemailId" class="form-control" required>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Username</label>
                                <input type="text" name="txtusername" id="txtusername" class="form-control" required>
                                <div class="invalid-feedback">Please enter a username.</div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-6">
                                <label class="form-label">Gender</label>
                                <select name="txtgender" id="txtgender" class="form-select" required>
                                    <option value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                                <div class="invalid-feedback">Please select a gender.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Password</label>
                                <input type="password" name="txtpassword" id="txtpassword" class="form-control" required>
                                <div class="invalid-feedback">Please enter a password.</div>
                            </div>
                        </div>
                        <br>
                        <input type="submit" name="btnSave" class="btn btn-success" value="Register">
                        <br>
                        <div class="login">
                        <a href="LogIn.jsp"> Account alrady created ? Login Here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
        // Bootstrap validation
            (function () {
                'use strict';
                var forms = document.querySelectorAll('.needs-validation');
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>

    </body>
</html>
