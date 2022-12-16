<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Account</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
long account=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
String confirm_password=request.getParameter("pswd");
double amount=Double.parseDouble(request.getParameter("amt"));
String address=request.getParameter("addr");
long mobile_no=Long.parseLong(request.getParameter("mobileno"));
String state = "Active";
if(!password.equals(confirm_password)){
	out.print("Please insert valid password");
}
else{
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pdb","pdb");
	PreparedStatement ps=con.prepareStatement("insert into bankaccount values(?,?,?,?,?,?,?)");
	ps.setLong(1, account);
	ps.setString(2, name);
	ps.setString(3, password);
	ps.setDouble(4, amount);
	ps.setString(5, address);
	ps.setLong(6, mobile_no);
	ps.setString(7, state);
	int i=ps.executeUpdate();
	out.print(i+"New Account created");
	con.close();
}
catch(Exception e){
	out.print(e);
}
}
%>
</body>
</html>