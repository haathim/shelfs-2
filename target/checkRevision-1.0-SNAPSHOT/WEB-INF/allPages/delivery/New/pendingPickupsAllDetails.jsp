<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Asitha Muthumala
  Date: 17/03/2022
  Time: 16:14
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
    <link rel="stylesheet" href="../allPages/delivery/New/pickupAllDetails.css">

    <title>SHELFS - Online Bookstore</title>

</head>

<body id="body">
<%
    ArrayList<Advertisement> pickupAds = (ArrayList<Advertisement>) request.getAttribute("pickupAds");
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

        <!--Heading of page start-->
        <div class="heading-backButton">
            <div class="heading">
                <h1>Pickup Details</h1>
            </div>
            <div class="backButton">
                <a onclick="goBack()">
                    <span>Back</span>
                </a>
            </div>
        </div>
        <!--Heading of page end-->

        <!--Summary start-->
        <div class="summary">
            <h2>QUANTITY : <%=pickupAds.size()%> BOOKS</h2>
        </div>
        <!--Summary end-->

        <!--All pickup book details start-->
        <div class="books-details">

            <% for (Advertisement ad: pickupAds){%>
            <div class="books">
                <div class="book-image">
                    <div class="book-image-box">
                        <img src="<%=ad.getBookPhotoFront()%>" alt="Book Image">
                    </div>
                </div>

                <div class="description-of-book">
                    <h3>ISBN : <%=ad.getIsbn()%></h3>
                    <p>Book Name : <%=ad.getTitle()%></p>
                    <p>Author : <%=ad.getAuthor()%></p>
                    <p>Category : <%=ad.getCategory()%></p>
                    <form action="rejectPickupAd" method="post">
                        <input type="hidden" name="adId" value="<%=ad.getAdId()%>">
                        <button type="submit">Reject</button>
                    </form>
                </div>

            </div>
            <%}%>

<%--            <div class="books">--%>
<%--                <div class="book-image">--%>
<%--                    <div class="book-image-box">--%>
<%--                        <img src="assets/book-image.jpg" alt="">--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="description-of-book">--%>
<%--                    <h3>ISBN : 4563878</h3>--%>
<%--                    <p>Book Name : Almost Love</p>--%>
<%--                    <p>Author : Asitha Muthumala</p>--%>
<%--                    <p>Published Year : 1999</p>--%>
<%--                    <p>Eddition : 7th edition</p>--%>
<%--                    <p>Quantity : 2</p>--%>
<%--                    <p>Condition : Used book</p>--%>
<%--                </div>--%>
<%--            </div>--%>

        </div>
        <!--All pickup book details end-->

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
<script>
    function goBack() {
        window.history.back()
    }
</script>
</body>

</html>
