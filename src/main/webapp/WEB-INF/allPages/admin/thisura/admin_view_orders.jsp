<%@ page import="com.example.checkRevision.model.OrderBuyer" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="buyer_styles.css" />
  <link rel="stylesheet" href="../allPages/admin/thisura/admin_manage_users_styles.css" />
  <script src="layoutjs.js"></script>
  <title>SHELFS - Online Bookstore</title>
</head>

<body id="body">
<%
  ArrayList<OrderBuyer> orders = (ArrayList<OrderBuyer>) request.getAttribute("orders");

%>
  <div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
      <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>

    </div>

    <div class="navbar__right">
      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>
    </div>

    <main>
      <div class="main-container">
          <h1>Orders</h1>
          <div class="mainbox1">
            <table id="order1">
              <thead>
                <div class="searchbar">
                  <form action="viewOrdersAdmin" method="get">
                    <input type="text" placeholder="Search.." name="query">
                    <div class="inline"><button style="margin:10px;" type="submit">Submit</button></div>
                  </form>

                  </div>
                <tr>
                <tr>
                  <th>Order Number</th>
                  <th>Buyer Name</th>
                  <th>Date Ordered</th>
                  <th>Method</th>
                  <th>Status</th>
                  <th>View More</th>
                </tr>
              </thead>
              <tbody>
              <% for (OrderBuyer order: orders){%>
                <tr>
                  <td><%=order.getOrder().getOrderId()%></td>
                  <td><%=order.getBuyer().getFullName()%></td>
                  <td><%=order.getOrder().getDateOrdered()%></td>
                  <% if(order.getOrder().isCourier()){%>
                  <td>Courier</td>
                  <%} else{%>
                  <td>Delivery</td>
                  <%}%>
                  <% if(order.getOrder().getStatus() == 0){%>
                    <td>Pending Pickups</td>
                  <%} else if(order.getOrder().getStatus() == 1){%>
                  <td>All Pickups Done</td>
                  <%} else if(order.getOrder().getStatus() == 2){%>
                  <td>Handed to delivery/Courier</td>
                  <%} else if(order.getOrder().getStatus() == 3){%>
                  <td>Delivered</td>
                  <%}%>
                  <td><a href="viewOrdersAdminMore?orderId=<%=order.getOrder().getOrderId()%>">View</a></td>
                </tr>
              <%}%>

              </tbody>
            </table>
          </div>
        </div>
    </main>
    <nav id="sidebar">
      <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
    </nav>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="script.js"></script>
  <script src="layoutjs.js"></script>
</body>

</html>