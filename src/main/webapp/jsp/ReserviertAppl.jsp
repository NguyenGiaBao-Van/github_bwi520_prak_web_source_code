<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="de.hwg_lu.bwi520.beans.AccountBean"%>
<%@page import="de.hwg_lu.bwi520.beans.MessageBean"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<jsp:useBean id="myAccount" class="de.hwg_lu.bwi520.beans.AccountBean" scope="session" />
	<% 
	AccountBean user = (AccountBean) session.getAttribute("user"); 
	if(user == null) {
		user = new AccountBean();
		session.setAttribute("user", user);
	}
	MessageBean message = (MessageBean) session.getAttribute("message"); 
	if(message == null) {
		message = new MessageBean();
		session.setAttribute("message", message);
	}
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String telefonNummer = request.getParameter("telefonNummer");
	String planDateString = request.getParameter("planDate");
		//Convert planDateString to planDate
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf.parse(planDateString);
		java.sql.Date planDate = new java.sql.Date(date.getTime()); 
		
	
	String anzahlString = request.getParameter("anzahl");	
		//Convert anzahlString to anzahl
		int anzahl = 0;
		try {
			anzahl = Integer.parseInt(anzahlString);
		} catch(Exception nfe) {
			nfe.printStackTrace();
		}
	
	String btnReserve = request.getParameter("Reservierung");
	
	//Restposten
	System.out.println("Name: " + name);
	System.out.println("Email: " + email);
	System.out.println("telefonNummer: " + telefonNummer);
	System.out.println("planDate: " + planDate);
	System.out.println("anzahl: " + anzahl);
	System.out.println("btnReserve: " + btnReserve);
	
	//Butten Reservierung klicken
	if(btnReserve.equals(null)){
		System.out.println("Nicht funktioniert!");
	} else if(btnReserve.equals("Reservierung")){
		
		user.setName(name);
		user.setEmail(email);
		user.setTelefonNummer(telefonNummer);
		user.setPlanDate(planDate);
		user.setAnzahl(anzahl);
		
		session.setAttribute("user", user);
	
		user.insertAccount();
		
		response.sendRedirect("./ReserviertView.jsp");
	}
	
	%>
</body>
</html>