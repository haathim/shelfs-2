<%@ page import="com.example.checkRevision.model.Advertisement" %> <%@ page
        import="java.util.ArrayList" %> <%@ page
        import="com.example.checkRevision.variables.MyVariables" %><%-- Created by
IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To change this
template use File | Settings | File Templates. --%> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
  <link rel="stylesheet" href="../allPages/unregistered/register-buyer.css" />

  <title>SHELFS.</title>
</head>
<body id="body">
<div class="container">
  <div class="nav_icon" onclick="toggleSidebar()">
    <i class="fa fa-bars" aria-hidden="true"></i>
  </div>

  <div class="navbar__left">
    <%@include file="/WEB-INF/allPages/buyer/navbar-left/navbar-left.jsp"%>
    <a href="../login">Sign in</a>
  </div>

<%--  <div class="navbar__right">--%>
<%--    <%@include file="/WEB-INF/allPages/unregistered/navbar-right.jsp"%>--%>
<%--  </div>--%>

  <main>
    <div class="main__container">
      <!-- Insert Main Code Here -->
      <div class="buyer-register">
        <div class="formContainer">
          <h1>Register as Buyer</h1>
          <p>Fill the below form to register.</p>
          <div id="instructions" style="color: blue; font-weight: bold">

          </div>
          <div id="error" style="color: red; font-weight: bold"></div>
          <form action="buyerRegSubmit" method="post" id="form">
            <div class="row">
              <div class="column">
                <label for="uname">Username</label>
                <input id="uname" type="text" name="uname" placeholder="Enter a gloabally unique username. length 3 -20" required />
              </div>
              <div class="column">
                <label for="pass">Enter New Password for Account:</label>
                <input id="pass" type="password" name="pass" placeholder="Password should be at least 8 characters long" required />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="pass2">Re-Enter Password:</label>
                <input id="pass2" type="password" name="pass2" placeholder="Re enter the password you entered" required />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="firstName">First Name:</label>
                <input
                        id="firstName"
                        type="text"
                        name="firstName"
                        placeholder="First letter should
                  be Capital. Length 3 - 20. Use only letters."
                        required
                />
              </div>
              <div class="column">
                <label for="lastName">Last Name:</label>
                <input id="lastName" type="text" name="lastName" placeholder="First letter should be Capital. Length 3 - 20. Use only letters." required />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="houseNo">House Number:</label>
                <input id="houseNo" type="text" name="houseNo" placeholder="Use only letters and digits.Length 1-20" required />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="street">Street:</label>
                <input id="street" type="text" name="street" placeholder="Use only letters and spaces. Length 5 -20" required />
              </div>
              <div class="column">
                <label for="city">City:</label>
                <input id="city" type="text" name="city"  required />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="district">District:</label>
                <br />
                <select
                        id="district"
                        type="text"
                        name="district"
                        required
                ></select>
              </div>
              <div class="column">
                <input
                        id="province"
                        type="hidden"
                        name="province"
                        required
                />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="mobileNo">Mobile Number</label>
                <input id="mobileNo" type="text" name="mobileNo" placeholder="Enter a valid SriLankan mobile number. Eg:0777123456" required />
              </div>
              <div class="column">
                <label for="email">Email Address</label>
                <input id="email" type="text" name="email" placeholder="Enter a valid email" required />
              </div>
            </div>
            <input type="submit" value="Register" class="sub-btn" />
          </form>
        </div>
      </div>
    </div>
  </main>

  <nav id="sidebar">
    <div class="sidebar__title">
      <div class="sidebar__img">
        <!-- <img src="assets/logo.png" alt="logo" /> -->
        <h1>SHELFS</h1>
        <p>Online Bookstore</p>
      </div>
      <i
              onclick="closeSidebar()"
              class="fa fa-times"
              id="sidebarIcon"
              aria-hidden="true"
      ></i>
    </div>

    <div class="sidebar__menu">
      <div id="buy-and-sell-used">
        <h2>Buy and Sell used books.</h2>
      </div>
      <div id="create-account">
        <h4>Get your favourite books to the lowest price</h4>
        <input
                type="submit"
                value="Join SHELFS"
                class="btn"
                onClick="window.location.href='public/buyerRegForm'"
        />
      </div>
      <div class="block1">
        <div class="row">
          <h1>560+</h1>
          <h3>Sellers</h3>
        </div>
        <div class="row">
          <h1>2730+</h1>
          <h3>Books</h3>
        </div>
        <div class="row">
          <h1>5260+</h1>
          <h3>Customers</h3>
        </div>
        <!-- <footer>
              <div class="footer">&copy - SHELFS - 2021</div>></p>
          </footer> -->
      </div>
    </div>
  </nav>
</div>
<script src="../allPages/javaScript/sidebarResponsive.js"></script>
<script src="../allPages/javaScript/inputValidation/unregistered/buyerRegForm.js"></script>
</body>
</html>
