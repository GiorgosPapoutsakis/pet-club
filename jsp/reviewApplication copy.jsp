<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/stylesApplication.css">
  <title>ΕΛΕΓΧΟΣ ΑΙΤΗΣΗΣ</title>
</head>
<body>
  <header>
    <h1>ΕΛΕΓΧΟΣ ΑΙΤΗΣΗΣ</h1>
  </header>
  <div class="form-container">
    <form action="#" method="POST">
      <label for="id">ID (αριθμητικές τιμές):</label>
      <input type="number" id="id" name="id" required>
      
      <label for="name">Όνομα (πάνω από 3 χαρακτήρες):</label>
      <input type="text" id="name" name="name" pattern="[A-Za-z]{3,}" required>
      
      <label for="surname">Επώνυμο (πάνω από 3 χαρακτήρες):</label>
      <input type="text" id="surname" name="surname" pattern="[A-Za-z]{3,}" required>
      
      <label for="birthdate">Ημερομηνία Γέννησης:</label>
      <input type="date" id="birthdate" name="birthdate" required>

      <div class="buttons">
        <button type="submit" class="btn-approval">ΕΓΚΡΙΣΗ</button>
        <button type="button" class="btn-rejection">ΑΠΟΡΡΙΨΗ</button>
        <a href="index.html" class="btn-next">ΕΠΟΜΕΝΗ ΑΙΤΗΣΗ</a>
      </div>
    </form>
  </div>
</body>
</html>





