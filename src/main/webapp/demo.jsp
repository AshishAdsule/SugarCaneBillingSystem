<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneCutSlipInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/sugarcanedb";
    String dbUser = "root";
    String dbPassword = "root";

    Connection cn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    List<CaneCutSlipInformation> slipList = new ArrayList<>();
    List<String> cultivatorNames = new ArrayList<>();

    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String selectedCultivator = request.getParameter("cultivatorName");

    if (startDate == null || startDate.isEmpty()) {
        startDate = "2000-01-01";
    }
    if (endDate == null || endDate.isEmpty()) {
        endDate = "2100-12-31";
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        cn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Fetch unique cultivator names for the dropdown
        String cultivatorQuery = "SELECT DISTINCT CultivatorName FROM canecutslipinformation ORDER BY CultivatorName";
        ps = cn.prepareStatement(cultivatorQuery);
        rs = ps.executeQuery();

        while (rs.next()) {
            cultivatorNames.add(rs.getString("CultivatorName"));
        }
        rs.close();
        ps.close();

        // Fetch filtered data based on selected cultivator and date range
        String sql = "SELECT * FROM canecutslipinformation WHERE CaneCutDate BETWEEN ? AND ?";
        if (selectedCultivator != null && !selectedCultivator.isEmpty()) {
            sql += " AND CultivatorName = ?";
        }

        ps = cn.prepareStatement(sql);
        ps.setString(1, startDate);
        ps.setString(2, endDate);

        if (selectedCultivator != null && !selectedCultivator.isEmpty()) {
            ps.setString(3, selectedCultivator);
        }

        rs = ps.executeQuery();

        while (rs.next()) {
            CaneCutSlipInformation slip = new CaneCutSlipInformation();
            slip.setCaneCutId(rs.getInt("CaneCutId"));
            slip.setCultivatorName(rs.getString("CultivatorName"));
            slip.setPartnerName(rs.getString("PartnerName"));
            slip.setVillageGroupId(rs.getString("VillageGroupId"));
            slip.setHarvesterName(rs.getString("HarvesterName"));
            slip.setTransportName(rs.getString("TransportName"));
            slip.setCaneCutDate(rs.getString("CaneCutDate"));
            slip.setVehicleNo(rs.getString("VehicleNo"));

            slipList.add(slip);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (cn != null) cn.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cane Cut Slip Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <%@include file="WEB-INF/Header.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Cane Cut Slip Information Report</h2>

        <!-- Search Form -->
        <form method="GET" class="mb-4">
            <div class="row">
                <div class="col-md-3">
                    <label for="startDate" class="form-label">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" class="form-control" value="<%= startDate %>">
                </div>
                <div class="col-md-3">
                    <label for="endDate" class="form-label">End Date:</label>
                    <input type="date" id="endDate" name="endDate" class="form-control" value="<%= endDate %>">
                </div>
                <div class="col-md-3">
                    <label for="cultivatorName" class="form-label">Cultivator Name:</label>
                    <select id="cultivatorName" name="cultivatorName" class="form-select">
                        <option value="">All Cultivators</option>
                        <% for (String name : cultivatorNames) { %>
                            <option value="<%= name %>" <%= (name.equals(selectedCultivator)) ? "selected" : "" %>><%= name %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-3 align-self-end">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>

        <!-- Report Table -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Cultivator Name</th>
                    <th>Partner Name</th>
                    <th>Village Group</th>
                    <th>Harvester</th>
                    <th>Transport</th>
                    <th>Cane Cut Date</th>
                    <th>Vehicle No</th>
                </tr>
            </thead>
            <tbody>
                <% if (slipList.isEmpty()) { %>
                    <tr><td colspan="8" class="text-center">No records found</td></tr>
                <% } else { %>
                    <% for (CaneCutSlipInformation slip : slipList) { %>
                    <tr>
                        <td><%= slip.getCaneCutId() %></td>
                        <td><%= slip.getCultivatorName() %></td>
                        <td><%= slip.getPartnerName() %></td>
                        <td><%= slip.getVillageGroupId() %></td>
                        <td><%= slip.getHarvesterName() %></td>
                        <td><%= slip.getTransportName() %></td>
                        <td><%= slip.getCaneCutDate() %></td>
                        <td><%= slip.getVehicleNo() %></td>
                    </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
