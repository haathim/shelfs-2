<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.PenDelOrderCombined" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/delivery/style.css" />
  <%--    <link rel="stylesheet" href="../allPages/styling/layout.css" />--%>
  <%--    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />--%>
  <link rel="stylesheet" href="../allPages/delivery/overview.css">

  <title>SHELFS - Online Bookstore</title>

</head>

<%
  ArrayList<PenDelOrderCombined> penDelOrders = (ArrayList<PenDelOrderCombined>) request.getAttribute("penDelOrders");
%>

<body id="body">
<div class="container">
  <div class="nav_icon" onclick="toggleSidebar()">
    <i class="fa fa-bars" aria-hidden="true"></i>
  </div>

  <div class="navbar__left">

    <div class="datetime">

      <div class="time">
        <span class="hms"></span>
        <span class="ampm"></span>
        <br>
        <span class="date"></span>
      </div>

    </div>

  </div>

  <div class="navbar__right">

    <a href="#" onclick="toggleNotifi()">
      <i class="fa fa-bell"></i>
    </a>

    <!--notification list-->
    <div class="notifi-box" id="box">

      <h2>Notifications <span>#</span></h2>

      <div class="notifi-item">
        <div class="text">
          <h4>Dear Sir/Miss</h4>
          <p>Thank You for complete.</p>
        </div>
      </div>

      <div class="notifi-item">
        <div class="text">
          <h4>Dear Sir/Miss</h4>
          <p>Thank You for complete.</p>
        </div>
      </div>

      <div class="notifi-item">
        <div class="text">
          <h4>Dear Sir/Miss</h4>
          <p>Thank You for complete.</p>
        </div>
      </div>

      <div class="notifi-item">
        <div class="text">
          <h4>Dear Sir/Miss</h4>
          <p>Thank You for complete.</p>
        </div>
      </div>

      <div class="notifi-item">
        <div class="text">
          <h4>Dear Sir/Miss</h4>
          <p>Thank You for complete.</p>
        </div>
      </div>

    </div>

    <a href="#">
      <i class="fa fa-envelope"></i>
    </a>
    <a href="#">
      <img width="30" src="assets/avatar.svg" alt="" />
    </a>
  </div>

  <main>
    <div class="main__container">

      <%@include file="/WEB-INF/allPages/common/changePasswordCommonpart.jsp"%>

    </div>
  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/delivery/sidebar.jsp"%>
  </nav>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script src="../allPages/javaScript/sidebarResponsive.js"></script>
<script src="../allPages/delivery/script.js"></script>
<script src="../allPages/javaScript/inputValidation/changePasswordValidation.js"></script>


</body>

</html>
