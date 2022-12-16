<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Account</title>
<script type="text/javascript">
function check(){
	var v1=f.accno.value;
	var v2=f.uname.value;
	var v3=f.psw.value;
	var v4=f.pswd.value;
	var v5=f.amt.value;
	var v6=f.addr.value;
	var v4=f.mobileno.value;
	if(v1==""){
		alert("Please enter account number");
		document.f.accno.focus();
		return false;
	}
	if(v2==""){
		alert("Please enter account holder name");
		document.f.uname.focus();
		return false;
	}
	if(v3==""){
		alert("Please enter password");
		document.f.psw.focus();
		return false;
	}
	if(v4!=v3){
		alert("Please enter same password");
		document.f.psw.focus();
		return false;
	}
	if(v5==""){
		alert("Please enter the amount");
		document.f.amt.focus();
		return false;
	}
	if(v6==""){
		alert("Please enter the address");
		document.f.amt.focus();
		return false;
	}
	if(v7==""){
		alert("Please enter the mobile number");
		document.f.amt.focus();
		return false;
	}
	else{
		alert("ACCEPTED");
		return true;
	}
}
</script>
</head>
<body>
<center>
<h1 style="color:blue">SDFC BANK</h1><br>
<h2 style="color:aqua">EXTRAORDINARY SERVICES</h2>
</center>
<a href="home.jsp" target="_blank">Home</a>
<a href="openaccount.jsp" target="_blank">New Account</a>
<a href="balance.jsp" target="_blank">Balance</a>
<a href="deposite.jsp" target="_blank">Deposite</a>
<a href="withdraw.jsp" target="_blank">Withdraw</a>
<a href="transfer.jsp" target="_blank">Transfer</a>
<a href="close.jsp" target="_blank">Close A/C</a>
<a href="AboutUs.jsp" target="_blank">About Us</a>
<center>
<form action="OpenAccountCode.jsp" method="post" name="f" onsubmit="return check()">
<h1 style="color:green">OPEN ACCOUNT FORM</h1><br><br>
Account Number:<input type="number" name="accno"><br><br>
Name:<input type="text" name="uname"><br><br>
Password:<input type="password" name="psw"><br><br>
Confirm Password:<input type="password" name="pswd"><br><br>
Amount:<input type="number" name="amt"><br><br>
Address:<input type="text" name="addr"><br><br>
Mobile Number:<input type="number" name="mobileno"><br><br>
<input type="submit" value="Submit">
<input type="submit" value="Clear">
</form>
</center>
</body>
</html>