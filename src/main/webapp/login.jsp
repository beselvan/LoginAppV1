<%@ page language="java" import="java.io.IOException,java.io.IOException,java.sql.Connection,java.sql.ResultSet,java.sql.Statement,java.util.*,javax.naming.*,javax.servlet.*,javax.servlet.http.*,javax.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
function alertName(){
alert("pls check the pwd");
} 
</script> 
<%

 String userName = request.getParameter("userName"); 
 String password = request.getParameter("password"); 
 
HttpSession sess = request.getSession(); 
sess.setAttribute("userName", userName);
sess.setAttribute("password", password);
 
Context ctx = new InitialContext();
DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MyDB");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con = ds.getConnection();
System.out.println(con);
Statement st=con.createStatement();

 ResultSet rs; 
 rs = st.executeQuery("select * from user where username='" + userName + "' and password='" + password + "'");
	if (rs.next()) 
		{ 

		    st.executeUpdate("insert into logindetails values('" + userName + "', CURDATE()  ,  CURTIME()  ,   CURDATE()  ,  CURTIME() ,'current')");

			response.sendRedirect("home.jsp"); 
		} 
	else 
		{ 

			
			response.sendRedirect("/");
} 

st.close(); 
con.close(); 


%>

