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
  <link rel="stylesheet" href="../allPages/delivery/viewPenDetails.css" />

  <title>SHELFS - Online Bookstore</title>

</head>

<%
  PenDelOrderCombined penDelOrder = (PenDelOrderCombined) request.getAttribute("penDelOrder");
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
    <div class="book-more-details">
      <div class="navigation">
        <div class="back-button">
          <a href="home"><p>Back</p></a>
        </div>
        <div class="right-buttons">
          <div class="remove-button">
            <a href="acceptJob?orderId=<%=penDelOrder.getPendingJob().getOrderId()%>"><p>Accept</p></a>
          </div>
        </div>
      </div>
      <div class="main-component">

        <div class="book-details">
          <h2>Order Details</h2>
          <div class="book-details-field">
            <p><strong>Order Id</strong></p>
            <p><%=penDelOrder.getOrder().getOrderId()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Book Title</strong></p>
            <p><%=penDelOrder.getAdvertisement().getTitle()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Book Author</strong></p>
            <p><%=penDelOrder.getAdvertisement().getAuthor()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>ISBN</strong></p>
            <p><%=penDelOrder.getAdvertisement().getIsbn()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Category</strong></p>
            <p><%=penDelOrder.getAdvertisement().getCategory()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Price</strong></p>
            <p><%=penDelOrder.getAdvertisement().getPrice()%></p>
          </div>
        </div>

        <div class="book-details">
          <h2>Buyer Details</h2>
          <div class="book-details-field">
            <p><strong>Buyer Name</strong></p>
            <p><%=penDelOrder.getBuyer().getFirstName()%> <%=penDelOrder.getBuyer().getLastName()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Buyer Contact Number</strong></p>
            <p><%=penDelOrder.getBuyer().getPhoneNo()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Buyer Email</strong></p>
            <p><%=penDelOrder.getBuyer().getEmail()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>House No</strong></p>
            <p><%=penDelOrder.getPendingJob().getBuyerHouseNo()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Street</strong></p>
            <p><%=penDelOrder.getPendingJob().getBuyerStreet()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>City</strong></p>
            <p><%=penDelOrder.getPendingJob().getBuyerCity()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>District</strong></p>
            <p><%=penDelOrder.getPendingJob().getBuyerDistrict()%></p>
          </div>

          <div class="book-details-field">
            <p><strong>Province</strong></p>
            <p><%=penDelOrder.getPendingJob().getBuyerProvince()%></p>
          </div>
        </div>
      </div>

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

</body>

</html>