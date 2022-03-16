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
  <link rel="stylesheet" href="../allPages/delivery/history.css">
  <title>SHELFS - Online Bookstore</title>

</head>

<body id="body">


<%
  ArrayList<PenDelOrderCombined> penDelOrders = (ArrayList<PenDelOrderCombined>) request.getAttribute("penDelOrders");
  String query = (String) request.getAttribute("query");
  int currentPage = (int) request.getAttribute("currentPage");
  int noOfPages = (int) request.getAttribute("noOfPages");
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
      <!-- <input type="text">  
      <a href="#">
        <i class="fa fa-search"></i>
      </a> -->
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
        <!-- <i class="fa fa-user-circle-o" aria-hidden="true"></i> -->
      </a>
    </div>

    <main>

      <h1>History</h1>

      <div class="history-navigation">

        <nav class="hi-navigation">

          <div class="search-container">
            <form action="#">
              <input type="text" placeholder="Order ID.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
          </div>

        </nav>

      </div>

      <div class="history-box">
        <div class="history-no">

          <div class="order-id">
            <p>Order <span>#1455</span></p>
          </div>

          <div class="order-details">
            <p>Completed Date : <span> 22/10/2021</span></p>
            <p>Time : <span> 10.11 AM</span></p>
            <button class="btn view">View</button>
          </div>
         
        </div>


        <div class="history-no">

          <div class="order-id">
            <p>Order <span>#1454</span></p>
          </div>

          <div class="order-details">
            <p>Completed Date : <span> 22/10/2021</span></p>
            <p>Time : <span> 10.11 AM</span></p>
            <button class="btn view">View</button>
          </div>
         
        </div>

        <div class="history-no">

          <div class="order-id">
            <p>Order <span>#1453</span></p>
          </div>

          <div class="order-details">
            <p>Completed Date : <span> 22/10/2021</span></p>
            <p>Time : <span> 10.11 AM</span></p>
            <button class="btn view">View</button>
          </div>

        </div>

        <div class="history-no">

          <div class="order-id">
            <p>Order <span>#1453</span></p>
          </div>

          <div class="order-details">
            <p>Completed Date : <span> 22/10/2021</span></p>
            <p>Time : <span> 10.11 AM</span></p>
            <button class="btn view">View</button>
          </div>

        </div>


      </div>

      <nav class="pagination-container">
        <ul class="pagination">
          <% if (noOfPages > 1){%>
          <a class="page-link" href="deliveryHistory?Page=1&&query=${query}"><li class="page-item">First</li></a>
          <%}%>
          <% if (currentPage != 1){%>
          <a class="page-link" href="deliveryHistory?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>
          <%}%>

          <% if (currentPage < noOfPages){%>
          <a class="page-link" href="deliveryHistory?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>
          <%}%>

          <% if (noOfPages > 1){%>
          <a class="page-link" href="deliveryHistory?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>
          <%}%>

        </ul>
      </nav>


    </main>

    <nav id="sidebar">
      <%@include file="/WEB-INF/allPages/delivery/sidebar.jsp"%>

    </nav>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="../allPages/delivery/script.js"></script>

</body>

</html>