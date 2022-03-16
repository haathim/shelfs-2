<%@ page import="com.example.checkRevision.model.PenDelOrderCombined" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/delivery/style.css" />
<%--  <link rel="stylesheet" href="../allPages/styling/layout.css" />--%>
<%--  <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />--%>
  <link rel="stylesheet" href="../allPages/delivery/pendingPickups.css">

  <title>SHELFS - Online Bookstore</title>
</head>

<body id="body">
<%
  ArrayList<PenDelOrderCombined> penDelOrderCombineds = (ArrayList<PenDelOrderCombined>) request.getAttribute("pendingPickups");
%>
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

<%--  <main>--%>
<%--    <h1>Pending Pickups</h1>--%>
<%--    <div class="pending-delivery">--%>

<%--      <div class="delivery-box">--%>

<%--        <div class="section-1">--%>
<%--          <h3>OrderID<span style="color:white;">#18415</span></h3>--%>
<%--        </div>--%>

<%--        <div class="section-2">--%>
<%--          <div class="picture">--%>
<%--            <img src="assets/avatar2.png" alt="">--%>
<%--          </div>--%>
<%--          <div class="buyer-details">--%>
<%--            <h3>Seller name <span style="color:white;"> Nimal Perera</span></h3>--%>
<%--            <h3>Delivery date <span style="color:white;"> 20/10/2021</span></h3>--%>
<%--            <h3>Address <span style="color:white;"> 20/9, fareed place, Colombo 04</span></h3>--%>
<%--            <h3>Phone <span style="color:white;"> 0774587238</span></h3>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="section-3">--%>

<%--          <button class="button button-1">BUYER DETAILS</button>--%>
<%--          <button class="button button-2">ADD</button>--%>
<%--          <button class="button button-3">UPDATE STATUS</button>--%>

<%--        </div>--%>

<%--      </div>--%>

<%--      <div class="delivery-box">--%>

<%--        <div class="section-1">--%>
<%--          <h3>OrderID<span style="color:white;">#18415</span></h3>--%>
<%--        </div>--%>

<%--        <div class="section-2">--%>
<%--          <div class="picture">--%>
<%--            <img src="assets/avatar2.png" alt="">--%>
<%--          </div>--%>
<%--          <div class="buyer-details">--%>
<%--            <h3>Seller name <span style="color:white;"> Asitha Muthumala</span></h3>--%>
<%--            <h3>Delivery date <span style="color:white;"> 20/09/2021</span></h3>--%>
<%--            <h3>Address <span style="color:white;"> 63/3, Moraketiara, Tangalle</span></h3>--%>
<%--            <h3>Phone <span style="color:white;"> 0774587232</span></h3>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="section-3">--%>

<%--          <button class="button button-1">SELLER DETAILS</button>--%>
<%--          <button class="button button-2">REMOVE</button>--%>
<%--          <button class="button button-3">UPDATE STATUS</button>--%>

<%--        </div>--%>

<%--      </div>--%>

<%--      <div class="delivery-box">--%>

<%--        <div class="section-1">--%>
<%--          <h3>OrderID<span style="color:white;">#18415</span></h3>--%>
<%--        </div>--%>

<%--        <div class="section-2">--%>
<%--          <div class="picture">--%>
<%--            <img src="assets/avatar2.png" alt="">--%>
<%--          </div>--%>
<%--          <div class="buyer-details">--%>
<%--            <h3>Seller name <span style="color:white;"> Asitha Muthumala</span></h3>--%>
<%--            <h3>Delivery date <span style="color:white;"> 20/09/2021</span></h3>--%>
<%--            <h3>Address <span style="color:white;"> 63/3, Moraketiara, Tangalle</span></h3>--%>
<%--            <h3>Phone <span style="color:white;"> 0774587232</span></h3>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="section-3">--%>

<%--          <button class="button button-1">SELLER DETAILS</button>--%>
<%--          <button class="button button-2">REMOVE</button>--%>
<%--          <button class="button button-3">UPDATE STATUS</button>--%>

<%--        </div>--%>

<%--      </div>--%>

<%--      <div class="delivery-box">--%>

<%--        <div class="section-1">--%>
<%--          <h3>OrderID<span style="color:white;">#18415</span></h3>--%>
<%--        </div>--%>

<%--        <div class="section-2">--%>
<%--          <div class="picture">--%>
<%--            <img src="assets/avatar2.png" alt="">--%>
<%--          </div>--%>
<%--          <div class="buyer-details">--%>
<%--            <h3>Seller name <span style="color:white;"> Asitha Muthumala</span></h3>--%>
<%--            <h3>Delivery date <span style="color:white;"> 20/09/2021</span></h3>--%>
<%--            <h3>Address <span style="color:white;"> 63/3, Moraketiara, Tangalle</span></h3>--%>
<%--            <h3>Phone <span style="color:white;"> 0774587232</span></h3>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="section-3">--%>

<%--          <button class="button button-1">SELLER DETAILS</button>--%>
<%--          <button class="button button-2">REMOVE</button>--%>
<%--          <button class="button button-3">UPDATE STATUS</button>--%>

<%--        </div>--%>

<%--      </div>--%>

<%--      <div class="delivery-box">--%>

<%--        <div class="section-1">--%>
<%--          <h3>OrderID<span style="color:white;">#18415</span></h3>--%>
<%--        </div>--%>

<%--        <div class="section-2">--%>
<%--          <div class="picture">--%>
<%--            <img src="assets/avatar2.png" alt="">--%>
<%--          </div>--%>
<%--          <div class="buyer-details">--%>
<%--            <h3>Seller name <span style="color:white;"> Asitha Muthumala</span></h3>--%>
<%--            <h3>Delivery date <span style="color:white;"> 20/09/2021</span></h3>--%>
<%--            <h3>Address <span style="color:white;"> 63/3, Moraketiara, Tangalle</span></h3>--%>
<%--            <h3>Phone <span style="color:white;"> 0774587232</span></h3>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="section-3">--%>

<%--          <button class="button button-1">SELLER DETAILS</button>--%>
<%--          <button class="button button-2">REMOVE</button>--%>
<%--          <button class="button button-3">UPDATE STATUS</button>--%>

<%--        </div>--%>

<%--      </div>--%>

<%--    </div>--%>
<%--  </main>--%>

  <main>
    <h1>Pending Pickups</h1>
    <div class="pending-delivery">

        <% for (PenDelOrderCombined penDel : penDelOrderCombineds){%>
      <div class="delivery-box">

        <div class="section-1">
          <h3>OrderID<span style="color:white;"><%=penDel.getOrder().getOrderId()%></span></h3>
        </div>

        <div class="section-2">
          <div class="picture">
            <img src="<%=penDel.getAdvertisement().getBookPhotoFront()%>" alt="Advertisement Photo">
          </div>
          <div class="buyer-details">
            <h3>Buyer name <span style="color:white;"><%=penDel.getBuyer().getFirstName()%> <%=penDel.getBuyer().getLastName()%></span></h3>
            <h3>Delivery date <span style="color:white;"> </span></h3>
            <h3>Address <span style="color:white;"><%=penDel.getBuyer().getAddress()%></span></h3>
            <h3>Phone <span style="color:white;"><%=penDel.getBuyer().getPhoneNo()%> </span></h3>
          </div>
        </div>

        <div class="section-3">

          <button class="button button-1">SELLER DETAILS</button>
          <button class="button button-2">REMOVE</button>
          <a href="updatePickup?orderId=<%=penDel.getOrder().getOrderId()%>"><button class="button button-3">UPDATE STATUS</button></a>

        </div>

      </div>
        <%}%>
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