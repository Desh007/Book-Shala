<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book-Shala | LDao</title>
</head>
<body>
<% 

String uname=request.getParameter("uname");


String pwd=request.getParameter("pwd");


if(uname.equals("admin")&&pwd.equals("admin"))
{
  %>
	<jsp:forward page="admin-menu.jsp"></jsp:forward>

<%}

else{
	
	String d=request.getParameter("driver");
	String url=request.getParameter("url");
	String u=request.getParameter("uname");
	String p=request.getParameter("pwd");
	
	
	Class.forName(d);
	
	Connection con=DriverManager.getConnection(url,u,p);
	
	String sel="select *from users where uname=? and pwd=?";
	
	PreparedStatement pst=con.prepareStatement(sel);
	
	pst.setString(1,uname);
	pst.setString(2,pwd);
	
	ResultSet rs=pst.executeQuery();
	
	if(rs.next()){
	 %>
		<jsp:forward page="/showbook.jsp"></jsp:forward>		
				
	<%}
	else {
	       %>	
    	<%="<center>Incorrect Username or password</center>"%>	
		<jsp:include page="/login.jsp"></jsp:forward>
		<%
		
	}
	
}

%>
</body>
</html>