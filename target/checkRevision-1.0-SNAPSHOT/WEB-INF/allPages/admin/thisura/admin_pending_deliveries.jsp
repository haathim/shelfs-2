<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.OrderBuyer" %>
<%@ page import="com.example.checkRevision.model.Delivery" %>
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
    ArrayList<Delivery> deliverers = (ArrayList<Delivery>) request.getAttribute("deliverers");
//    String query = (String) request.getAttribute("query");
//    int currentPage = (int) request.getAttribute("currentPage");
//    int noOfPages = (int) request.getAttribute("noOfPages");

%>
<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

        <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>

    </div>

    <%--    <div class="navbar__right">--%>
    <%--      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>--%>
    <%--    </div>--%>

    <main>
        <div class="main-container">
            <h1>Pending Pickups</h1>
            <div class="mainbox1">
                <table id="order1">
                    <thead>
                    <div class="searchbar">
                        <input type="text" placeholder="Search.."><div class="inline"><button style="margin:10px;">Submit</button></div>
                    </div>
                    <tr>
                        <th>Order No.</th>
                        <th>Buyer Name</th>
                        <th>User ID</th>
                        <th>Buyer's Address</th>
                        <th>Buyer's Phone No.</th>
                        <th>Drivers</th>
                        <th>Assign</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (OrderBuyer order: orders){%>
                    <tr>
                        <td><%=order.getOrder().getOrderId()%></td>
                        <td><%=order.getBuyer().getFullName()%></td>
                        <td><%=order.getBuyer().getUsername()%></td>
                        <td><%=order.getBuyer().getAddress()%></td>
                        <td><%=order.getBuyer().getPhoneNo()%></td>
                        <form action="assignDelivererForDelivery" method="post">
                            <input type="hidden" name="orderId" value="<%=order.getOrder().getOrderId()%>">
                            <td>
                                <select name="deliverer" id="driver-names">
                                    <% for (Delivery deliverer: deliverers){%>
                                    <option value="<%=deliverer.getUsername()%>"><%=deliverer.getFullName()%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><button type="submit">Assign</button></td>
                        </form>

                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
<%--            <nav class="pagination-container">--%>
<%--                <ul class="pagination">--%>
<%--                    <% if (noOfPages > 1){%>--%>
<%--                    <a class="page-link" href="manageAds?Page=1&&query=${query}"><li class="page-item">First</li></a>--%>
<%--                    <%}%>--%>
<%--                    <% if (currentPage != 1){%>--%>
<%--                    <a class="page-link" href="manageAds?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>--%>
<%--                    <%}%>--%>

<%--                    <% if (currentPage < noOfPages){%>--%>
<%--                    <a class="page-link" href="manageAds?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>--%>
<%--                    <%}%>--%>

<%--                    <% if (noOfPages > 1){%>--%>
<%--                    <a class="page-link" href="manageAds?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>--%>
<%--                    <%}%>--%>

<%--                </ul>--%>
<%--            </nav>--%>

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