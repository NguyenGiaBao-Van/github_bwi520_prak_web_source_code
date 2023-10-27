<%@page import="de.hwg_lu.bwi420.beans.TaschenrechnerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="trb" class="de.hwg_lu.bwi420.beans.TaschenrechnerBean" scope="session" />
<%
String zahl1String = request.getParameter("zahl1");
String zahl2String = request.getParameter("zahl2");
String plus        = request.getParameter("plus");
String mult        = request.getParameter("mult");
String save        = request.getParameter("save");
String show        = request.getParameter("show");
String zurueck     = request.getParameter("zurueck");
if (show == null) show = "";
if (zurueck == null) zurueck = "";
if (save == null) save = "";
if (plus == null) plus = "";
if (mult == null) mult = "";
double zahl1 = 0;
double zahl2 = 0;
try{
	zahl1 = Double.parseDouble(zahl1String);
}catch(Exception nfe){
	nfe.printStackTrace();
}
try{
	zahl2 = Double.parseDouble(zahl2String);
}catch(Exception nfe){
	nfe.printStackTrace();
}

if (plus.equals("+")){
	trb.setZahl1(zahl1);
	trb.setZahl2(zahl2);
	trb.setOperator("+");
	trb.plus(zahl1, zahl2);
	response.sendRedirect("./TaschenrechnerView-654321.jsp");
}else if(mult.equals("*")){
	trb.setZahl1(zahl1);
	trb.setZahl2(zahl2);
	trb.setOperator("*");
	trb.mult(zahl1, zahl2);
	response.sendRedirect("./TaschenrechnerView-654321.jsp");
}else if(save.equals("save to DB")){
	trb.saveToDB();
	response.sendRedirect("./TaschenrechnerView-654321.jsp");
}else if(show.equals("zeige Rechnungen aus DB")){
	response.sendRedirect("./RechnungView.jsp");
}else if(zurueck.equals("zurueck")){
	response.sendRedirect("./TaschenrechnerView-654321.jsp");
}else{
	response.sendRedirect("./TaschenrechnerView-654321.jsp");
}

%>
</body>
</html>