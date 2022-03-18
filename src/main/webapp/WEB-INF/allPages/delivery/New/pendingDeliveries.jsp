<%--
  Created by IntelliJ IDEA.
  User: Asitha Muthumala
  Date: 17/03/2022
  Time: 16:50
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
    <link rel="stylesheet" href="../allPages/delivery/New/whereHouseDelivery.css">

    <title>SHELFS - Online Bookstore</title>

</head>

<body id="body">

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

        <h1>Pending Deliveries</h1>

        <div class="pending-deliveries">

            <div class="delivery-box">
                <div class="buyer-image">
                    <div class="buyer-image-box">
                        <img src="assets/user_image.svg" alt="">
                    </div>
                </div>

                <div class="buyer-details">
                    <h3>Delivery Id : 12345075ad</h3>
                    <p>Buyer Name : John Perera</p>
                    <p>Address : No 07, Dharmaraja Rd, Colombo 07.</p>
                    <p>Phone : 0779018695</p>
                </div>

                <div class="control-buttons"> <!--buttons-->
                    <a href="#">
                        <span>All Details</span>
                    </a>
                    <a href="#">
                        <span>Get from store</span>
                    </a>
                    <a href="#">
                        <span>Give to buyer</span>
                    </a>
                    <a href="#">
                        <span>Undo</span>
                    </a>
                </div>

            </div>

        </div>

    </main>

    <nav id="sidebar">

        <div class="sidebar__title">

            <div class="sidebar__title__box">
                <h1>SHELFS</h1>
                <p>Online Bookstore</p>
            </div>
            <i onclick="closeSidebar()" class="fa fa-times" id="sidebarIcon" aria-hidden="true"></i>

        </div>

        <div class="sidebar__menu">

            <div id="component-name">
                <h2>DELIVERY DASHBOARD</h2>
            </div>

            <div class="sidebar__link active_menu_link">
                <i class="fa fa-home"></i>
                <a href="#">Home</a> <!--Link to the first page of deliveryman-->
            </div>

            <h2>DELIVERY</h2>

            <div class="sidebar__link">
                <i class="fa fa-align-center"></i>
                <a href="#">Pickups</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-truck"></i>
                <a href="#">Pickups History</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-paper-plane-o"></i>
                <a href="#">Deliveries</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-industry"></i>
                <a href="#">Delivery History</a>
            </div>

            <h2>ACCOUNT</h2>

            <div class="sidebar__link">
                <i class="fa fa-user"></i>
                <a href="#">My Account</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-question"></i>
                <a href="#">Help</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-wrench"></i>
                <a href="#">Settings</a>
            </div>

            <div class="sidebar__link">
                <i class="fa fa-power-off"></i>
                <a href="#">Logout</a>
            </div>

        </div>

    </nav>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="../allPages/delivery/New/script.js"></script>

</body>

</html>