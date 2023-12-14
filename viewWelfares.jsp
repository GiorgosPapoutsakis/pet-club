<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%
List<Welfare> welfares_for_table = new ArrayList<Welfare>();
 
if( request.getAttribute("welfare_table_list") != null){
  welfares_for_table = (List<Welfare>) request.getAttribute("welfare_table_list");
} else {
  response.sendRedirect("searchWelfaresController.jsp");
}

// TablePaging
int PAGE_LIMIT = 5;
int offset = 0, total_welfares_count = 5;
if( request.getAttribute("current_offset") != null ){
  offset = (Integer) request.getAttribute("current_offset");
}
if( request.getAttribute("total_welfares") != null ){
  total_welfares_count = (Integer) request.getAttribute("total_welfares");
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ViewWelfares</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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

<style>
  th {
    font-size: 170%; 
  }

  td {
    font-size: 140%; 
  }

  body {
    background-image: url('images/background3.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }

</style>


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
				<h2 class="ic1">Ανακάλυψε τις φιλοζωικές δίπλα σου</h2>
			</div>
      
      <!-- searchBar & button -->
      <div class="col-xs-12" style="margin-bottom: 30px;">
        <form action="searchWelfaresController.jsp" class="form-horizontal">          
            <div class="form-group">
              <label for="searchBar" class="col-sm-9 control-label"></label>
              <div class="col-sm-9">
                <input type="text" name="searchBar" id="searchBar" class="form-control" placeholder=" Όνομασία ή Περιοχή ή Τηλέφωνο">
              </div>
            </div>             

            <div class="form-group">
              <div class="col-sm-9">
                <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>Αναζήτηση
                </button>              
              </div>
            </div>         
        </form>
      </div>


      <!-- table -->
      <div class="col-xs-12">

        <div class="table-responsive">
          <table class="table table-bordered table-hover table-condensed table table-sm" style="background-color: rgb(255, 255, 255);">
            <tr>
              <th>#</th>
              <th>Φιλοζωική</th>
              <th>Περιοχή</th>
              <th>Τηλέφωνο</th>
              <th class="text-center"></th>
            </tr>
          
          <%
          if(welfares_for_table.size() != 0){
            int count= offset;
            for(Welfare welf : welfares_for_table){
              count++;
          %>

            <tr>
              <td><b><%= count %></b></td>
              <td><%= welf.getName() %></td>
              <td><%= welf.getLocation() %></td>
              <td><%= welf.getPhone() %></td>
              <td class="text-center">  
                <a href="fillForm.jsp"> <button type="button" class="btn btn-success"> Κάνε Αίτηση
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> </button>
              </td>               
            </tr>
                              
          <%
            }
              }else{
          %>
            
          </table>                      
          <div class="alert alert-warning text-center" role="alert">
            Δεν βρέθηκαν αποτελέσματα <br> Οι <a href="viewWelfares.jsp" class="alert-link">φιλοζωικές</a> μας
          </div>
          
          <%
            }
          %>

          </table>
        </div>

        <!-- buttons for paging -->
        <div class="text-center" style="margin-left: -80px;">
        <%
        if( offset - PAGE_LIMIT >= 0){
          int new_offset = offset - PAGE_LIMIT;
        %>

          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>"> <button class="btn btn-success">
            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Προηγούμενη </button>

        <%
        }
        if( (offset + PAGE_LIMIT < total_welfares_count) && welfares_for_table.size() != 0) {
          int new_offset = offset + PAGE_LIMIT;
        %>
          
          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>"> <button class="btn btn-success">Επόμενη
            <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span> </button>

        <%
        }
        %>
        </div>

      </div>      
    </div>


  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    

  </body>
</html>
