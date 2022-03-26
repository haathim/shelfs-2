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
    <link rel="stylesheet" href="../allPages/styling/chatStyle.css" />


    <title>SHELFS - Online Bookstore</title>

</head>

<body id="body">
<%
    String otherUser = (String) request.getAttribute("otherUser");
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
        <a href="#" onclick="toggleNotifi()">
            <i class="fa fa-bell"></i>
        </a>

        <!--notification list-->
        <div class="notification-list" id="n-list">

            <h2>Notifications<span>#count</span></h2>

            <div class="notifi-item">
                <div class="data">
                    <h4>Dear Sir/Miss</h4>
                    <p>Notification Message.</p>
                </div>
            </div>

            <div class="notifi-item">
                <div class="data">
                    <h4>Dear Sir/Miss</h4>
                    <p>Notification Message.</p>
                </div>
            </div>

        </div>

        <!--Message icon.(decided to remove)-->
        <a href="#">
            <i class="fa fa-envelope"></i>
        </a>

        <!--user image and drop-down list-->
        <a href="#" onclick="toggleProfileMenu()">
            <img width="30" src="assets/user_image.svg" alt="user_image" />
        </a>

        <!--profile menu list-->
        <div class="profile-menu" id="p-menu">

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-user"></i>
                    <a href="">Profile</a>
                </div>
            </div>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-question"></i>
                    <a href=""> &ensp; Help</a>
                </div>
            </div>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-wrench"></i>
                    <a href="">Setting</a>
                </div>
            </div>

            <div class="menu-item">
                <div class="item-name">
                    <i class="fa fa-power-off"></i>
                    <a href="">Logout</a>
                </div>
            </div>

        </div>

    </div>

    <main>

        <div class="main-container">
            <div class="wrapper">
                <section class="chat-area">
                    <header>
                        <a href="chatUsersPage" class="back-icon"
                        >Back</a>
                        <div class="details">
                            <span style="font-weight: bold">@<%=otherUser%></span>
                            <p></p>
                        </div>
                    </header>
                    <div class="chat-box"></div>
                    <form id="chatSendForm" action="#" class="typing-area">
                        <input
                                type="text"
                                class="incoming_id"
                                name="otherUser"
                                value="<%=otherUser%>"
                                hidden
                        />
                        <input
                                type="text"
                                name="message"
                                class="input-field"
                                placeholder="Type a message here..."
                                autocomplete="off"
                        />
                        <button>Send</button>
                    </form>
                </section>
            </div>

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
<script src="../allPages/javaScript/chat/chat.js"></script>


</body>

</html>

