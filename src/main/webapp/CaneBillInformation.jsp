<%-- 
    Document   : CaneBillInformation
    Created on : 7 Dec 2024, 8:23:04 pm
    Author     : ASUS
--%>
<%@page import="com.ashu.sugarcanebillingsystem.VillageInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.VillageGroupInformation"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneBillInformation"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet Rs;
    CaneBillInformation CB = new CaneBillInformation();

%>
<%    ResultSet Rs1;
    VillageInformation VI = new VillageInformation();
    String village;
    int villageid;
%>

<%
    if (request.getParameter("btnSave") != null) {
        try {
            CB.setBillDate(request.getParameter("txtBillDate"));
            CB.setAccountHolderName(request.getParameter("txtAccountHolderName"));
            CB.setBillPassDate(request.getParameter("txtBillPassDate"));
            CB.setVillageName(request.getParameter("ddlVillageName"));
            CB.setCultivatorId(Integer.parseInt(request.getParameter("txtCultivatorId")));
            CB.setBankName(request.getParameter("txtBankName"));
            CB.setAccountNo(Integer.parseInt(request.getParameter("txtAccountNo")));
            CB.setCaneNetWeight(Integer.parseInt(request.getParameter("txtCaneNetWeight")));
            CB.setTotalAmount(Double.parseDouble(request.getParameter("txtTotalAmoutn")));
            CB.setCaneRate(Double.parseDouble(request.getParameter("txtCaneRate")));
            CB.setNetAmount(Double.parseDouble(request.getParameter("txtNetAmount")));
            CB.setCultivatorMobileNo(request.getParameter("txtCultivatorMobileNo"));
            CB.InsertUser(CB);
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>
<%    if (request.getParameter("btnUpdate") != null) {
        try {
            CB.setBillDate(request.getParameter("txtBillDate"));
            CB.setAccountHolderName(request.getParameter("txtAccountHolderName"));
            CB.setBillPassDate(request.getParameter("txtBillPassDate"));
            CB.setVillageName(request.getParameter("txtVillageName"));
            CB.setCultivatorId(Integer.parseInt(request.getParameter("txtCultivatorId")));
            CB.setBankName(request.getParameter("txtBankName"));
            CB.setAccountNo(Integer.parseInt(request.getParameter("txtAccountNo")));
            CB.setCaneNetWeight(Integer.parseInt(request.getParameter("txtCaneNetWeight")));
            CB.setTotalAmount(Double.parseDouble(request.getParameter("txtTotalAmoutn")));
            CB.setCaneRate(Double.parseDouble(request.getParameter("txtCaneRate")));
            CB.setNetAmount(Double.parseDouble(request.getParameter("txtNetAmount")));
            CB.setCultivatorMobileNo(request.getParameter("txtCultivatorMobileNo"));
            CB.setBillId(Integer.parseInt(request.getParameter("txtBillId")));
            CB.updateCaneBillInformation(CB);
        } catch (Exception ex) {
            out.print(ex);
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
            .product-form{
                background-color: lightblue;
                color: black;
            }
            .panel-heading{
                background-color: #007bff;
                color: white;
            }
            .card-body{
                background-color: lightblue;
            }
        </style>
        <script>
            function validationName(str) {

                if (str === null || str === "") {
                    var id1 = document.getElementById('validationerror');
                    id1.innerHTML = "This fild is required";
                    alert("All Fields are Mendatory");

                    id1.style.color = "red";

                } else {
                    document.getElementById('validationerror').innerHTML = "";
                }
            }
            function data() {
                var a = document.getElementById("txtBillId");
                var b = document.getElementById("txtBillDate");
                var c = document.getElementById("txtAccountHolderName");
                var d = document.getElementById("txtBillPassDate");
                var e = document.getElementById("ddlCategory");
                var f = document.getElementById("txtCultivatorId");
                var g = document.getElementById("txtBankName");
                var h = document.getElementById("txtaccountNo");
                var i = document.getElementById("txtCaneNetWeight");
                var j = document.getElementById("txtTotalAmount");
                var k = document.getElementById("txtCaneRate");
                var l = document.getElementById("txtNetAmount");
                var m = document.getElementById("txtCultivatorMobileNo");

                if (a === "" || b === "" || c === "" || d === "" || e === "" || f === "" || g === "" || h === "" || i === "" || j === "" || k === "" || l === "" || m == "")
                {
                    alert("All fields are mendatory");
                    return false;
                } else {
                    true;
                }
            }
            function calculateTotal() {
                // Get input values
                const CaneNetWeight = parseFloat(document.getElementById("txtCaneNetWeight").value) || 0;
                const caneRate = parseFloat(document.getElementById("txtCaneRate").value) || 0;

                /// Calculate net weight in tons (1 ton = 1000 kg)
                const netWeightTons = CaneNetWeight / 1000; // Convert kg to tons

                // Calculate total amount
                const totalAmount = CaneNetWeight * caneRate; // Total amount in currency

                // Display results
                document.getElementById("txtTotalAmount").value = totalAmount.toFixed(2); // Total amount in 2 decimal places
                document.getElementById("txtNetAmount").value = totalAmount.toFixed(2); // Net weight in tons
            }

        </script>
    </head>
    <body>
        <%@include file="WEB-INF/Header.jsp" %>
        <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Cane Bill Information</h3>
                </div>
                <div class="card-body">
                    <form onsubmit="return   data()" method="post">
                        <div class="row">
                            <div class="col-md-4">
                                <label>BIll ID</label>
                                <input type="number" name="txtBillId" id="txtBillId" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4">
                                <label>Bill Date</label>
                                <input type="date" name="txtBillDate"  id="txtBillDate" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4 form-group"> 
                                <label for="ddlCategory"> Village Name</label>
                                <% try {

                                        Rs1 = VI.getVillageInformation();
                                %>
                                <select class="form-control" name="ddlVillageName" id="ddlVillageName">
                                    <%
                                        while (Rs1.next()) {
                                            village = Rs1.getString("VillageName");
                                            villageid = Rs1.getInt("VillageId");
                                    %>
                                    <option value="<%=villageid%>"><%=village%> </option>
                                    <% } %>
                                </select>
                                <%
                                    } catch (Exception sqe) {
                                        out.println(sqe);
                                    }
                                %>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Cultivator Mobile no</lable>
                                <input type="text" name="txtCultivatorMobileNo"  id="txtCultivatorMobileNo" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4">
                                <lable>Cultivator Id</lable>
                                <input type="number" name="txtCultivatorId"  id="txtCultivatorId" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                            <div class="col-md-4">
                                <lable>Account Holder Name</lable>
                                <input type="text" name="txtAccountHolderName"  id="txtAccountHolderName" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div> 
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Bank Name</lable>
                                <span id="validationerror"></span>
                                <input type="text" name="txtBankName"  id="txtBankName" class="form-control" onkeyup="validationName(this.value)">
                            </div>
                            <div class="col-md-4">
                                <lable>Cane Rate</lable>
                                <input type="number" name="txtCaneRate"  id="txtCaneRate" class="form-control" oninput="calculateTotal()" required>
                            </div>
                            <div class="col-md-4">
                                <lable>Cane Net Weight </lable>
                                <input type="number" name="txtCaneNetWeight"  id="txtCaneNetWeight" class="form-control" oninput="calculateTotal()" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Total Amount</lable>
                                <input type="text" name="txtTotalAmoutn"  id="txtTotalAmount" class="form-control" readonly>
                            </div>
                            <div class="col-md-4">
                                <lable>Net Amount</lable>
                                <input type="text" name="txtNetAmount"  id="txtNetAmount" class="form-control" readonly>
                            </div>
                            <div class="col-md-4">
                                <lable>Account No</lable>
                                <input type="number" name="txtAccountNo"  id="txtaccountNo" class="form-control" required="" maxlength="12"  onchange="return validateEmail();">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">
                                <lable>Bill Pass Date</lable>
                                <input type="date" name="txtBillPassDate"  id="txtBillPassDate" class="form-control" required="" maxlength="10"  onchange="return validateEmail();">
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12  form-group"> 
                            <input type="submit" value="Save" name="btnSave" class="btn btn-success">
                            <input type="submit" value="Update" name="btnUpdate" class="btn btn-warning">
                            <input type="submit" value="Delete" name="btnDelet" class="btn btn-danger">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html> 