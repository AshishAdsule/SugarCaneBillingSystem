<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.ashu.sugarcanebillingsystem.DataAccess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weight Slip Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<link href="NavBar.css" rel="stylesheet" type="text/css"/>

<body class="container mt-4">
 
    <h2 class="text-center">Weight Slip Information Report</h2>

    <!-- Search Form -->
    <form method="GET" class="row g-3">
        <div class="col-md-4">
            <label class="form-label">Village Name</label>
            <select name="villageId" class="form-control" required>
                <option value="">Select Village</option>
                <%
                    try {
                        Connection con = DataAccess.getConnection();
                        if (con != null) {
                            String villageQuery = "SELECT VillageId, VillageName FROM villageinformation ORDER BY VillageName";
                            PreparedStatement pstVillage = con.prepareStatement(villageQuery);
                            ResultSet rsVillage = pstVillage.executeQuery();
                            
                            while (rsVillage.next()) {
                %>
                                <option value="<%= rsVillage.getInt("VillageId") %>"><%= rsVillage.getString("VillageName") %></option>
                <%
                            }
                            rsVillage.close();
                            pstVillage.close();
                            con.close();
                        } else {
                            out.println("<option value=''>Database Error</option>");
                        }
                    } catch (Exception e) {
                        out.println("<option value=''>Error: " + e.getMessage() + "</option>");
                    }
                %>
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Vehicle Number</label>
            <input type="text" name="vehicleNo" class="form-control" required>
        </div>
        <div class="col-md-4">
            <label class="form-label">From Date</label>
            <input type="date" name="fromDate" class="form-control" required>
        </div>
        <div class="col-md-4">
            <label class="form-label">To Date</label>
            <input type="date" name="toDate" class="form-control" required>
        </div>
        <div class="col-md-4">
            <label class="form-label d-block">&nbsp;</label>
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
    </form>

    <hr>

    <!-- Display Results -->
    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Weight Slip ID</th>
                <th>Cultivator Name</th>
                <th>Village Name</th>
                <th>Partner Name</th>
                <th>Transporter Name</th>
                <th>Vehicle No</th>
                <th>Weight Slip Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve Parameters
                String villageId = request.getParameter("villageId");
                String vehicleNo = request.getParameter("vehicleNo");
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");

                if (villageId != null && vehicleNo != null && fromDate != null && toDate != null) {
                    try {
                        Connection con = DataAccess.getConnection();

                        if (con == null) {
                            out.println("<tr><td colspan='7' class='text-danger'>Database connection failed!</td></tr>");
                        } else {
                            // SQL Query
                            String query = "SELECT w.WeightSlipId, w.CultivatorName, v.VillageName, w.PartnerName, w.TransporterName, w.VehicleNo, w.WeightSlipDate " +
                                           "FROM weghtslipinformation w " +
                                           "JOIN villageinformation v ON w.villageId = v.VillageId " +
                                           "WHERE w.villageId = ? " +
                                           "AND w.VehicleNo = ? " +
                                           "AND w.WeightSlipDate BETWEEN ? AND ?";

                            PreparedStatement pst = con.prepareStatement(query);
                            pst.setString(1, villageId);
                            pst.setString(2, vehicleNo);
                            pst.setString(3, fromDate);
                            pst.setString(4, toDate);

                            ResultSet rs = pst.executeQuery();
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                            boolean hasData = false;
                            while (rs.next()) {
                                hasData = true;
            %>
                                <tr>
                                    <td><%= rs.getInt("WeightSlipId") %></td>
                                    <td><%= rs.getString("CultivatorName") %></td>
                                    <td><%= rs.getString("VillageName") %></td>
                                    <td><%= rs.getString("PartnerName") %></td>
                                    <td><%= rs.getString("TransporterName") %></td>
                                    <td><%= rs.getString("VehicleNo") %></td>
                                    <td><%= sdf.format(rs.getDate("WeightSlipDate")) %></td>
                                </tr>
            <%
                            }
                            if (!hasData) {
                                out.println("<tr><td colspan='7' class='text-center text-warning'>No records found.</td></tr>");
                            }
                            
                            rs.close();
                            pst.close();
                            con.close();
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    }
                } else {
                    out.println("<tr><td colspan='7' class='text-center'>Enter search criteria to view results</td></tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
