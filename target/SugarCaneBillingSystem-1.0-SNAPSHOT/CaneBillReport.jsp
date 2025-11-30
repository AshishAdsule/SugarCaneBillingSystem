<%@page import="com.ashu.sugarcanebillingsystem.DataAccess"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ashu.sugarcanebillingsystem.CaneBillInformation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Database connection
    Connection cn = DataAccess.getConnection();
    List<CaneBillInformation> billList = new ArrayList<>();
    


    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    if (startDate == null || startDate.isEmpty()) {
        startDate = "2000-01-01";
    }
    if (endDate == null || endDate.isEmpty()) {
        endDate = "2100-12-31";
    }

    String sql = "SELECT * FROM canebillinformation WHERE BillDate BETWEEN ? AND ?";
    PreparedStatement ps = cn.prepareStatement(sql);
    ps.setString(1, startDate);
    ps.setString(2, endDate);
    
    ResultSet rs = ps.executeQuery();
    
    while (rs.next()) {
        CaneBillInformation bill = new CaneBillInformation();
        bill.setBillId(rs.getInt("BillId"));
        bill.setBillDate(rs.getString("BillDate"));
        bill.setAccountHolderName(rs.getString("AccountHolderName"));
        bill.setBillPassDate(rs.getString("BillPassDate"));
        bill.setVillageName(rs.getString("VillageName"));
        bill.setCultivatorId(rs.getInt("CultivatorId"));
        bill.setBankName(rs.getString("BankName"));
        bill.setAccountNo(rs.getInt("AccountNo"));
        bill.setCaneNetWeight(rs.getInt("CaneNetWeight"));
        bill.setTotalAmount(rs.getDouble("TotalAmount"));
        bill.setCaneRate(rs.getDouble("CaneRate"));
        bill.setNetAmount(rs.getDouble("NetAmount"));
        bill.setCultivatorMobileNo(rs.getString("CultivatorMobileNo"));

        billList.add(bill);
    }
    rs.close();
    ps.close();
    cn.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cane Bill Information Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <%@include file="WEB-INF/Header.jsp" %>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Cane Bill Information Report</h2>

        <!-- Date Search Form -->
        <form method="GET" class="mb-4">
            <div class="row">
                <div class="col-md-4">
                    <label for="startDate" class="form-label">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" class="form-control" value="<%= startDate %>">
                </div>
                <div class="col-md-4">
                    <label for="endDate" class="form-label">End Date:</label>
                    <input type="date" id="endDate" name="endDate" class="form-control" value="<%= endDate %>">
                </div>
                <div class="col-md-4 align-self-end">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>

        <!-- Report Table -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Bill ID</th>
                    <th>Bill Date</th>
                    <th>Account Holder</th>
                    <th>Bill Pass Date</th>
                    <th>Village Name</th>
                    <th>Cultivator ID</th>
                    <th>Bank Name</th>
                    <th>Account No</th>
                    <th>Net Weight</th>
                    <th>Total Amount</th>
                    <th>Cane Rate</th>
                    <th>Net Amount</th>
                    <th>Mobile No</th>
                </tr>
            </thead>
            <tbody>
                <% for (CaneBillInformation bill : billList) { %>
                <tr>
                    <td><%= bill.getBillId() %></td>
                    <td><%= bill.getBillDate() %></td>
                    <td><%= bill.getAccountHolderName() %></td>
                    <td><%= bill.getBillPassDate() %></td>
                    <td><%= bill.getVillageName() %></td>
                    <td><%= bill.getCultivatorId() %></td>
                    <td><%= bill.getBankName() %></td>
                    <td><%= bill.getAccountNo() %></td>
                    <td><%= bill.getCaneNetWeight() %></td>
                    <td><%= bill.getTotalAmount() %></td>
                    <td><%= bill.getCaneRate() %></td>
                    <td><%= bill.getNetAmount() %></td>
                    <td><%= bill.getCultivatorMobileNo() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
