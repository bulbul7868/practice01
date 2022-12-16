<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%
long account=Long.parseLong(request.getParameter("accno"));
String name = request.getParameter("uname");
String password = request.getParameter("psw");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pdb","pdb");
	PreparedStatement ps = con.prepareStatement("select * from bankaccount where account=? and name=? and password=?"); 
	ps.setLong(1, account);
	ps.setString(2, name);
	ps.setString(3, password);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		String state = "Deactive";
		PreparedStatement p = con.prepareStatement("update bankaccount set state=? where account=? and name=? and password=?");
		p.setString(1, state);
		p.setLong(2, account);
		p.setString(3, name);
		p.setString(4, password);
		int i = p.executeUpdate();
		out.print("ACCOUNT DEACTIVATED SUCCESSFULLY...");
	}
	else
	{
		out.println("INVALID DETAILS.........");
	}
	
}
catch(Exception e)
{
	out.print(e);
}

%>
</body>
</html>