<%-- 
    Document   : RegistrationForm
    Created on : 16 Jan 2025, 9:16:16 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            .card-body{
                background-color: lightblue;
            } 
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Sign up</h3>
                </div>
                <div class="card-body">
                    <form  onsubmit="return   data()">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <input type="text" name="txtFullName" id="txtFullName" class="form-control" >
                            </div>
                            <div class="col-md-4">
                                <label>Gender</label>
                                <input type="radio" name="txtGender" id="txtGender"  >
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Contact Number</label>
                                <input type="number" name="txtContactNumber" id="txtContactNumber" class="form-control">
                            </div>
                             <div class="col-md-4">
                                <label>Email Id</label>
                                <input type="email" name="txtEmailId" id="txtEmailId" class="form-control">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User Name</label>
                                <input type="text" name="txtUserName" id="txtUserName" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label>Password</label>
                                <input type="password" name="txtPassword" id="txtPassword" class="form-control">
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
