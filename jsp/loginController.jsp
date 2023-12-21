<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="omadiki_ergasia.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String choice = request.getParameter("choice");

if (choice != null && choice.equals("volunteer")) { 

    VolunteerUtilities volUtil = new VolunteerUtilities();

    try {
    
        Volunteer loged_volunteer = volUtil.authenticate(username, password);        
        session.setAttribute("volObj", loged_volunteer);
        response.sendRedirect("index.jsp");
        return;
    
    } catch (Exception e) {
    
        request.setAttribute("message", e.getMessage());
    
    }

}else if (choice != null && choice.equals("welfare")) {

    WelfareUtilities welfUtil = new WelfareUtilities();

    try {

        Welfare logged_welfare = welfUtil.authenticate(username, password);    
        session.setAttribute("welfObj", logged_welfare);
        response.sendRedirect("index.jsp");
        return;

    } catch(Exception e) {

        request.setAttribute("message", e.getMessage());
    }

} else {
    request.setAttribute("message", "Fill all options");
}
%>

<jsp:forward page="login.jsp" />
