<%@ page language="java" import="java.io.IOException,java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 





	String userName = request.getParameter("userName"); 
	String password = request.getParameter("password"); 
	String firstName = request.getParameter("firstName"); 
	String lastName = request.getParameter("lastName"); 
	String email = request.getParameter("email"); 
	
	
	
Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con = ds.getConnection();
Statement st=con.createStatement();

	
	
	
	int i = st.executeUpdate("insert into user(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','" + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
	if (i > 0) { 
				
				response.sendRedirect("/"); 
				
			} 
	else { 
		response.sendRedirect("index.jsp"); 
		} 



 
st.close(); 
con.close(); 

%>

