<%@ page import="java.util.ArrayList" %> <%@ page
import="com.example.checkRevision.model.Wishlist" %> <%@ page
import="com.example.checkRevision.model.Advertisement" %> <%@ page
import="com.example.checkRevision.variables.MyVariables" %><%-- Created by
IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:14 PM To change this
template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/unregistered/register-buyer.css" />

    <title>SHELFS.</title>
  </head>
  <body>
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
          <div class="seller-application">
            <div class="formContainer">
              <h1>Apply for Seller</h1>
              <p>Fill the below form to apply.</p>
              <div id="instructions" style="color: blue; font-weight: bold">
<%--                <p>NIC: Use only letters and digits. Length 3 - 20.</p>--%>
<%--                <p>Images: Max size 2MB. Allowed types JPG and PNG.</p>--%>
              </div>
              <div id="error" style="color: red; font-weight: bold"></div>
              <form
                action="sellerApplication"
                method="post"
                enctype="multipart/form-data"
                id="form"
              >
                <div class="row">
                  <div class="column">
                    <label for="nicNo">NIC No:</label>
                    <input id="nicNo" type="text" name="nicNo" placeholder="NIC: Use only letters and digits. Length 3 - 20. Images: Max size 2MB. Allowed types JPG and PNG." required />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="nicFront">NIC Front photo:</label>
                    <input
                      id="nicFront"
                      type="file"
                      name="nicFront"
                      multiple
                      accept=".jpg, .png"
                      required
                    />
                  </div>
                  <div class="column">
                    <label for="nicBack">NIC Back photo:</label>
                    <input
                      id="nicBack"
                      type="file"
                      name="nicBack"
                      multiple
                      accept=".jpg, .png"
                      required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="bankAccountNo">Bank Account Number:</label>
                    <input
                      id="bankAccountNo"
                      type="text"
                      name="bankAccountNo"
                      required
                    />
                  </div>
                  <div class="column">
                    <label for="bankName">Bank Name:</label>
                    <input id="bankName" type="text" name="bankName" required />
                  </div>
                  <div class="column">
                    <label for="bankBranch">Bank Branch:</label>
                    <input
                      id="bankBranch"
                      type="text"
                      name="bankBranch"
                      required
                    />
                  </div>
                </div>
                <input type="submit" value="Register" class="sub-btn" />
              </form>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
      </nav>
    </div>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    <script src="../allPages/javaScript/inputValidation/buyer/sellerApplicationForm.js"></script>
  </body>
</html>
