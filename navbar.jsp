<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header>
    <div class="container_12">
      <div class="grid_12">
        <h1> <img src="images/pawie.png" alt=""> </h1>
        <div class="menu_block">
          <nav>
            <ul class="sf-menu">
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("index.jsp") ? "current" : "" %>">
                <a href="index.jsp">Home</a> </li>

            <!-- Navigation Bar for Volunteer -->
            <% 
            if( session.getAttribute("volObj") != null){
                Volunteer vol = (Volunteer) session.getAttribute("volObj");
            %>
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewProfile.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("editProfile.jsp") ? "current" : "" %>">
                <a href="viewProfile.jsp">MyProfile</a> </li>  

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewWelfares.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("fillForm.jsp") ? "current" : "" %>">
                <a href="viewWelfares.jsp">Φιλοζωικές</a> </li>

              <li><a href="logout.jsp">Logout</a></li>

              <li style="font-size: 120%;"><%= vol.getFirstname() %> <%= vol.getLastname() %> </li>

  
            <!-- Navigation Bar for Welfare -->
            <%
            }else if( session.getAttribute("welfObj") != null ){
                Welfare welf = (Welfare) session.getAttribute("welfObj");
            %>
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewProfile.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("editProfile.jsp") ? "current" : "" %>">
                <a href="viewProfile.jsp">MyProfile</a> </li> 

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewApplications.jsp") ? "current" : "" %>">
                  <a href="index.jsp">Αιτήσεις</a> </li>
  
              <li><a href="logout.jsp">Logout</a></li>
  
              <li><%= welf.getName() %> </li>
            
                
            <!-- Navigation Bar for guest -->
            <%
            }else{
            %>
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewWelfares.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("fillForm.jsp") ? "current" : "" %>">
                <a href="viewWelfares.jsp">Φιλοζωικές</a> </li>

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("login.jsp") ? "current" : "" %>">
                <a href="login.jsp">Log in</a> </li>
                
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("register.jsp") ? "current" : "" %>">
                <a href="register.jsp">Register</a> </li>
            <%
            }
            %>

            </ul>
          </nav>          
        </div>        
      </div>
    </div>
</header>