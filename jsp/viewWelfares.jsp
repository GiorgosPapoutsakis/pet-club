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
int offset = 0, total_welfares_count = 0;
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
  
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>ViewWelfares</title>
  <link rel="icon" href="images/favicon.ico">

  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.min.css">	
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">

  <!-- Template -->
  <link rel="stylesheet" href="css/style.css">

  <!-- background -->
  <link rel="stylesheet" href="css/background.css">

  <style>
    table {
      background-color: rgb(220, 220, 220);
    }
  
    th {
      font-size: 200%;
      background-color: rgb(197, 197, 197);
    }

    td {
      font-size: 150%; 
    }
  </style>

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
          <table class="table table-bordered table-hover table-condensed table table-sm">
            <tr>
              <th class="text-center">#</th>
              <th class="text-center">Φιλοζωική</th>
              <th class="text-center">Περιοχή</th>
              <th class="text-center">Τηλέφωνο</th>
              <th class="text-center"></th>
            </tr>
          
          <%
          if(welfares_for_table.size() != 0){
            int count= offset;
            for(Welfare welf : welfares_for_table){
              count++;
              int wefID = welf.getPrimaryKey( welf.getUsername(), welf.getPassword() );
          %>

            <tr>
              <td class="text-center"><b><%= count %></b></td>
              <td class="text-center"><%= welf.getName() %></td>
              <td class="text-center"><%= welf.getLocation() %></td>
              <td class="text-center"><%= welf.getPhone() %></td>
              <td class="text-center">  
                <a href="fillForm.jsp?selected_welfare=<%= welf.getName() %>&welfID=<%= wefID %>"> <button type="button" class="btn btn-success"> Κάνε Αίτηση
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

        <!-- Paging Buttons -->
        <div class="text-center" style="margin-left: -80px;">
        <%
        String searched_keyword = null;
        if (request.getAttribute("remember_keyword") != null){
          searched_keyword = (String) request.getAttribute("remember_keyword");
          searched_keyword = new String(searched_keyword.getBytes("ISO-8859-1"), "UTF-8");
        }

        //Condition for Previous-Page Button
        if( offset - PAGE_LIMIT >= 0){ 
          int new_offset = offset - PAGE_LIMIT;
          
          if (searched_keyword == null){
        %>          
          <!-- No additional parameter -->
          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>">
            <button class="btn btn-success"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">    
            </span> Προηγούμενη </button>       
        <% 
          } else {
        %>
          <!-- Additional parameter: keyword -->
          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>&searchBar=<%= searched_keyword %>">
              <button class="btn btn-success"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true">    
              </span> Προηγούμενη </button>
        <%
          }
        }


        //Condition for Next-Page Button
        if( (offset + PAGE_LIMIT < total_welfares_count) && welfares_for_table.size() != 0) {
          int new_offset = offset + PAGE_LIMIT;
          
          if (searched_keyword == null){
        %>          
          <!-- No additional parameter -->
          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>">
            <button class="btn btn-success"> Επόμενη <span class="glyphicon glyphicon-arrow-right" aria-hidden="true">
            </span></button>
        <% 
          } else {
        %>        
          <!-- Additional parameter: keyword -->
          <a href="searchWelfaresController.jsp?new_offset=<%= new_offset %>&searchBar=<%= searched_keyword %>">
            <button class="btn btn-success"> Επόμενη <span class="glyphicon glyphicon-arrow-right" aria-hidden="true">
            </span></button>
        <%
          }
        }
        %>
        </div>

      </div>      
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>	

  </body>
</html>
