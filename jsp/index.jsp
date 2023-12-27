<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_ergasia.*, java.util.List, java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Pawie</title>
  <link rel="icon" href="images/favicon.ico">

  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/slider.css">

  <!-- Index javascript -->
  <script src="js/jquery.js"></script>
  <script src="js/jquery-migrate-1.1.1.js"></script>
  <script src="js/tms-0.4.1.js"></script>

  <!-- Ίσως όχι απαραίτητα -->
  <script src="js/superfish.js"></script>
  <script src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
  <script src="js/jquery.equalheights.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.ui.totop.js"></script>

  <script>
  $(window).load(function () {
      $('.slider')._TMS({
          show: 0,
          pauseOnHover: false,
          prevBu: '.prev',
          nextBu: '.next',
          playBu: false,
          duration: 800,
          preset: 'fade',
          pagination: true, //'.pagination',true,'<ul></ul>'
          pagNums: false,
          slideshow: 8000,
          numStatus: false,
          banners: true,
          waitBannerAnimation: false,
          progressBar: false
      })
  });
  $(window).load(function () {
      $('.carousel1').carouFredSel({
          auto: false,
          prev: '.prev',
          next: '.next',
          width: 960,
          items: {
              visible: {
                  min: 3,
                  max: 3
              },
              height: 'auto',
              width: 300,
          },
          responsive: true,
          scroll: 1,
          mousewheel: false,
          swipe: {
              onMouse: true,
              onTouch: true
          }
      });
  });
  jQuery(document).ready(function () {
      $().UItoTop({
          easingType: 'easeOutQuart'
      });
  });
  </script>

</head>
  <body class="page1">

    <!-- navigation bar -->
    <%@ include file="navbar.jsp" %> 

    <!-- slide photos -->
    <div class="top_block">
      <div class="slider-relative">
        <div class="slider-block">
          <div class="slider">
            <ul class="items">
              <li><img src="images/slide.jpg" alt="">
                <div class="banner">Χρειάζονται τη δική σου <span>Αγάπη</span> και <i>Φροντίδα</i>
                  <p>Είναι τόσο εύκολο να τα κάνεις χαρούμενα</p>
                </div>
              </li>
              <li><img src="images/slide1.jpg" alt="">
                <div class="banner">Χρειάζονται τη δική σου <span>Αγάπη</span> και <i>Φροντίδα</i>
                  <p>Είναι τόσο εύκολο να τα κάνεις χαρούμενα</p>
                </div>
              </li>
              <li><img src="images/slide2.jpg" alt="">
                <div class="banner">Χρειάζονται τη δική σου <span>Αγάπη</span> και <i>Φροντίδα</i>
                  <p>Είναι τόσο εύκολο να τα κάνεις χαρούμενα</p>
                </div>
              </li>
              <li><img src="images/slide3.jpg" alt="">
                <div class="banner">Χρειάζονται τη δική σου <span>Αγάπη</span> και <i>Φροντίδα</i>
                  <p>Είναι τόσο εύκολο να τα κάνεις χαρούμενα</p>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="page1_block" >
      <div class="container_12">
        <div class="grid_6">
          <h2>Welcome to Our Site</h2> <br>

          <img src="images/page1_img5.jpg" alt="" class="img_inner fleft">
          <div class="extra_wrapper style1">
            <p>Γίνε εθελοντής και προσέφερε αγάπη, φροντίδα και θαλπωρή. Το μόνο που απαιτείται είναι λίγος χρόνος απο την καθημερινότητα σου για να φροντίσεις ζωάκια που έχουν ανάγκη απο πολλές αγκαλίτσες, λιχουδιές και περιποίηση. Μην χάνεις χρόνο και γίνε εθελοντής σήμερα!</p>
          </div>
        </div>
        
      </div>
    </div>

    <!-- footer -->
    <%@ include file="footer.jsp" %> 


  </body>
</html>