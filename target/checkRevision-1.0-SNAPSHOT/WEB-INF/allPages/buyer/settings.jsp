<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.model.Buyer" %>
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

<% Buyer buyer = (Buyer)request.getAttribute("usernamex"); %>


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
        <form action="changeAccountDetailsBuyer" method="post" id="formnew">

          <div class="column">
            <label for="email">Email address</label>
            <input
                    type="email"
                    id="email"
                    name = "email-id"
                    placeholder="Enter your email address"
                    disabled
                    value= "<%=buyer.getEmail()%>"
            />
            <label for="mobileNo">Phone number</label>
            <input
                    type="text"
                    id="mobileNo"
                    name="phoneNo"
                    placeholder="Enter your phone number"
                    value="<%=buyer.getPhoneNo()%>"
            />
            <label for="houseNo">House number</label>
            <input
                    type="text"
                    id="houseNo"
                    name="houseNo"
                    placeholder="Enter your House number"
                    value="<%=buyer.getHouseNo()%>"
            />
            <label for="street">Street</label>
            <input
                    type="text"
                    id="street"
                    placeholder="Enter your street"
                    name="street"
                    value="<%=buyer.getStreet()%>"

            />
            <label for="city">City</label>
            <input
                    type="text"
                    id="city"
                    name="city"
                    placeholder="Enter your city"
                    value="<%=buyer.getCity()%>"

            />

            <% if(buyer.getUserType().equals("buyer")){%>
            <label for="district">District:</label>
            <br />
            <select
                    id="district"
                    type="text"
                    name="district"

            ></select>
            <input
                    id="province"
                    type="hidden"
                    name="province"
                    required
            />
            <%} else if(buyer.getUserType().equals("seller")){%>
            <label for="district">District:</label>
            <br />
            <select
                    id="district"
                    type="text"
                    name="district"
                    value="<%=buyer.getDistrict()%>"
                    disabled

            ></select>
            <input
                    id="province"
                    type="hidden"
                    name="province"
                    required
            />
            <%}%>
          </div>


          <button type="submit">Submit</button>
        </form>

      </div>


<%--      </div>--%>
      <%@include file="/WEB-INF/allPages/common/changePasswordCommonpart.jsp"%>

    </div>

  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - settings.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
  <script src="../allPages/javaScript/inputValidation/changePasswordValidation.js"></script>
  <script src="../allPages/javaScript/inputValidation/buyer/changeAccountDetails.js"></script>

</div>
</body>
</html>

