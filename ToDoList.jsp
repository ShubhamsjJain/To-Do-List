<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My To-Do List</title>
</head>
<body>

<!-- HTML Form -->
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->

<h1>Welcome to To Do List Application</h1>
<form action="ToDoList.jsp" method="post">
Enter your To Do Activity <input type="text" name= "myToDoList">
<input type="submit" value= "Submit">

</form>
<br><br>

<!-- Session management -->
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->
<!-- ----------------------------------------------- -->


<!-- Step 1 - Add new items to the To Do List -->

<%

// If my To do List already exists, and only update is required i.e get the To Do items from the session
List<String> itemsFromSession = (List<String>) session.getAttribute("MyList");

// If To Do List is completely new, i.e new session
if(itemsFromSession == null){                              // i.e No arrayList exists
	itemsFromSession = new ArrayList<String>();    
	session.setAttribute("MyList",itemsFromSession );  // Add items list to the session
}

// See if there is form data to add

String myToDoList = request.getParameter("myToDoList");

boolean isItemNotEmpty = myToDoList!= null && myToDoList.trim().length() >0;
boolean isItemNotDuplicate = myToDoList != null && !itemsFromSession.contains(myToDoList.trim());
if(isItemNotEmpty && isItemNotDuplicate){
	itemsFromSession.add(myToDoList.trim());
}

%>

<!-- Step 2 - Displaying items to the To Do List -->
<hr>
<b>To Do List activities</b>
<br> 


<ol>
<%

for(String activities: itemsFromSession){
	out.println("<li>" + activities + "</li>");

}

%>
</ol>
</body>
</html>