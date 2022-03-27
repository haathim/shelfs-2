<%--
  Created by IntelliJ IDEA.
  User: Asitha Muthumala
  Date: 18/03/2022
  Time: 09:56
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
  <link rel="stylesheet" href="../allPages/delivery/New/deliveryHistory.css">
  <style>

    .formContainer {
      background-color: #ffffff;
      width: 89%;
      padding: 35px 50px;
      margin-left: 10px;
      margin-top: 10px;
      border-radius: 10px;
      box-shadow: 20px 30px 25px rgba(0, 0, 0, 0.15);
      /*align-self: center;*/
      /*commented above as when creaating biiling form*/

      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
    }

    .formContainer > h1 {
      font-size: 30px;
      color: #1c093c;
    }

    .sub-btn,
    input[type="submit"] {
      border: none;
      padding: 10px 20px;
      background: #658154;
      color: #ffffff;
      border-radius: 3px;
    }

    textarea:focus,
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="password"]:focus,
    input[type="file"]:focus,
    select:focus {
      outline: none;
      border-color: #658154;
    }

    textarea,
    input[type="text"],
    input[type="number"],
    input[type="password"],
    input[type="file"],
    select {
      width: 100%;
      font-weight: 400;
      padding: 8px 10px;
      border-radius: 5px;
      border: 1.2px solid #c4cae0;
      margin-top: 5px;
    }

    .formContainer > label {
      color: #1c093c;
      font-size: 14px;
    }

    .formContainer .row {
      /* border: 1px solid red; */
      width: 100%;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      grid-gap: 20px 30px;
      margin-bottom: 20px;
    }

    .formContainer > form {
      width: 100%;
      position: relative;
      margin: 30px auto 0 auto;
    }

  </style>

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
<%--    <a href="#" onclick="toggleNotifi()">--%>
<%--      <i class="fa fa-bell"></i>--%>
<%--    </a>--%>

    <!--notification list-->
<%--    <div class="notification-list" id="n-list">--%>

<%--      <h2>Notifications<span>#count</span></h2>--%>

<%--      <div class="notifi-item">--%>
<%--        <div class="data">--%>
<%--          <h4>Dear Sir/Miss</h4>--%>
<%--          <p>Notification Message.</p>--%>
<%--        </div>--%>
<%--      </div>--%>

<%--      <div class="notifi-item">--%>
<%--        <div class="data">--%>
<%--          <h4>Dear Sir/Miss</h4>--%>
<%--          <p>Notification Message.</p>--%>
<%--        </div>--%>
<%--      </div>--%>

<%--    </div>--%>

    <!--Message icon.(decided to remove)-->
<%--    <a href="#">--%>
<%--      <i class="fa fa-envelope"></i>--%>
<%--    </a>--%>

    <!--user image and drop-down list-->

      <h4 style="color: black; font-weight: bold;">@<%=request.getSession().getAttribute("username")%></h4>

    <a href="#" onclick="toggleProfileMenu()">
<%--      <img width="30" src="assets/user_image.svg" alt="user_image" />--%>
        <i class="fa fa-user"></i>
    </a>

    <!--profile menu list-->
    <div class="profile-menu" id="p-menu">

<%--      <div class="menu-item">--%>
<%--        <div class="item-name">--%>
<%--          <i class="fa fa-user"></i>--%>
<%--          <a href="">Profile</a>--%>
<%--        </div>--%>
<%--      </div>--%>

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
    <%@include file="/WEB-INF/allPages/common/changePasswordCommonpart.jsp"%>
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
<script src="../allPages/javaScript/inputValidation/changePasswordValidation.js"></script>


</body>

</html>
