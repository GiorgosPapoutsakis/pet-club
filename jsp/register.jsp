<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Εγγραφή</title>
  <link rel="icon" href="images/favicon.ico">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">	
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <!-- Template -->
  <link rel="stylesheet" href="css/style.css">

  <style type="text/css">
    form { max-width: 600px; }
    .main-label { font-size: 16px; }
    .img {
      height: 110px;
      margin-right: 25px;
    }
  </style>

  <!-- Custom Buttons -->
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

</head>
<body>

<!-- navigation bar -->
<%@ include file="navbar.jsp" %>  

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
		
    <form method="post" action="registerController.jsp" class="form-horizontal">
      <!-- username -->
      <div class="form-group">
        <label for="username" class="col-sm-3 control-label">Username</label>
        <div class="col-sm-9">
          <input type="text" name="username" id="username" class="form-control" placeholder="username">
        </div>
      </div>   
      <!-- password --> 
      <div class="form-group">
        <label for="password" class="col-sm-3 control-label">Password</label>
        <div class="col-sm-9">
          <input type="password" name="password" id="password" class="form-control" placeholder="password">
        </div>
      </div>     
      <!-- name -->
      <div class="form-group">
        <label for="name" class="col-sm-3 control-label">Name</label>
        <div class="col-sm-9">
          <input type="text" name="name" id="name" class="form-control" placeholder="Name">
        </div>
      </div> 
      <!-- last name -->
      <div class="form-group">
        <label for="lastname" class="col-sm-3 control-label">Last Name</label>
        <div class="col-sm-9">
          <input type="text" name="lastname" id="lastname" class="form-control" placeholder="Last Name">
        </div>
      </div> 
      <!-- email -->
      <div class="form-group">
        <label for="email" class="col-sm-3 control-label">Email</label>
        <div class="col-sm-9">
          <input type="text" name="email" id="email" class="form-control" placeholder="Email">
        </div>
      </div>
      <!-- phone -->
      <div class="form-group">
        <label for="phone" class="col-sm-3 control-label">Phone</label>
        <div class="col-sm-9">
          <input type="text" name="phone" id="phone" class="form-control" placeholder="Phone">
        </div>
      </div>   
      <!-- choice -->
      <div class="form-group">
        <label class="col-sm-3 control-label"></label>
        <div class="col-sm-9">
          <label class="radio-inline">
            <input type="radio" name="choice" value="welfare"> Welfare
          </label>
          <label class="radio-inline">
            <input type="radio" name="choice" value="volunteer"> Volunteer
          </label>              
        </div>
      </div>   
      <!-- buttons -->
      <div class="form-group">
        <div class="col-sm-9 col-sm-offset-3">
          <button type="submit" class="submitbutton"> Register </button> 
          <button type="reset" class="clearbutton"> Cancel </button>              
        </div>
      </div>
    </form>
  </div>
         
  <script src="js/jquery.min.js"></script>
  <script	src="js/bootstrap.min.js"></script>
</body>
</html>