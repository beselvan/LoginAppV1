<%@ page language="java" import="java.io.IOException,java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	



<%


String userName = session.getAttribute("userName").toString();


Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con = ds.getConnection();
System.out.println(con);
Statement st=con.createStatement();
con = ds.getConnection();
st=con.createStatement();

st.executeUpdate("update logindetails set logoutdate=CURDATE(), logouttime=CURTIME(), session='completed' where username='" + userName + "' and session='current';");


session.setAttribute("userName", null);
session.invalidate();

response.sendRedirect("/");

st.close(); 
con.close(); 

%>
