<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance Form</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
long account=Long.parseLong(request.getParameter("accno"));
String name=request.getParameter("uname");
String password=request.getParameter("psw");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","pdb","pdb");
	PreparedStatement ps=con.prepareStatement("select * from bankaccount where account=? and name=? and password=?");
	ps.setLong(1,account);
	ps.setString(2,name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	ResultSetMetaData rsmd=rs.getMetaData();
	out.print("<html><body><table border='1'>");
	int n=rsmd.getColumnCount();
	out.println("<tr>");
	for(int i=1;i<=n;i++) {
		if(i==3){
			continue;
		}
		out.print("<td><font color=blue size=3>" + "<br>"+rsmd.getColumnName(i));
	}
	out.println("<tr>");
	while(rs.next()) {
		for(int j=1;j<=n;j++) {
			if(j==3){
				continue;
			}
			out.print("<td><br>"+rs.getString(j));
		}
			out.println("<tr>");
	}
	out.print("</html></body></table>");
	con.close();
}catch(Exception e){
	out.print(e);
}
%>
</body>
</html>