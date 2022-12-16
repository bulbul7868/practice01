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
Long first_account = Long.parseLong(request.getParameter("accno"));
String name = request.getParameter("uname");
String password = request.getParameter("psw");
Long second_account = Long.parseLong(request.getParameter("accno2"));
double transfer = Double.parseDouble(request.getParameter("amt"));
Long account = first_account;
double amount =0;
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
			account=second_account;
			PreparedStatement sp = con.prepareStatement("select * from bankaccount where account=?"); 
			sp.setLong(1, account);
			ResultSet sr = sp.executeQuery();
			if(sr.next())
			{	
					double money =0;
					money = rs.getDouble("amount");
					double temp = money;
					amount = money - transfer;
					account = first_account;
					PreparedStatement p = con.prepareStatement("update bankaccount set amount=? where account=? and name=? and password=?");
					p.setDouble(1, amount);
					p.setLong(2, account);
					p.setString(3, name);
					p.setString(4, password);
					int i = p.executeUpdate();
					out.print(account+" Amount Updadted Successfully");
					ResultSet r = ps.executeQuery();
					if(r.next())
					{			
						
		%>
						<br><br>
						<table border="1" style="border-collapse: collapse;">
						<tr>
						<th>ACCOUNT NUMBER</th>
						<th>NAME</th>
						<th>PREVIOUS BALANCE</th>
						<th>WITHDRAW AMOUNT</th>
						<th>CURRENT BALANCE</th>
						</tr>
						<tr>	
						<td> <% out.print(r.getString("account"));%> </td>		
						<td> <% out.print(r.getString("name"));%> </td>
						<td> <% out.print(temp);%></td>
						<td style="color:red;"> <% out.print(transfer);%></td>
						<td style="color:green;"> <% out.print(r.getDouble("amount"));%> </td>
						</tr>
						</table>	
						<br><br><br><br>
		<%	
					}
					double amt =0;
					amt = sr.getDouble("amount");
					double tem = amt;
					amount = amt + transfer;
					account = second_account;
					PreparedStatement pp = con.prepareStatement("update bankaccount set amount=? where account=?");
					pp.setDouble(1, amount);
					pp.setLong(2, account);
					int ii = pp.executeUpdate();
					out.print(account + " Amount Updadted Successfully");
					ResultSet rr = sp.executeQuery();
					if(rr.next())
					{		
		%>
						<br><br>
						<table border="1" style="border-collapse: collapse;">
						<tr>
						<th>ACCOUNT NUMBER</th>
						<th>NAME</th>
						<th>PREVIOUS BALANCE</th>
						<th>DEPOSIT AMOUNT</th>
						<th>CURRENT BALANCE</th>
						</tr>
						<tr>
						<td> <% out.print(rr.getString("account"));%> </td>
						<td> <% out.print(rr.getString("name"));%> </td>
						<td> <% out.print(tem);%></td>
						<td style="color:green;"> <% out.print(transfer);%></td>
						<td style="color:green;"> <% out.print(rr.getDouble("amount"));%> </td>
						</tr>
						</table>		
		<%	
					}
					
				}
				else
				{
					out.print("ACCOUNT IS NOT IN USE");
				}	
			}
			else
			{
				out.print("Enter Valid Details...");
			}
		
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>
</body>
</html>