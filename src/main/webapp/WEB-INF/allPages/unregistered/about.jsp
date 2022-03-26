<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 21-Sep-21
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../allPages/styling/layout.css" />
    <link rel="stylesheet" href="../allPages/buyer/buyer-common.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />


    <title>SHELFS.</title>
</head>
<body>



<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/unregistered/navbar-left/navbar-left - About.jsp"%>
    </div>

    <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
    </div>

    <main>
        <div class="main__container">
            <h1>About Us</h1>
            <p>Shelfs – Online Bookstore, the latest online bookstore exclusively for all Sri Lankans, is aimed
                to provide our readers with the books they wish. The uniqueness of this store is that this store
                carries only second-hand books where we provide customers the opportunity to purchase their
                favourite books at lower cost than brand-new books, and this also opens the opportunity for
                customers who are willing to sell their books as well after their quality is assured. This store
                adopts a delivery system as well, hence our customers are given the luxury of receiving their
                desired books at their doorstep saving their time and cost. We aim to cover many genres of
                books, ranging from educational, to comics, to history and many more, providing the best
                experience to our users around the country.</p>
        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/unregistered/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>

