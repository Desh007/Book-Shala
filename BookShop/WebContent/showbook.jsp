<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String sql="select bimg,isbn from book";
String d=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String u=application.getInitParameter("uname");
String p=application.getInitParameter("pwd");
Class.forName(d);
Connection con=DriverManager.getConnection(url,u,p);
PreparedStatement pst=con.prepareStatement(sql);
ResultSet rs=pst.executeQuery();
while(rs.next())
{
String img=rs.getString(1)	;
String isbn=rs.getString(2);
%>
<a href="BookDetails.jsp?value=<%=isbn%>"><img alt="" src="<%=img%>" height="200" width="200"></a>
<%}
%>
</body>
</html>