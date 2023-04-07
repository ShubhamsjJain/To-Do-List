<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

String user_ID = request.getParameter("user_ID");
String user_password = request.getParameter("user_password");

if(user_ID.equals("sj@gmail.com") && user_password.equals("123")){
	response.sendRedirect("ToDoList.jsp");
	
}else{
	out.print("You have entered wrong ID or password.Please Try Again");
	response.sendRedirect("index.html");
	
}
%>
</body>
</html>