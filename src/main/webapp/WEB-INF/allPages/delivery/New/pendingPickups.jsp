<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.OrderPickupSeller" %>
<%@ page import="com.example.checkRevision.model.Order" %><%--
  Created by IntelliJ IDEA.
  User: Asitha Muthumala
  Date: 17/03/2022
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

    <link rel="stylesheet" href="../allPages/delivery/New/style.css" />
    <link rel="stylesheet" href="../allPages/delivery/New/pickup.css">

    <title>SHELFS - Online Bookstore</title>

</head>

<body id="body">
<%
    ArrayList<OrderPickupSeller> pendingPickups = (ArrayList<OrderPickupSeller>) request.getAttribute("pendingPickups");
%>

<div class="container">

    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

        <div class="datetime">

            <div class="time">
                <span class="hms"></span>
                <span class="ampm"></span><br>
                <span class="date"></span>
            </div>

        </div>

    </div>

    <div class="navbar__right">

        <!--notification icon-->
<%--        <a href="#" onclick="toggleNotifi()">--%>
<%--            <i class="fa fa-bell"></i>--%>
<%--        </a>--%>

        <!--notification list-->
<%--        <div class="notification-list" id="n-list">--%>

<%--            <h2>Notifications<span>#count</span></h2>--%>

<%--            <div class="notifi-item">--%>
<%--                <div class="data">--%>
<%--                    <h4>Dear Sir/Miss</h4>--%>
<%--                    <p>Notification Message.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="notifi-item">--%>
<%--                <div class="data">--%>
<%--                    <h4>Dear Sir/Miss</h4>--%>
<%--                    <p>Notification Message.</p>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

        <!--Message icon.(decided to remove)-->
<%--        <a href="#">--%>
<%--            <i class="fa fa-envelope"></i>--%>
<%--        </a>--%>

        <!--user image and drop-down list-->

        <h4 style="color: black; font-weight: bold;">@<%=request.getSession().getAttribute("username")%></h4>

        <a href="#" onclick="toggleProfileMenu()">
<%--            <img width="30" src="assets/user_image.svg" alt="user_image" />--%>
            <i class="fa fa-user"></i>
        </a>

        <!--profile menu list-->
        <div class="profile-menu" id="p-menu">

<%--            <div class="menu-item">--%>
<%--                <div class="item-name">--%>
<%--                    <i class="fa fa-user"></i>--%>
<%--                    <a href="">Profile</a>--%>
<%--                </div>--%>
<%--            </div>--%>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-question"></i>
                    <a href="help1New"> &ensp; Help</a>
                </div>
            </div>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-wrench"></i>
                    <a href="settings">Setting</a>
                </div>
            </div>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-power-off"></i>
                    <a href="../logout">Logout</a>
                </div>
            </div>

        </div>

    </div>

    <main>

        <h1>Pending Pickups</h1>

        <div class="pending-pickups">

            <% for (OrderPickupSeller pickup: pendingPickups){%>
            <div class="pickup-box">
                <div class="seller-image">
                    <div class="seller-image-box">
                        <img src="../testAll/assets/delivery_icon.jpg" alt="">
                    </div>
                </div>

                <div class="seller-details">
                    <h3>Pickup Id : <%=pickup.getNewOrderPickups().getPickupId()%></h3>
                    <p>Seller ID: <%=pickup.getSeller().getUsername()%></p>
                    <p>Seller Name : <%=pickup.getSeller().getFullName()%></p>
                    <p>Address : <%=pickup.getSeller().getAddress()%></p>
                    <p>Phone : <%=pickup.getSeller().getPhoneNo()%></p>
                </div>

                <div class="control-buttons"> <!--buttons-->
                    <a href="pendingPickupAllDetailsNew?pickupId=<%=pickup.getNewOrderPickups().getPickupId()%>">
                        <span>All Details</span>
                    </a>
                    <% if (pickup.getNewOrderPickups().getStatus() == 0){%>
                    <a href="newDeliveryUpdatePickup?pickupId=<%=pickup.getNewOrderPickups().getPickupId()%>&status=1">
                        <span>Picked up</span>
                    </a>
                    <%}else if (pickup.getNewOrderPickups().getStatus() == 1){%>
                    <a href="newDeliveryUpdatePickup?pickupId=<%=pickup.getNewOrderPickups().getPickupId()%>&status=2">
                        <span>Give to Store</span>
                    </a>
                    <%}%>
                    <% if (pickup.getNewOrderPickups().getStatus() == 1){%>
                    <a href="undoPendingPickup?pickupId=<%=pickup.getNewOrderPickups().getPickupId()%>">
                        <span>Undo</span>
                    </a>
                    <%}%>
<%--                    <a href="rejectPickup?pickupId=<%=pickup.getNewOrderPickups().getPickupId()%>">--%>
<%--                        <span>Reject</span>--%>
<%--                    </a>--%>
                </div>

            </div>
            <%}%>

        </div>

    </main>

    <nav id="sidebar">

        <%@include file="/WEB-INF/allPages/delivery/New/sidebar.jsp"%>

    </nav>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="../allPages/delivery/New/script.js"></script>

</body>

</html>
