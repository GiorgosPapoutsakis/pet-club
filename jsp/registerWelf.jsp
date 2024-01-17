<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Register</title>
  <link rel="icon" href="images/favicon.ico">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">	
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <!-- Template -->
  <link rel="stylesheet" href="css/style.css">

  
  <!-- background -->
  <link rel="stylesheet" href="css/background2.css">

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
  <%@ include file="navbar.jsp" %>

  <div class="container theme-showcase" role="main">
    <div class="page-header">
      <h2 class="ic1">Welfare Registration </h2>
    </div>

    <% 
    if(request.getAttribute("error_message") != null) { 
      List<String> formErrors = (List<String>) request.getAttribute("error_message");
        //test
    %>		
    <div class="alert alert-danger text-center" role="alert">
      <ul>
      <%
        for (int i=0; i < formErrors.size(); i++){
      %>
        <li><%= formErrors.get(i) %></li>
      <%
        }
      %>
      </ul>
    </div>
    <% 
    }

    if(request.getAttribute("success_message") != null) { 
    %>		
    <div class="alert alert-success text-center" role="alert"><%=(String) request.getAttribute("success_message") %></div>
    <% 
    }
    %>

    <div class="form-group">
      <div>
        <a href="registerVol.jsp"> <button type="button" class="btn btn-warning"> Εθελοντής </button>  </a>
        <a href="registerWelf.jsp"> <button type="button" class="btn btn-warning" disabled> Φιλοζωική </button>  </a>             
      </div>
    </div>

    <!--
    <div class="form-group">
      <img class="img" src="images/page2_img2.jpg">
      <img class="img" src="images/page3_img3.jpg">
      <img class="img" src="images/page3_img1.jpg">
      <img class="img" src="images/page3_img5.jpg">
    </div>
    -->

    <!-- form -->
    <form action="registerController.jsp" method="post" class="form-horizontal">

      <!-- form type -->
      <div class="form-group">
        <div class="col-sm-9">
        <input type="hidden" name="formType" id="formType" class="form-control" value="welf" >
        </div>
      </div>
      <!-- username -->
      <div class="form-group">
        <label for="username" class="col-sm-3 control-label">Username</label>
        <div class="col-sm-9">
        <input type="text" name="username" id="username" class="form-control" >
        </div>
      </div>   
      <!-- password --> 
      <div class="form-group">
        <label for="password" class="col-sm-3 control-label">Password</label>
        <div class="col-sm-9">
        <input type="text" name="password" id="password" class="form-control">
        </div>
      </div>     
      <!-- name -->
      <div class="form-group">
        <label for="name" class="col-sm-3 control-label">Ονομασία</label>
        <div class="col-sm-9">
        <input type="text" name="name" id="name" class="form-control" >
        </div>
      </div>
      <!-- owner --> 
      <div class="form-group">
        <label for="name" class="col-sm-3 control-label">Ιδιοκτήτης</label>
        <div class="col-sm-9">
        <input type="text" name="owner" id="name" class="form-control" >
        </div>
      </div> 
      <!-- email -->
      <div class="form-group">
        <label for="name" class="col-sm-3 control-label">ΑΦΜ</label>
        <div class="col-sm-9">
        <input type="text" name="vat" id="name" class="form-control" >
        </div>
      </div>
      <!-- phone -->
      <div class="form-group">
        <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
        <div class="col-sm-9">
        <input type="text" name="phone" id="surname" class="form-control" >
        </div>
      </div>
      <!-- location -->   
      <div class="form-group">
        <label for="phone" class="col-sm-3 control-label">Τοποθεσία</label>
        <div class="col-sm-9">
        <input type="text" name="location" id="surname" class="form-control" >
        </div>
      </div>   


      <!-- buttons -->
      <div class="form-group">
        <div class="col-sm-9 col-sm-offset-3">
        <button type="submit" class="submitbutton">
          Εγγραφή
        </button> 
        <button type="reset" class="clearbutton">
          Εκκαθάριση
        </button>              
        </div>
      </div>

    </form>
  </div>

  <!-- footer -->
  <%@ include file="footer.jsp" %> 
    
  <script src="js/jquery.min.js"></script>
  <script	src="js/bootstrap.min.js"></script>
</body>
</html>