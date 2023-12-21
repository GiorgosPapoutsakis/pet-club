<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="omadiki_ergasia.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>FillForm</title>
  <link rel="icon" href="images/favicon.ico">


  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.min.css">	
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <!-- Template -->
  <link rel="stylesheet" href="css/style.css">



  <style>
    form { 
      max-width: 600px; 
    }

  </style>



  </head>
  <body>
    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>

    <div class="container theme-showcase" role="main">
      <div class="page-header">
        <h2 class="ic1">Αίτηση Εθελοντή</h2>
    </div>


    <div class="row">                    
      <div class="col-xs-10">
    
        <form action="#" method="GET" class="form-horizontal">
            
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
    </div>
        
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>	    
  
  </body>
</html>