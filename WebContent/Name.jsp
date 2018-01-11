<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
 <%
 String name=request.getParameter("name");
 if(name==null || name.trim().equals("")){  
	 out.println("Please enter name"); 
 }
 
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jio","root","Pawan");
 String sql="select name from phonebook";
 PreparedStatement ps=con.prepareStatement(sql);
 ResultSet rs=ps.executeQuery();
 while(rs.next()){
		 out.println(rs.getString(1));
		 
	 }
 
 con.close();
 ps.close();
 %> 






