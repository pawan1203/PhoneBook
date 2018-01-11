<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<html>
<head>
<title>PhoneBook App</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="Phone.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="Phone.js"></script>
</head>
<body>

<div id="head">
        <div id="phn">My Phone Book
		  <input id="srch" type="text" size="40" placeholder="Enter Your Search Here"></div>
</div>	
	 
<div id="messageArea" class="row">
            <div class="left"> <h3>Contacts</h3>
              <div class="list-group" id="users"></div></div>         
<div class="right"><button id="Mymodal" class="btn btn-info btn-lg" data-toggle="modal" data-target="#MyModal">Add Contact</button></div>
</div>
  <form id="createcontact" method="post">
     <div class="container">	
      <div class="modal fade" id="MyModal" > 
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal">&times;</button>
	     <h4 class="modal-header">Create Contact</h4></div>  
		 <div class="modal-body">
		  <p> Name:&nbsp;&nbsp;<input type="text" name="name" id="name"  ></input></p>
		  <p> Phone1:&nbsp;<input type="text" name="number1" id="number1"  ></input></p>
		  <p> Phone2:&nbsp;<input type="text" name="number2" id="number2"  ></input></p>
		  <p> Email:&nbsp;&nbsp;<input type="text" name="email" id="email" ></input></p>
		  <p> Company:&nbsp;&nbsp;<input type="text" name="company" id="company" ></input></p>
		  </div> 

<%
 String name=request.getParameter("name");
 String phone1=request.getParameter("number1");
 String phone2=request.getParameter("number2");
 String email=request.getParameter("email");
 String company=request.getParameter("company");
   
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jio","root","Pawan");
 String sql="insert into phonebook(name,phone1,phone2,email,company)values(?,?,?,?,?)";
 PreparedStatement ps=con.prepareStatement(sql);
 ps.setString(1, name);
 ps.setString(2, phone1);
 ps.setString(3, phone2);
 ps.setString(4, email);
 ps.setString(5, company);
 int x=ps.executeUpdate();
 con.close();
 ps.close();

%>	  
		 <div class="modal-footer">
		 <button type="button" value="Add" id="addbtn" onclick="sendInfo()"  name="addbtn" class="btn btn-default">Add</button>
		 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		 </div>
	   </div>
	</div>   
</div>
</div> 
</form>	
</body>
</html>



    