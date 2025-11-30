<%-- 
    Document   : CaneMaster
    Created on : 16 Dec 2024, 12:03:08 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Form.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script>
            var a=document.getElementById("").value;
            var b=document.getElementById("").value;
            var c=document.getElementById("").value;
            var d=document.getElementById("").value;
        </script>
        <!--Java Scripts End hear-->
    </head>
    <body>
         <div class="container">
            <div class="card product-form">
                <div class="card-header panel-heading">
                    <h3>Weight Slip Information</h3>
                </div>
                <div class="card-body">
                    <form action="frmProductMaster.jsp" method="post">                       
                         <div class="form-group row">
                            <label for="Brandid" class="col-md-3 col-form-label modal-label header">Weight Slip ID :</label>
                            <div class="col-md-3 ">
                                <input type="number" class="form-control" name="txtWeightSlipId" />
                            </div>
                            <label for="Categoryid" class="col-md-3 col-form-label modal-label header">Cultivator Name :</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="txtCultivatorName" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="ProductName" class="col-md-3 col-form-label modal-label header">Village Group Id</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="txtVillageGroupId" >
                            </div>

                            <label for="Purchaseprice" class="col-md-3 col-form-label modal-label header">Partner Name</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="txtPartnerName" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Productimgh" class="col-md-3 col-form-label modal-label header">Transporter Name</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control-file"  name="txtTransporterName">
                            </div>

                            <label for="Salesprice" class="col-md-3 col-form-label modal-label header">Harvester Name</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="txtHarvesterName" >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="Tax" class="col-md-3 col-form-label modal-label header">Can Cut ID</label>
                            <div class="col-md-3 ">
                                <input type="text" class="form-control" name="txtCanCutId" />
                            </div>
                        </div>

                        <!-- Buttons for Save, Update, and Delete -->
                        <div class="btn-toolbar" style="padding-top:40px;">
                            <span><button type="button" class="btn btn-success btn-view-all btn mr-3">Save</button></span>
                            <span><button type="button" class="btn btn-warning btn-view-all btn mr-3">Update</button></span>
                            <span><button type="button" class="btn btn-danger btn-view-all">Cancel</button></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
