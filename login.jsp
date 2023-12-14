<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*" %>

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
        float: right;
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
    .registerbutton{
      background-color: rgb(0, 208, 255);
      color: white;
      border: none;
      height: 36px;
      width: 74px;
      border-radius: 18px;
      font-weight: bold;
      font-size: 15;
      cursor: pointer;
      transition: box-shadow 0.15s;
    }
    .registerbutton:hover{
      box-shadow: 5px 5px 10px rgb(0, 0, 0, 0.15);
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

    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>

    <div class="container theme-showcase" role="main">
      <div class="page-header">
        <img class="img" src="images/page4_img4.jpg">
				<h2 class="ic1">Login</h2>
			</div>
    
      <% if(request.getAttribute("message") != null) { %>		
        <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
      <% } %>

		<!-- /container -->
    <form class="form-signin" method="post" action="loginController.jsp">
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
           <!-- wel-vol -->
          <div class="form-group">
		   <label class="col-sm-3 control-label"></label>
             <div class="col-sm-9">
              <label class="radio-inline">
                <input type="radio" name="choice" value="volunteer" checked> Volunteer
             </label>
              <label class="radio-inline">
                    <input type="radio" name="choice" value="welfare"> Welfare
                </label>              
             </div>
            </div>   
         <!-- buttons -->
         <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
              <button type="submit" class="submitbutton">
                Login
              </button> 
              <button type="reset" class="clearbutton">
                Cancel
              </button>   
              <button class="registerbutton">
                <a href="register.jsp">Register</a>
              </button>              
            </div>
          </div>

        </form>
      </div>
    </body>
     
<script src="../js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
<script	src="../js/bootstrap.min.js"></script>
<script src="js/jquery.ui.totop.js"></script>
</body>
</html>