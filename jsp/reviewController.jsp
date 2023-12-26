<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%
int formID = 0;
if( request.getParameter("formID") == null ){
  request.setAttribute("message", "Δεν υπάρχει η συγκεκριμένη φόρμα");
%>
  <jsp:forward page="login.jsp"/>
<%
  return;
}     
formID = Integer.parseInt( request.getParameter("formID") );

boolean result = false;
if( request.getParameter("result").equals("1") ){
  result = true;
}

FormUtilities fUtil = new FormUtilities();
fUtil.updateFormResult(formID, result);

if(result == true){
  request.setAttribute("message", "Η αίτηση εγκρίθηκε επιτυχώς");
} else {
  request.setAttribute("message", "Η αίτηση απορρίφθηκε επιτυχώς");
}

%>
<jsp:forward page="reviewApplication.jsp"/>
