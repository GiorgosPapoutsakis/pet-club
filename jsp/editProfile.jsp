<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*" %>

<%

// authentication
if (session.getAttribute("volObj") == null & session.getAttribute("welfObj") == null) {
  request.setAttribute("message", "Πρέπει να συνδεθείτε για να επεξεργαστείτε το προφίλ σας");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
} 

if(session.getAttribute("volObj") !=null) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String lastname = request.getParameter("lastname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
    String location = request.getParameter("location");
} else {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String owner = request.getParameter("owner");
    String vat = request.getParameter("vat");
    String phone = request.getParameter("phone");
    String location = request.getParameter("location");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Edit Profile</title>
    <link rel="icon" href="images/favicon.ico">

    <!-- Bootstrap -->
     <link rel="stylesheet" href="css/bootstrap.min.css">	
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

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
        .submitbutton{
        background-color: rgb(183, 255, 0);
        color: white;
        border: none;
        height: 40px;
        width: 100px;
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
    </style>

  <!-- background -->
  <link rel="stylesheet" href="css/background2.css">
</head>

<body class="page1">

    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %>

    <%

    if(session.getAttribute("volObj") !=null) {
        Volunteer vol = (Volunteer) session.getAttribute("volObj");
        

    %>
                    <div class="profile-container" style= "text-align:center">
                        <h2>Επεξεργασία Προφίλ</h2>
                        <!--Profile image-->
                        <div>
                        <img class="profile-picture" src="images/blank-profile-picture.jpg" alt="Your Profile Picture">
                        </div>

                    <div>
                        <!--Profile info-->
                        <form class="form-horizontal" action="editProfileController.jsp" method="post">
                        <div class="profile-info">
                            <!-- username -->
                      <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">Όνομα Χρήστη</label>
                        <div class="col-sm-9">
                          <input type="text" name="username" id="username" class="form-control" value= <%=vol.getUsername()%> readonly>
                        </div>
                      </div>   
                      <!-- password --> 
                      <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Κωδικός</label>
                        <div class="col-sm-9">
                          <input type="password" name="password" id="password" class="form-control" value= <%=vol.getPassword()%> required>
                        </div>
                      </div>     
                      <!-- name -->
                      <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Όνομα</label>
                        <div class="col-sm-9">
                          <input type="text" name="name" id="name" class="form-control" value=<%=vol.getFirstname()%> required>
                        </div>
                      </div> 
                      <!-- last name -->
                      <div class="form-group">
                        <label for="lastname" class="col-sm-3 control-label">Επίθετο </label>
                        <div class="col-sm-9">
                          <input type="text" name="lastname" id="lastname" class="form-control" value=<%=vol.getLastname()%> required>
                        </div>
                      </div> 
                      <!-- email -->
                      <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9">
                          <input type="text" name="email" id="email" class="form-control" value=<%=vol.getEmail()%> required>
                        </div>
                      </div>
                      <!-- phone -->
                      <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
                        <div class="col-sm-9">
                          <input type="text" name="phone" id="phone" class="form-control" value=<%=vol.getPhone()%> required>
                        
                        </div>
                        </div>
                    <!-- age -->
                      <div class="form-group">
                        <label for="age" class="col-sm-3 control-label">Ηλικία</label>
                        <div class="col-sm-9">
                          <input type="text" name="age" id="age" class="form-control" value=<%=vol.getAge()%> required>
                        
                        </div>
                      </div>
                      <!-- location -->
                      <div class="form-group">
                        <label for="location" class="col-sm-3 control-label">Πόλη</label>
                        <div class="col-sm-9">
                          <input type="text" name="location" id="location" class="form-control" value="<%=vol.getLocation()%>" required>
                        
                        </div>
                        </div>

                     <div class="form-group">
                        <div style="text-align:center">
                        
                            <button type="submit" class="submitbutton">
                              Αποθήκευση Στοιχείων
                            </button> 
                        </div>
                        
                    </div>
                        </form>
                    </div>
                </div>


    <% }else{
                Welfare welf = (Welfare) session.getAttribute("welfObj");
                

    %>
                    <div class="profile-container" style= "text-align:center">
                        <h2>Επεξεργασία Προφίλ</h2>
                        <!--Profile image-->
                        <div>
                        <img class="profile-picture" src="images/blank-profile-picture.jpg" alt="Your Profile Picture">
                        </div>

                    <div>
                        <!--Profile info-->
                        <form class="form-horizontal" action="editProfileController.jsp" method="post">
                        <div class="profile-info">
                            <!-- username -->
                      <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">Όνομα Χρήστη</label>
                        <div class="col-sm-9">
                          <input type="text" name="username" id="username" class="form-control" value= <%=welf.getUsername()%> readonly >
                        </div>
                      </div>   
                      <!-- password --> 
                      <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Κωδικός</label>
                        <div class="col-sm-9">
                          <input type="password" name="password" id="password" class="form-control" value= <%=welf.getPassword()%> required>
                        </div>
                      </div>     
                      <!-- name -->
                      <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Όνομα</label>
                        <div class="col-sm-9">
                          <input type="text" name="name" id="name" class="form-control" value="<%=welf.getName()%>" required>
                        </div>
                      </div> 
                      <!-- owner -->
                      <div class="form-group">
                        <label for="owner" class="col-sm-3 control-label">Ιδιοκτήτης </label>
                        <div class="col-sm-9">
                          <input type="text" name="owner" id="owner" class="form-control" value="<%=welf.getOwner()%>" required>
                        </div>
                      </div> 
                      <!-- vat -->
                      <div class="form-group">
                        <label for="email" class="col-sm-3 control-label">ΑΦΜ</label>
                        <div class="col-sm-9">
                          <input type="text" name="vat" id="vat" class="form-control" value=<%=welf.getVat()%> required>
                        </div>
                      </div>
                      <!-- phone -->
                      <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">Τηλέφωνο</label>
                        <div class="col-sm-9">
                          <input type="text" name="phone" id="phone" class="form-control" value=<%=welf.getPhone()%> required>
                        
                        </div>
                        </div>
                      <!-- location -->
                      <div class="form-group">
                        <label for="location" class="col-sm-3 control-label">Πόλη</label>
                        <div class="col-sm-9">
                          <input type="text" name="location" id="location" class="form-control" value="<%=welf.getLocation()%>" required>
                        
                        </div>
                        </div>

                     <div class="form-group">
                        <div style="text-align:center">
                        
                            <button type="submit" class="submitbutton">
                              Αποθήκευση Στοιχείων
                            </button> 
                        </div>
                        
                    </div>
                        </form>
                    </div>
                </div>
                
    <%
    }

    %>

    <footer>
        <div >
            <div class="grid_12">
            <p>Pawie &copy; 2023 | Privacy Policy | ismgroup43 - cssTemplates: TemplateMonster.com, Bootstrap4</p>
            </div>
        </div>
    </footer>
            

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>	
  </body>
</html>