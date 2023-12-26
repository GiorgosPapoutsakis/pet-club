<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="omadiki_ergasia.*" %>

<%
String firstname = request.getParameter("name");
String surname = request.getParameter("lastname");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");
String choice = request.getParameter("choice");
Int phone = request.getParameter("phone");

boolean isValid = true;
String errorMessage = "";
ArrayList<String> errors = new ArrayList<String>();

if (firstname == null || firstname.length() < 3) {
    errors.add("Firstname is not valid");
    isValid = false;
}

if (surname == null || surname.length() < 3) {
    errors.add("Last name is not valid");
    isValid = false;
}

if (username == null || username.length() < 5) {
    errors.add("Last name is not valid");
    isValid = false;
}

if (password == null || password.length() < 5) {
    errors.add("Password is not valid");
    isValid = false;
}


if (choice == null) {
    errors.add("You must make a choice");
    isValid = false;
} 

if (phone == null || phone.length() <10) {
    errors.add("Your phone number is not valid");
    isValid = false;
} 

%>


<!DOCTYPE html>
<html lang="en">
	<head>
<title>Registration</title>
<meta charset="utf-8">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">	
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- Custom styles for this template -->
<link href="css/theme_8XXXXXX.css" rel="stylesheet">
  <style type="text/css">
      form { max-width: 600px; }
      .main-label { font-size: 16px; }
      .img {
        height: 110px;
        margin-right: 25px;
      }
  </style>
  <style>
    .submitbutton{
      background-color: rgb(183, 255, 0);
      color: white;
      border: none;
      height: 36px;
      width: 85px;
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
    .clearbutton{
      background-color: rgb(255, 170, 0);
      color: white;
      border: none;
      height: 36px;
      width: 85px;
      border-radius: 2px;
      font-weight: bold;
      font-size: 15;
      cursor: pointer;
      transition: opacity 0.15s;
    }
    .clearbutton:hover {
        opacity: 0.5;
    }
    .clearbutton:active {
      opacity: 0.3;
    }
  </style>
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/form.css">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>
<body>
<header>
  <div class="container_12">
    <div class="grid_12">
      <h1><img src="images/pawie.png" alt=""></h1>
      <div class="menu_block">
        <nav>
          <ul class="sf-menu">
            <li><a href="viewWelfares.jsp">Walfares</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li class="current"><a href="register.jsp">Register</a></li>
          </ul>
        </nav>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</header>

    <div class="container theme-showcase" role="main">
      <div class="page-header">
      
				<h2 class="ic1">Registration Form </h2>
			</div>
      <div class="form-group">
      <img class="img" src="images/page2_img2.jpg">
        <img class="img" src="images/page3_img3.jpg">
        <img class="img" src="images/page3_img1.jpg">
        <img class="img" src="images/page3_img5.jpg">
      </div>
	<body>

    <% if (!isValid) { %>
        <!-- Error section -->
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Registration form has errors</h1>
            </div>

            <div class="alert alert-danger" role="alert">
				<ol>
					<% for (int i = 0; i < errors.size(); i++) { %>
						<li><%= errors.get(i) %></li>
					<% } %>
				</ol>
            </div>
			<a href="register.jsp" class="blue-btn">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Back to the form
			</a>
        </div>
		<!--Success section-->
    <% } else { 

		if (choice == "welfare") {

		WelfareUtilities welf = new WelfareUtilities();
		Welfare registered = new Welfare(username, password, firstname, surname, email, phone);
		try {

        welf.register(registered); %>
    
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Registration done!</h1>
            </div>

            <ul>
                <li><b>Name:</b> <%= firstname %></li>
                <li><b>Surname:</b> <%= surname %></li>
                <li><b>Email:</b> <%= email %></li>
                <li><b>Username:</b> <%= username %></li>
            </ul>
        </div>  

		} catch(Exception e) {

        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Registration form has errors</h1>
            </div>

            <div class="alert alert-danger" role="alert">
				<%= e.getMessage() %>
            </div>
			<a href="register.jsp" class="blue-btn">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Back to the form
			</a>
        </div>
		</div>
		<%
		}

		}else{

		VolunteerUtilities vol = new VolunteerUtilities();
		Volunteer registered = new Volunteer(username, password, firstname, surname, email, phone);
		try {

        vol.register(registered); %>
    
        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Registration done!</h1>
            </div>

            <ul>
                <li><b>Name:</b> <%= firstname %></li>
                <li><b>Surname:</b> <%= surname %></li>
                <li><b>Email:</b> <%= email %></li>
                <li><b>Username:</b> <%= username %></li>
            </ul>
        </div>  

		} catch(Exception e) {

        <div class="container theme-showcase" role="main">
            <div class="page-header">
                <h1>Registration form has errors</h1>
            </div>

            <div class="alert alert-danger" role="alert">
				<%= e.getMessage() %>
            </div>
			<a href="register.jsp" class="blue-btn">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Back to the form
			</a>
        </div>
		</div>

		<%
		}
}
	}
%>

	</body>
</html>
