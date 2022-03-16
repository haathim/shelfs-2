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
<%
    ArrayList<Advertisement> wishlistAds = (ArrayList<Advertisement>) request.getAttribute("wishlistAds");

%>



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
            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus reprehenderit eveniet fugiat unde. Cupiditate aut accusamus sunt doloremque in recusandae quisquam quaerat tenetur maxime provident repellat harum et, animi possimus. Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae quae voluptatem mollitia reiciendis, obcaecati quis assumenda saepe itaque vero tempora fugiat ratione magnam autem tempore? Corrupti mollitia explicabo id molestias. Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis modi qui, libero, non alias, neque maiores inventore iste consequatur ab dolore totam dolorum quasi optio nihil eius rerum vitae ex. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Aliquam dolor repellat quis cum ducimus deserunt at labore nulla eius incidunt numquam obcaecati quam mollitia nemo, odio enim reprehenderit optio. Vero. Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum, asperiores! Voluptatem, ad pariatur temporibus in et aut eveniet at quidem, odio provident accusantium. Odit illo praesentium officia voluptate rem similique! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sequi maxime iusto voluptatum rerum corrupti quis dolorem, error hic odit praesentium? Dolores totam perspiciatis quo suscipit optio nobis aliquam necessitatibus culpa! Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores adipisci perspiciatis corporis vitae quibusdam laudantium inventore possimus fugiat qui totam, mollitia incidunt, cupiditate in officia, iure a et recusandae quidem. Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore at voluptatibus libero nisi blanditiis, provident odio saepe assumenda neque nihil commodi tenetur perferendis dignissimos eveniet voluptates iure sequi dicta id?</p>
        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/unregistered/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>

