<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Buyer" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 13-Sep-21
  Time: 3:31 PM
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
    <link rel="stylesheet" href="./styles.css" />
    <title>SHELFS.</title>
</head>
<body>
<%
//    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
//    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
//    response.setHeader("Expires", "0"); //Proxies
//
//    if(session.getAttribute("userType") == null){
//        response.sendRedirect("loginForm.html");
//    }
//    else if(session.getAttribute("userType") != "admin"){
//        response.sendRedirect("registered.html");
//    }

%>

<body id="body">
<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">
        <!-- <a href="#">Subscribers</a>
        <a href="#">Video Management</a>
        <a class="active_link" href="#">Admin</a>

        <a href="#">Subscribers</a>
        <a href="#">Video Management</a>
        <a class="active_link" href="#">Admin</a> -->

        <a href="#">Subscribers</a>
        <a href="#">Video Management</a>
        <a class="active_link" href="#">Admin</a>
    </div>

    <div class="navbar__right">
        <a href="#">
            <i class="fa fa-search" aria-hidden="true"></i>
        </a>
        <a href="#">
            <i class="fa fa-clock-o" aria-hidden="true"></i>
        </a>
        <a href="#">
            <img width="30" src="./assets/avatar.svg" alt="" />
            <!-- <i class="fa fa-user-circle-o" aria-hidden="true"></i> -->
        </a>
    </div>

    <main>
        <div class="main__container">
            <!-- Insert Main Code Here -->
            <div class="dummy-text">
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid
                    qui deleniti ipsum ab quam tempore aperiam iure et sit error,
                    explicabo laudantium facilis assumenda. Unde temporibus inventore
                    debitis odio beatae?
                </p>
            </div>

            <div class="post-book">
                <div class="formContainer">
                    <h1>POST A BOOK</h1>
                    <p>Fill the below form to post book.</p>
                    <form>
                        <div class="row">
                            <div class="column">
                                <label for="book-title">Title</label>
                                <input
                                        type="text"
                                        id="book-title"
                                        placeholder="Book title here"
                                />
                            </div>
                            <div class="column">
                                <label for="author">Author</label>
                                <input
                                        type="text"
                                        id="author"
                                        placeholder="Author name here"
                                />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="isbn">ISBN</label>
                                <input type="text" id="isbn" placeholder="ISBN No. here" />
                            </div>
                            <div class="column">
                                <label for="category">Category</label>
                                <input
                                        type="text"
                                        id="category"
                                        placeholder="Category here"
                                />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="language">Language</label>
                                <input
                                        type="text"
                                        id="language"
                                        placeholder="Language here"
                                />
                            </div>
                            <div class="column">
                                <label for="price">Price</label>
                                <input type="text" id="price" placeholder="Price here" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="description">Description</label>
                                <textarea
                                        id="description"
                                        placeholder="Describe your book in detail here"
                                        rows="3"
                                ></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="front-photo">Front Image</label>
                                <input type="file" id="front-photo" />
                            </div>
                            <div class="column">
                                <label for="back-photo">Back Image</label>
                                <input type="file" id="back-photo" />
                            </div>
                        </div>
                    </form>
                    <button>Submit</button>
                </div>
            </div>

            <div class="table-template">
                <div class="search-container">
                    <input type="text" class="table-search" placeholder="Search Items...">
                    <button class="search-button">Search</button>
                </div>
                <table>
                    <tr class="table-head">
                        <th>Title</th>
                        <th>Order ID</th>
                        <th>Payment</th>
                        <th>Date Sold</th>
                        <th>View</th>
                    </tr>
                    <%

//                        ArrayList<Buyer> allBuyers = (ArrayList<Buyer>) request.getAttribute("allBuyers");
//                        for (int i = 0; i < 3; i++) {
//                            out.println("<tr class=\"table-rows\">");
//                            out.println("<td>" + allBuyers.get(i).getUsername() + "</td>");
//                            out.println("<td>" + allBuyers.get(i).getUserType() + "</td>");
//                            out.println("<td>" + allBuyers.get(i).getUsername() + "</td>");
//                            out.println("<td>Alfreds Futterkiste</td>");
//                            out.println("<td><div class=\"view-more-button\"><h2>View</h2></div></td>");
//                            out.println("</tr>");
//                        }
                        for (int i = 0; i < 3; i++) {
                            out.println("<tr class=\"table-rows\">");
                            out.println("<td>" + "This is Title." + "</td>");
                            out.println("<td>" + "Order123" + "</td>");
                            out.println("<td>" + "Indiehkdkb" + "</td>");
                            out.println("<td>Alfreds Futterkiste</td>");
                            out.println("<td><div class=\"view-more-button\"><h2>View</h2></div></td>");
                            out.println("</tr>");
                        }
                    %>

                </table>
            </div>
        </div>
    </main>

    <nav id="sidebar">
        <div class="sidebar__title">
            <div class="sidebar__img">
                <img src="./assets/logo.png" alt="logo" />
                <h1>SHELFS</h1>
            </div>
            <i
                    onclick="closeSidebar()"
                    class="fa fa-times"
                    id="sidebarIcon"
                    aria-hidden="true"
            ></i>
        </div>

        <div class="sidebar__menu">
            <div id="buy-and-sell-used"><h2>Buy and Sell used books.</h2></div>
            <div class="sidebar__link active_menu_link">
                <i class="fa fa-home"></i>
                <a href="#">MENU</a>
            </div>
            <h2>BUYER</h2>
            <div class="sidebar__link">
                <i class="fa fa-user-secret" aria-hidden="true"></i>
                <a href="#">My Shelf</a>
            </div>
            <div class="sidebar__link" id="test-back">
                <i class="fa fa-building-o"></i>
                <a href="#">My Favourites</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-wrench"></i>
                <a href="#">Requests Books</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-archive"></i>
                <a href="#">My Orders</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-handshake-o"></i>
                <a href="#">Messages</a>
            </div>

            <div id="become-seller">
                <h3>Start selling your books.</h3>
                <h2>Become a Seller</h2>
            </div>

            <h2>SELLER</h2>
            <div class="sidebar__link">
                <i class="fa fa-question"></i>
                <a href="#">Sell a Book</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-sign-out"></i>
                <a href="#">View Sales History</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-calendar-check-o"></i>
                <a href="#">View Buyer Requests</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-files-o"></i>
                <a href="#">View Posted Books</a>
            </div>
            <h2>ACCOUNT</h2>
            <div class="sidebar__link">
                <i class="fa fa-money"></i>
                <a href="#">My Account</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-briefcase"></i>
                <a href="#">Help</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-briefcase"></i>
                <a href="#">History</a>
            </div>
            <div class="sidebar__link">
                <i class="fa fa-briefcase"></i>
                <a href="#">Settings</a>
            </div>
            <div class="sidebar__logout">
                <i class="fa fa-power-off"></i>
                <a href="#">Logout</a>
            </div>

            <h2>FROM HERE JUST EXTRA THINGS DUMMY STUFF</h2>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>
            <div class="sidebar__link">
              <i class="fa fa-user-secret" aria-hidden="true"></i>
              <a href="#">Dummy Menu</a>
            </div>


        </div>
    </nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="./script.js"></script>
</body>

</html>
