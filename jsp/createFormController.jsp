<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%
// Authentication
if (session.getAttribute("volObj") == null) {
  request.setAttribute("message", "Δεν έχετε συνδεθεί");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
}    
Volunteer logged_user = (Volunteer) session.getAttribute("volObj");


// If controller was called by url or no welfare was picked
if ( request.getParameter("welfare")==null && request.getParameter("welfarePK")==null){
    request.setAttribute("message", "Δεν έχετε επιλέξει φιλοζωική");
%>
<jsp:forward page="login.jsp"/>
<%
    return;
}

GreekWord gWord = new GreekWord();

String welfareName = request.getParameter("welfare");
int welfID = Integer.parseInt(request.getParameter("welfarePK"));
int volID = logged_user.getPrimaryKey( logged_user.getUsername(), logged_user.getPassword() );

String name = request.getParameter("name");
String surname = request.getParameter("lastName");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String location = request.getParameter("location");

welfareName = gWord.acceptGreekInput(welfareName);
name = gWord.acceptGreekInput(name);
surname = gWord.acceptGreekInput(surname);
phone = gWord.acceptGreekInput(phone);
email = gWord.acceptGreekInput(email);
location = gWord.acceptGreekInput(location);

String address = request.getParameter("address");
address = gWord.acceptGreekInput(address);

String job = request.getParameter("job");
job = gWord.acceptGreekInput(job);

String experience = request.getParameter("experience");
experience = gWord.acceptGreekInput(experience);

String moreInfo = request.getParameter("comments");
moreInfo = gWord.acceptGreekInput(moreInfo);




ApplicationForm form = new ApplicationForm(0,welfareName,name,surname,phone,email,location,address,job,
 experience,moreInfo,volID,welfID);

FormUtilities fUtil = new FormUtilities();
fUtil.createForm(form);


%>
<jsp:forward page="index.jsp"/>