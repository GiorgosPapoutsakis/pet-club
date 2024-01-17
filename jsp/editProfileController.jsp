<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="omadiki_ergasia.*" %>
<%@ page import="java.sql.*" %>

<%
// Authentication
if (session.getAttribute("volObj") == null & session.getAttribute("welfObj") == null) {
  request.setAttribute("message", "Δεν έχετε συνδεθεί");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
}
%>

<!DOCTYPE html>
<html lang="en">
	<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Edit Profile</title>
    <link rel="icon" href="images/favicon.ico">

    <!-- Bootstrap -->
     <link rel="stylesheet" href="css/bootstrap.min.css">	
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

    <!-- Template -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Custom CSS for EditProfile -->    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333; 
        }
        .profile-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-right: 20px;
        }
        .profile-details {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .profile-details p {
            margin: 5px 0;
        }
        .code-container {
            background-color: white;
            color: black;
            padding: 10px;
            border-radius: 5px;
        }
        .edit-button {
            margin-top: 20px;
        }
        .info-box {
            border: 1px solid #ccc;
            padding: 8px;
            border-radius: 5px;
            display: inline-block;
            width: 8cm;
        }
        .submitbutton{
        background-color: rgb(183, 255, 0);
        color: white;
        border: none;
        height: 46px;
        width: 100px;
        border-radius: 2px;
        font-weight: bold;
        font-size: 15;
        cursor: pointer;
        transition: opacity 0.15s;    
        }

        .submitbutton:hover {
            opacity: 0.5;
        }

        .submitbutton:active {
        opacity: 0.3;
        }
    </style>

</head>
<body>
 
 <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>

    <title>Επεξεργασία Προφίλ</title>
    <link rel="icon" href="images/favicon.ico">
 
<%

if(session.getAttribute("welfObj") !=null) {

GreekWord greekWord = new GreekWord();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name1 = request.getParameter("name");
    String name = greekWord.acceptGreekInput(name1);
    String owner1 = request.getParameter("owner");
    String owner = greekWord.acceptGreekInput(owner1);
    String vat = request.getParameter("vat");
    String phone = request.getParameter("phone");
    String location1 = request.getParameter("location");
    String location = greekWord.acceptGreekInput(location1);

boolean isValid = true;
String errorMessage = "";
ArrayList<String> errors = new ArrayList<String>();

if (name == null || name.length() < 3) {
    errors.add("Το όνομά σας δεν είναι έγκυρο");
    isValid = false;
}

if (owner == null || owner.length() < 3) {
    errors.add("Το όνομα του ιδιοκτήτη δεν είναι έγκυρο");
    isValid = false;
}

if (password == null || password.length() < 4) {
    errors.add("Ο κωδικός σας δεν είναι έγκυρος");
    isValid = false;
}

if (vat == null || vat.length() != 8) {
    errors.add("Το ΑΦΜ σας δεν είναι έγκυρο");
    isValid = false;
} 

if (phone == null || phone.length() <10) {
    errors.add("Παρακαλώ εισάγετε έγκυρο αριθμό τηλεφώνου");
    isValid = false;
} 

if (location == null) {
    errors.add("Παρακαλώ εισάγετε την πόλη διαμονής σας");
    isValid = false;
}

 if (!isValid) { %>

        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1 style="color: black;">Υπάρχουν λάθη στα στοιχεία σας:</h1>
            </div>


            <div class="alert alert-danger" role="alert">
				<ol>
					<% for (int i = 0; i < errors.size(); i++) { %>
						<li><%= errors.get(i) %></li>
					<% } %>
				</ol>
            </div>
			<button type="button" class="submitbutton" onclick="window.location.href='editProfile.jsp';">
                <span class="submitbutton" aria-hidden="true">Πίσω στην επεξεργασία</span> 
            </button>
        </div>
		<%
 } else { 
		WelfareUtilities welf = new WelfareUtilities();
        Welfare newWelf = new Welfare(username, password, name, owner, vat, phone, location);
		try {
       
            welf.edit(newWelf);
        
    %>
    
        <div class="container theme-showcase" role="main">
             <div class="page-header">
                <h1 style="color: black;">Τα στοιχεία σας αποθηκεύτηκαν με επιτυχία!</h1>
            </div>
        <div class="alert alert-success">
            <ul>
                <li><b>Όνομα:</b> <%= name %></li>
                <li><b>Ιδιοκτήτης:</b> <%= owner %></li>
                <li><b>ΑΦΜ:</b> <%= vat %></li>
                <li><b>Τηλέφωνο:</b> <%= phone %></li>
                <li><b>Πόλη:</b> <%= location %></li>
            </ul>
        </div>  
        </div>
    
    <%
        session.setAttribute("welfObj", newWelf);
		} catch(Exception e) {
%>
<div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1 style="color: black;">Υπάρχουν λάθη στα στοιχεία σας:</h1>
            </div>


            <div class="alert alert-danger" role="alert">
				<ol>
					<% for (int i = 0; i < errors.size(); i++) { %>
						<li><%= errors.get(i) %></li>
					<% } %>
				</ol>
            </div>
			<button type="button" class="submitbutton" onclick="window.location.href='editProfile.jsp';">
                <span class="submitbutton" aria-hidden="true">Πίσω στην επεξεργασία</span> 
            </button>
        </div>
<%
        
		} finally {

        }
 }

}else{

boolean isValid = true;
String errorMessage = "";
ArrayList<String> errors = new ArrayList<String>();

GreekWord greekWord = new GreekWord();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name1 = request.getParameter("name");
    String name = greekWord.acceptGreekInput(name1);
    String lastname1 = request.getParameter("lastname");
    String lastname = greekWord.acceptGreekInput(lastname1);
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String ageParam = request.getParameter("age");
    int age = -1;  // Default value or handle missing age as needed

    if (ageParam != null && !ageParam.isEmpty()) {
        try {
            age = Integer.parseInt(ageParam);
        } catch (NumberFormatException e) {
            // Handle the case where "age" is not a valid integer
            // You might want to add an error message or take appropriate action.
        }
    }

    String location1 = request.getParameter("location");
    String location = greekWord.acceptGreekInput(location1);

if (name == null || name.length() < 3) {
    errors.add("Το όνομά σας δεν είναι έγκυρο");
    isValid = false;
}

if (lastname == null || lastname.length() < 3) {
    errors.add("Το επίθετό σας δεν είναι έγκυρο");
    isValid = false;
}

if (password == null || password.length() < 4) {
    errors.add("Ο κωδικός σας δεν είναι έγκυρος");
    isValid = false;
}

if (email == null) {
    errors.add("Παρακαλώ προσθέστε το email σας");
    isValid = false;
} 

if (phone == null || phone.length() <10) {
    errors.add("Παρακαλώ εισάγετε έγκυρο αριθμό τηλεφώνου");
    isValid = false;
} 

if (age<18 || age>99) {
    errors.add("Παρακαλώ εισάγετε έγκυρη ηλικία");
    isValid = false;
} 

if (location == null) {
    errors.add("Παρακαλώ εισάγετε την πόλη διαμονής σας");
    isValid = false;
} 

 if (!isValid) { %>

<!--error-->
<div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1 style="color: black;">Υπάρχουν λάθη στα στοιχεία σας:</h1>
            </div>


            <div class="alert alert-danger" role="alert">
				<ol>
					<% for (int i = 0; i < errors.size(); i++) { %>
						<li><%= errors.get(i) %></li>
					<% } %>
				</ol>
            </div>
			<button type="button" class="submitbutton" onclick="window.location.href='editProfile.jsp';">
                <span class="submitbutton" aria-hidden="true">Πίσω στην επεξεργασία</span> 
            </button>
        </div>
<!--success-->
<% } else { 
    
		VolunteerUtilities vol = new VolunteerUtilities();
        Volunteer newVol = new Volunteer(username, password, name, lastname, email, phone, age, location);
		try {
        
            vol.edit(newVol);

        %>
    
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1 style="color: black;">Τα στοιχεία σας αποθηκεύτηκαν με επιτυχία!</h1>
            </div>
        <div class="alert alert-success">
            <ul>
                <li><b>Όνομα:</b> <%= name %></li>
                <li><b>Επίθετο:</b> <%= lastname %></li>
                <li><b>Email:</b> <%= email %></li>
                <li><b>Τηλέφωνο:</b> <%= phone %></li>
                <li><b>Ηλικία:</b> <%= age %></li>
                <li><b>Πόλη:</b> <%= location %></li>
            </ul>
        </div>  
        </div>


<%
        session.setAttribute("volObj", newVol);
		} catch(Exception e) {
        
%>
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1 style="color: black;">Υπάρχουν λάθη στα στοιχεία σας:</h1>
            </div>


            <div class="alert alert-danger" role="alert">
				<ol>
					<% for (int i = 0; i < errors.size(); i++) { %>
						<li><%= errors.get(i) %></li>
					<% } %>
				</ol>
            </div>
			<button type="button" class="submitbutton" onclick="window.location.href='editProfile.jsp';">
                <span class="submitbutton" aria-hidden="true">Πίσω στην επεξεργασία</span> 
            </button>
        </div>

		<%
		} finally {

        }
}
}

%>

	</body>
</html>
