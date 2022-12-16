<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposite</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
Long account=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
double deposite=Double.parseDouble(request.getParameter("amt"));
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pdb","pdb");
	PreparedStatement ps=con.prepareStatement("select * from bankaccount where account=? and name=? and password=?");
	ps.setLong(1,account);
	ps.setString(2, name);
	ps.setString(3, password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		double amount=rs.getDouble(4);
		amount=amount+deposite;
	PreparedStatement p=con.prepareStatement("update bankaccount set amount=? where account=? and name=? and password=?");
	p.setDouble(1, amount);
	p.setLong(2, account);
	p.setString(3, name);
	p.setString(4, password);
	int i=p.executeUpdate();
	out.print("deposit of amount :"+deposite + "current balance is "+amount);
	}
	else
		out.print("enter valid details");
	con.close();
		
}
catch(Exception e){
	out.print(e);
}
%>
</body>
</html>