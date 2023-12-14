<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="omadiki_ergasia.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>FillForm</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">	
<!-- Bootstrap Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- Custom styles for this template -->
<link href="css/theme_8XXXXXX.css" rel="stylesheet">
  <style type="text/css">
      form { max-width: 600px; }
      .main-label { font-size: 16px; }
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
            <li><a href="index.html">Home</a></li>
            <li><a href="viewProfile.html">MyProfile</a></li>
            <li class="current"><a href="viewWelfares.html">Walfares</a></li>
            
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
				<h2 class="ic1">Αίτηση Εθελοντή</h2>
			</div>

		<!-- /container -->
    <form action="servlet/RegisterExample1" method="GET" class="form-horizontal">
         
          <!-- welfares -->
          <div class="form-group">
            <label for="welfare" class="col-sm-3 control-label">Φιλοζωική</label>
            <div class="col-sm-9">
              <input type="text" name="welfare" id="welfare" class="form-control">
            </div>
          </div>      
          <!-- name -->
          <div class="form-group">
            <label for="ame" class="col-sm-3 control-label">Όνομα</label>
            <div class="col-sm-9">
              <input type="text" name="name" id="name" class="form-control">
            </div>
          </div>   
          <!-- lastName --> 
          <div class="form-group">
            <label for="lastName" class="col-sm-3 control-label">Επίθετο</label>
            <div class="col-sm-9">
              <input type="text" name="lastName" id="lastName" class="form-control">
            </div>
          </div>     
           <!-- phone -->
           <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
            <div class="col-sm-9">
              <input type="text" name="phone" id="phone" class="form-control">
            </div>
          </div> 
           <!-- email -->
           <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
              <input type="text" name="email" id="email" class="form-control">
            </div>
          </div>
          <!-- location -->
          <div class="form-group">
            <label for="location" class="col-sm-3 control-label">Κατοικία</label>
            <div class="col-sm-9">
              <input type="text" name="location" id="location" class="form-control">
            </div>
          </div>
          <!-- job -->
          <div class="form-group">
            <label for="job" class="col-sm-3 control-label">Εργασία</label>
            <div class="col-sm-9">
              <input type="text" name="job" id="job" class="form-control">
            </div>
          </div>
          <!-- experience -->
          <div class="form-group">
            <label for="experience" class="col-sm-3 control-label">Εμπειρία</label>
            <div class="col-sm-9">
              <input type="text" name="experience" id="experience" class="form-control">
            </div>
          </div>
          <!-- comments -->
          <div class="form-group">
            <label for="comments" class="col-sm-3 control-label">Σχόλια</label>
            <div class="col-sm-9">
              <textarea name="comments" id="comments" class="form-control" style="height: 120px;"></textarea>
            </div>
          </div>
             
         <!-- buttons -->
         <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">
              <button type="submit" class="btn btn-success">
                Υποβολή
              </button> 
              <button type="reset" class="btn btn-danger">
                Εκκαθάριση
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