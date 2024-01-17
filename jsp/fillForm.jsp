<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="omadiki_ergasia.*" %>

<%
// authentication
if (session.getAttribute("volObj") == null) {
  request.setAttribute("message", "Πρέπει να συνδεθείτε για να συμπληρώσετε την αίτηση");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
}    
Volunteer logged_user = (Volunteer) session.getAttribute("volObj");


//no welfare chosen
if (request.getParameter("selected_welfare") == null){
  request.setAttribute("error_message", "Επιλέξτε κάποια φιλοζωική");
}
String selected_welfare_name = request.getParameter("selected_welfare");
String welfID = request.getParameter("welfID");

//Greek characters input
GreekWord gWord = new GreekWord();
selected_welfare_name = gWord.acceptGreekInput(selected_welfare_name);


%>

<!DOCTYPE html>
<html lang="en">
  <head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Form</title>
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
        <h2 class="ic1">Αίτηση Εθελοντή</h2>
    </div>


    <div class="row">                    
      <div class="col-xs-10">

    
        <form action="createFormController.jsp?welfarePK=<%= welfID %>" method="POST" class="form-horizontal">
            
          <!-- welfares -->
          <div class="form-group">
            <label for="welfare" class="col-sm-3 control-label">Φιλοζωική</label>
            <div class="col-sm-9">
              <input type="text" name="welfare" id="welfare" value="<%= selected_welfare_name %>" class="form-control" readonly>
            </div>
          </div>      
          <!-- name -->
          <div class="form-group">
            <label for="name" class="col-sm-3 control-label">Όνομα</label>
            <div class="col-sm-9">
              <input type="text" name="name" id="name" value="<%= logged_user.getFirstname() %>" class="form-control" readonly>
            </div>
          </div>   
          <!-- lastName --> 
          <div class="form-group">
            <label for="lastName" class="col-sm-3 control-label">Επίθετο</label>
            <div class="col-sm-9">
              <input type="text" name="lastName" id="lastName" value="<%= logged_user.getLastname() %>"  class="form-control" readonly>
            </div>
          </div>     
          <!-- phone -->
          <div class="form-group">
            <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
            <div class="col-sm-9">
              <input type="text" name="phone" id="phone" value="<%= logged_user.getPhone() %>" class="form-control" readonly>
            </div>
          </div> 
          <!-- email -->
          <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
              <input type="text" name="email" id="email" value="<%= logged_user.getEmail() %>" class="form-control" readonly>
            </div>
          </div>
          <!-- location -->
          <div class="form-group">
            <label for="location" class="col-sm-3 control-label">Περιοχή</label>
            <div class="col-sm-9">
              <input type="text" name="location" id="location" value="<%= logged_user.getLocation() %>" class="form-control" readonly>
            </div>
          </div>          
          <!-- address -->
          <div class="form-group">
            <label for="address" class="col-sm-3 control-label">Διεύθυνση</label>
            <div class="col-sm-9">
              <input type="text" name="address" id="address" class="form-control">
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
							<select id="experience" name="experience" class="form-control">
								<option value="0-1">0-1 έτη</option>
								<option value="1-3">1-3 έτη</option>	
                <option value="3+">3 ή περισσότερα έτη</option>             
							</select>
            </div>
          </div>
          <!-- comments -->
          <div class="form-group">
            <label for="comments" class="col-sm-3 control-label">Σχόλια</label>
            <div class="col-sm-9">
              <input type="text" name="comments" id="comments" class="form-control">
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

        <!-- footer -->
        <%@ include file="footer.jsp" %> 
        
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>	    
  
  </body>
</html>