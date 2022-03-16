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
  <link rel="stylesheet" href="../allPages/buyer/buyer_account_Styles.css" />


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
    <%@include file="/WEB-INF/allPages/buyer/navbar-left.jsp"%>
  </div>

  <div class="navbar__right">
    <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
  </div>

  <main>
    <div class="main__container">
      <div class="formContainer">
        <h1>CHANGE ACCOUNT DETAILS</h1>
        <p>Fill the fields where you wish to change the details</p>
        <form>

          <div class="column">
            <label for="book-title">Change Email address</label>
            <input
                    type="email"
                    id="email-id"
                    placeholder="Enter your email address"
            />
            <label for="phonenumber">Change Phone number</label>
            <input
                    type="number"
                    id="phone"
                    placeholder="Enter your phone number"
            />
            <label for="houseno">Change House number</label>
            <input
                    type="number"
                    id="houseno"
                    placeholder="Enter your House number"
            />
            <label for="street">Street</label>
            <input
                    id="street"
                    placeholder="Enter your street"

            ></input>
            <label for="street">City</label>
            <input
                    id="city"
                    placeholder="Enter your city"

            ></input>
            <label for="street">District</label>
            <input
                    id="District"
                    placeholder="Enter your district"

            ></input>
            <label for="province">Province</label>
            <input
                    id="province"
                    placeholder="Enter your province"

            ></input>
          </div>



        </form>
        <button>Submit</button>
      </div>

      <%@include file="/WEB-INF/allPages/common/changePasswordCommonpart.jsp"%>

    </div>

  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - settings.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
  <script src="../allPages/javaScript/inputValidation/changePasswordValidation.js"></script>

</div>
</body>
</html>

