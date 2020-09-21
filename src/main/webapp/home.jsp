<%@ page language="java" import="java.io.IOException,java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*,java.net.InetAddress" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Welcome Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/img-01.jpg');">
			<div>
				<p style="border-right-width: -1000px;font-size: 24px;line-height: 1.3;letter-spacing: 0.133em;font-weight: 900;font-style: normal;margin-bottom: 450px;margin-left: 1000px;" align="right">
				<font color="white">Welcome <%=session.getAttribute("userName")%> <br/>
				<a href="logout.jsp">Log out</a></font></p>
			</div>

			<div>
				<p style="margin-bottom: 40px;margin-right: 40px;margin-left: -10px; margin-top: -300px;"><font color="white" style=" padding-right: -200; padding-left: 250px; ">Login Report

            <table border=1>
    		    <tr>
                <th><p><font color="white">Login Date</font></p></th>
                <th><p><font color="white">Login Time</font></p></th>
                <th><p><font color="white">Logout Date</font></p></th>
                <th><p><font color="white">Logout Time</font></p></th>
                <th><p><font color="white">Session Status</font></p></th>
            </tr>

<%





String userName=session.getAttribute("userName").toString();
 
Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con = ds.getConnection();
Statement st=con.createStatement();
con = ds.getConnection();
st=con.createStatement();

 ResultSet rs; 
 rs = st.executeQuery("select * from logindetails where username='" + userName + "'");

 System.out.println(rs);


            while(rs.next()){ 
				%>

            <tr>

                <td><p><font color="white">  <%= rs.getString(2) %></font></p></td>
                <td><p><font color="white">  <%= rs.getString(3) %></font></p></td>
                <td><p><font color="white">  <%= rs.getString(4) %></font></p></td>
                <td><p><font color="white">  <%= rs.getString(5) %></font></p></td>
                <td><p><font color="white">  <%= rs.getString(6) %></font></p></td>
            </tr>

            <% 
				

			} 
rs.close(); 
st.close(); 
con.close(); 
%>

			</table></font></p>

		<p style="padding-right: -200"><font color="white"><br><br><br><br>
		<%String ip = "";
		InetAddress inetAddress = InetAddress.getLocalHost();
		ip = inetAddress.getHostAddress();
		out.println("Server Host Name :: "+inetAddress.getHostName());%><br>
		<%out.println("Server IP Address :: "+ip);%></br>
		<%out.print( "Client IP Address :: " + request.getRemoteAddr() ); %>
		</font></p>

</div>
</div>
</body>

