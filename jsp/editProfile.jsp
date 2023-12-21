<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Επεξεργασία Στοιχείων</title>
    <link rel="icon" href="images/favicon.ico">

    <!-- Bootstrap -->


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
        .file-input {
            display: none;
        }
        .change-picture-button {
            padding: 5px 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="text"], input[type="tel"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>

<body class="page1">

    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>

    <div class="profile-container">
        <h2>My Profile</h2>
        <!--Change Picture-->
        <div class="profile-container">
            <div class="profile-details">
                <img class="profile-picture" id="profileImage" src="images/blank-profile-picture.jpg" alt="Your Profile Picture">
                <label for="fileInput" class="change-picture-button">Αλλαγή Φωτογραφίας</label>
                <input type="file" id="fileInput" class="file-input" accept="image/*">
            </div>
                
            <button class="edit-button">Αποθήκευση</button>
        </div>
        
        <script>
            const fileInput = document.getElementById('fileInput');
            const profileImage = document.getElementById('profileImage');
        
            fileInput.addEventListener('change', function() {
                const file = fileInput.files[0];
                const reader = new FileReader();
        
                reader.onload = function(e) {
                    profileImage.src = e.target.result;
                }
        
                if (file) {
                    reader.readAsDataURL(file);
                }
            });
        </script>

        <!--Change other info-->
        <div class="profile-info">
            <p> Ονοματεπώνυμο/Επωνυμία:  <input type="text" id="name" > </p>
            <p> Ημερομηνία Γέννησης:  <input type="text" id="date" > </p>
            <p> Διεύθυνση:  <input type="text" id="address" > </p>
            <p> Ταχυδρομικός Κώδικας:  <input type="tel" id="code" pattern="[0-4]{5}" > </p>
            <p> Περιοχή:  <input type="text" id="area" > </p>
            <p> Τηλέφωνο Επικοινωνίας:  <input type="tel" id="phoneNumber" pattern="[0-9]{10}" > </p>
            <p> Email:  <input type="text" id="email" > </p>
            <button class="save-button">Αποθήκευση Στοιχείων</button>
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