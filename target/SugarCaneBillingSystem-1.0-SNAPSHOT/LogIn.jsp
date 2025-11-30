<%-- 
    Document   : LogIn
    Created on : 10 Dec 2024, 10:23:02 am
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ashu.sugarcanebillingsystem.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    if (request.getParameter("SignIn") != null) {
        String Username = request.getParameter("txtusername");
        String Pwd = request.getParameter("txtpassword");
        Connection con = DataAccess.getConnection();
        try {
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select UserName, Password from tbl_registration;");
            while(rs.next()){
            String dbcultivatorname=rs.getString(1);
//            out.print(rs.getString(1));
            String dbuserPwd=rs.getString(2);
//            out.print(rs.getString(2));
            if(dbcultivatorname.equalsIgnoreCase(Username)&& dbuserPwd.equalsIgnoreCase(Pwd))
            {
            out.print(rs.getString(1));
            session.setAttribute("nm",Username);
            response.sendRedirect("index.jsp");
    }
    else{
    out.print("<script>");
    out.print("alert(invalid input)");
    out.print("</script>");
    }
    }
    }catch(Exception ex){
out.print(ex.toString());
}       }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sugarcane Billing System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('images/scproject2.jpeg');
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #4CAF50;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn {
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form action="LogIn.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" id="txtusername" name="txtusername" placeholder="Enter your username" required>

            <label for="password">Password</label>
            <input type="password" id="txtpassword" name="txtpassword" placeholder="Enter your password" required>
            <br>
            <input type="submit" name="SignIn" value="LogIn" class="btn btn-outline-success btn-sm">
        </form>
        <a href="AdminRegistration.jsp">Don't have an account? Register here</a>
    </div>
</body>
</html>
