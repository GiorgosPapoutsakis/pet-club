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
                <a href="viewProfile.jsp">Προφίλ</a> </li>  

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewWelfares.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("fillForm.jsp") ? "current" : "" %>">
                <a href="viewWelfares.jsp">Φιλοζωικές</a> </li>

              <li><a href="logout.jsp">Αποσύνδεση</a></li>

              <li style="font-size: 120%;"><%= vol.getFirstname() %> <%= vol.getLastname() %> </li>

  
            <!-- Navigation Bar for Welfare -->
            <%
            }else if( session.getAttribute("welfObj") != null ){
                Welfare welf = (Welfare) session.getAttribute("welfObj");
            %>
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewProfile.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("editProfile.jsp") ? "current" : "" %>">
                <a href="viewProfile.jsp">Προφίλ</a> </li> 

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("reviewApplication.jsp") ? "current" : "" %>">
                  <a href="reviewApplication.jsp">Αιτήσεις</a> </li>
  
              <li><a href="logout.jsp">Αποσύνδεση</a></li>
  
              <li><%= welf.getName() %> </li>
            
                
            <!-- Navigation Bar for guest -->
            <%
            }else{
            %>
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("viewWelfares.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("fillForm.jsp") ? "current" : "" %>">
                <a href="viewWelfares.jsp">Φιλοζωικές</a> </li>

              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("login.jsp") ? "current" : "" %>">
                <a href="login.jsp">Σύνδεση</a> </li>
                
              <li class="<%=request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("registerVol.jsp")
                || request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).equals("registerWelf.jsp") ? "current" : "" %>"> 
                <a href="registerVol.jsp">Εγγραφή</a> </li>
            <%
            }
            %>

            </ul>
          </nav>          
        </div>        
      </div>
    </div>
</header>