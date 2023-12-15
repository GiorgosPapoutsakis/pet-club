<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>MyProfile</title>
    <link rel="icon" href="images/favicon.ico">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">	
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

    <!-- Template -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Custom CSS for Profile -->
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
    </style>
</head>

<body class="page1">

    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>    

    <div class="profile-container">
        <h2>My Profile</h2>
        <!--Profile image-->
        <div class="profile-details">
            <img class="profile-picture" src="images/blank-profile-picture.jpg" alt="Your Profile Picture">
        </div>
        <!--Profile info-->
        <div class="profile-info">
            <p> Ονοματεπώνυμο/Επωνυμία:  <span class="info-box"> </span> </p>
            <p> Ημερομηνία Γέννησης:  <span class="info-box"> </span> </p>
            <p> Διεύθυνση:  <span class="info-box"> </span> </p>            
            <p> Ταχυδρομικός Κώδικας:  <span class="info-box"> </span> </p>            
            <p> Περιοχή:  <span class="info-box"> </span> </p>            
            <p> Τηλέφωνο Επικοινωνίας:  <span class="info-box"> </span> </p>
            <p> Email:  <span class="info-box"> </span> </p>

            <a href="editProfile.jsp"> <button> Επεξεργασία Στοιχείων </button>

        </div>
    </div>

    <footer>
        <div class="container_12">
            <div class="grid_12">
            <p>Pawie &copy; 2023 | <a href="#">Privacy Policy</a> | Design by: <a href="http://www.templatemonster.com/">TemplateMonster.com, ismgroup43 </a></p>
            </div>
        </div>
    </footer>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>	
  </body>
</html>