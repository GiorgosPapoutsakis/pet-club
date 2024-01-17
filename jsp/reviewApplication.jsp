<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%

// Authentication
if (session.getAttribute("welfObj") == null) {
  request.setAttribute("message", "Δεν έχετε συνδεθεί");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
}    
Welfare logged_welfare = (Welfare) session.getAttribute("welfObj");
int welfPK = logged_welfare.getPrimaryKey( logged_welfare.getUsername(), logged_welfare.getPassword() );


// TablePaging
int PAGE_LIMIT = 1;
int offset = 0;
int totalUnreviewedForms = 0;
if( request.getParameter("new_offset") != null ){
  offset = Integer.parseInt( request.getParameter("new_offset") );
}

// GetForm
FormUtilities fUtil = new FormUtilities();
ApplicationForm formToReview = fUtil.getSingleUnreviewedFormByWelfID(welfPK, offset);
totalUnreviewedForms = fUtil.getCountUnreviewedFormsByWelfID(welfPK);
%>


<!DOCTYPE html>
<html lang="en">
  <head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Applications</title>
  <link rel="icon" href="images/favicon.ico">


  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.min.css">	
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <!-- Template -->
  <link rel="stylesheet" href="css/style.css">

    <!-- background -->
    <link rel="stylesheet" href="css/background2.css">



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
        <h2 class="ic1">Συνολικές Αιτήσεις <span class="badge"><%= totalUnreviewedForms %></span> </h2>
    </div>

    <% 
    if( request.getAttribute("success_message") != null){ 
    %>		
    <div class="alert alert-success text-center" role="alert"><%=(String) request.getAttribute("success_message") %> </div>
    <%
    }


    if( totalUnreviewedForms == 0){
    %>
    
    <div class="alert alert-warning text-center" role="alert">
      Δεν υπάρχουν αιτήσεις για αξιολόγηση
    </div>

    <%
    } else {
    %>

    <div class="row">                    
      <div class="col-xs-10">
   
        <form action="#>" method="POST" class="form-horizontal">
            
          <!-- welfares -->
          <div class="form-group">
            <label for="welfare" class="col-sm-3 control-label">Φιλοζωική</label>
            <div class="col-sm-9">
              <input type="text" name="welfare" id="welfare" value="<%= formToReview.getWelfareName() %>" class="form-control" readonly>
            </div>
          </div>      
          <!-- name -->
          <div class="form-group">
            <label for="name" class="col-sm-3 control-label">Όνομα</label>
            <div class="col-sm-9">
              <input type="text" name="name" id="name" value="<%= formToReview.getName() %>" class="form-control" readonly>
            </div>
          </div>   
          <!-- lastName --> 
          <div class="form-group">
            <label for="lastName" class="col-sm-3 control-label">Επίθετο</label>
            <div class="col-sm-9">
              <input type="text" name="lastName" id="lastName" value="<%= formToReview.getSurname() %>"  class="form-control" readonly>
            </div>
          </div>     
          <!-- phone -->
          <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
            <div class="col-sm-9">
              <input type="text" name="phone" id="phone" value="<%= formToReview.getPhone() %>" class="form-control" readonly>
            </div>
          </div> 
          <!-- email -->
          <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
              <input type="text" name="email" id="email" value="<%= formToReview.getEmail() %>" class="form-control" readonly>
            </div>
          </div>
          <!-- location -->
          <div class="form-group">
            <label for="location" class="col-sm-3 control-label">Περιοχή</label>
            <div class="col-sm-9">
              <input type="text" name="location" id="location" value="<%= formToReview.getLocation() %>" class="form-control" readonly>
            </div>
          </div>          
          <!-- address -->
          <div class="form-group">
            <label for="address" class="col-sm-3 control-label">Διεύθυνση Κατοικίας</label>
            <div class="col-sm-9">
              <input type="text" name="address" id="address" value="<%= formToReview.getAddress() %>" class="form-control" readonly>
            </div>
          </div>
          <!-- job -->
          <div class="form-group">
            <label for="job" class="col-sm-3 control-label">Εργασία</label>
            <div class="col-sm-9">
              <input type="text" name="job" id="job" value="<%= formToReview.getJob() %>" class="form-control" readonly>
            </div>
          </div>
          <!-- experience -->
          <div class="form-group">
            <label for="experience" class="col-sm-3 control-label">Εμπειρία</label>
            <div class="col-sm-9">
              <input type="experience" name="experience" id="experience" value="<%= formToReview.getExprerience() %>" class="form-control" readonly>
            </div>
          </div>
          <!-- comments -->
          <div class="form-group">
            <label for="comments" class="col-sm-3 control-label">Σχόλια</label>
            <div class="col-sm-9">
              <input type="text" name="comments" id="comments" class="form-control" value="<%= formToReview.getMoreInfo() %>" readonly></textarea>
            </div>
          </div>
            
          <!-- review buttons -->
          <div class="form-group">
            <div class="col-sm-9 col-sm-offset-3">

              <a href="reviewController.jsp?formID=<%= formToReview.getFormID() %>&result=1"> <button type="button" class="btn btn-success">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Έγκριση
              </button> </a> 
              <a href="reviewController.jsp?formID=<%= formToReview.getFormID() %>&result=0"> <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Απόρριψη
              </button> </a>             
            </div>
          </div>

        </form>
      </div>
    </div>

    <%
    }
    %>

    <!-- Paging Buttons -->
    <div class="text-center" style="margin-left: -80px;">
    <%

    //Condition for Previous-Page Button
    if( offset - PAGE_LIMIT >= 0){ 
      int new_offset = offset - PAGE_LIMIT;

    %>          
      <!-- Previous-Page Button -->
      <a href="reviewApplication.jsp?new_offset=<%= new_offset %>">
        <button class="btn btn-success"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">    
        </span> Προηγούμενη </button> </a>   
    <% 
      
    }
    //Condition for Next-Page Button
    if( (offset + PAGE_LIMIT < totalUnreviewedForms) && totalUnreviewedForms != 0) {
      int new_offset = offset + PAGE_LIMIT;
  
    %>          
      <!-- Next-Page Button -->
      <a href="reviewApplication.jsp?new_offset=<%= new_offset %>">
        <button class="btn btn-success"> Επόμενη <span class="glyphicon glyphicon-arrow-right" aria-hidden="true">
        </span></button> </a> 
        
    <%             
    }
    %>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %> 
        
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>	    
  
  </body>
</html>





