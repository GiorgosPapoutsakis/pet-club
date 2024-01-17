<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>

<%
GreekWord gWord = new GreekWord();

int errorsNumber = 0;
List<String> formErrors = new ArrayList<String>();


if (request.getParameter("formType") == null){
    request.setAttribute("error_message", "Συμπληρωστε τα πεδία");
%>
<jsp:forward page="registerVol.jsp" />
<%
return;


} else if ( request.getParameter("formType").equals("vol") ) {

    String username = request.getParameter("username");
    String password = request.getParameter("password");        
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
    String location = request.getParameter("location");

    username = gWord.acceptGreekInput(username);
    password = gWord.acceptGreekInput(password);
    name = gWord.acceptGreekInput(name);
    surname = gWord.acceptGreekInput(surname);
    email = gWord.acceptGreekInput(email);
    phone = gWord.acceptGreekInput(phone);
    location = gWord.acceptGreekInput(location);


    //Parameters Validation
    if (username.length() < 3 ){
        formErrors.add("To username πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (password.length() < 4 ){
        formErrors.add("To password πρέπει να συμπληρωθεί με τουλάχιστον 4 χαρακτήρες");
    }
    if (name.length() < 3 ){
        formErrors.add("To όνομα πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (surname.length() < 3 ){
        formErrors.add("To επίθετο πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (email.length() < 3 ){
        formErrors.add("Συμπληρώστε το email σας");
    }
    if (phone.length() < 10 ){
        formErrors.add("To Τηλέφωνο πρέπει να συμπληρωθεί με τουλάχιστον 10 ψηφία");
    }
    if (location.length() < 3 ){
        formErrors.add("Η τοποθεσία πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }

    int ageInt = 0;
    try{
        ageInt = Integer.parseInt(age);
        if (ageInt < 18 ){
            formErrors.add("Πρέπει να είστε τουλάχιστον 18 ετών");
        }
    }catch(Exception e){
        formErrors.add("Η ηλικία πρέπει να είναι αριθμός");
    }


    if ( formErrors.size() == 0) {
        location = gWord.removeGreekTones(location).toUpperCase();

        VolunteerUtilities volUtil = new VolunteerUtilities();
        Volunteer vol = new Volunteer(username,password,name,surname,email,phone,ageInt,location);
        
        try{
            volUtil.register(vol);
            request.setAttribute("success_message", "Επιτυχημένη Εγγραφή!");
        } catch(Exception e) {
            formErrors.add(e.getMessage());
        }

    } else {
        request.setAttribute("error_message", formErrors);
    }
    
%>
<jsp:forward page="registerVol.jsp" />
<%
return;


} else if ( request.getParameter("formType").equals("welf") ) {

    String username = request.getParameter("username");
    String password = request.getParameter("password");        
    String name = request.getParameter("name");
    String owner = request.getParameter("owner");
    String vat = request.getParameter("vat");
    String phone = request.getParameter("phone");
    String location = request.getParameter("location");

    username = gWord.acceptGreekInput(username);
    password = gWord.acceptGreekInput(password);
    name = gWord.acceptGreekInput(name);
    vat = gWord.acceptGreekInput(vat);
    phone = gWord.acceptGreekInput(phone);
    location = gWord.acceptGreekInput(location);


    //Parameters Validation
    if (username.length() < 3 ){
        formErrors.add("To username πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (password.length() < 4 ){
        formErrors.add("To password πρέπει να συμπληρωθεί με τουλάχιστον 4 χαρακτήρες");
    }
    if (name.length() < 3 ){
        formErrors.add("Η ονομασία πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (owner.length() < 3 ){
        formErrors.add("Το όνομα ιδιοκτήτη πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }
    if (vat.length() != 8 ){
        formErrors.add("Το ΑΦΜ πρέπει να συμπληρωθεί με 8 ψηφία");
    }
    if (phone.length() < 10 ){
        formErrors.add("To Τηλέφωνο πρέπει να συμπληρωθεί με τουλάχιστον 10 ψηφία");
    }
    if (location.length() < 3 ){
        formErrors.add("Η πόλη πρέπει να συμπληρωθεί με τουλάχιστον 3 χαρακτήρες");
    }

    if (formErrors.size() == 0) {
        location = gWord.removeGreekTones(location).toUpperCase();

        WelfareUtilities welfUtil = new WelfareUtilities();
        Welfare welf = new Welfare(username,password,name,owner,vat,phone,location);

        try{    
            welfUtil.register(welf);
            request.setAttribute("success_message", "Επιτυχημένη Εγγραφή!");
        } catch(Exception e) {
            formErrors.add(e.getMessage());
        }

    } else {
        request.setAttribute("error_message", formErrors);
    }

%>
<jsp:forward page="registerWelf.jsp" />
<%
return;


    }
%>



