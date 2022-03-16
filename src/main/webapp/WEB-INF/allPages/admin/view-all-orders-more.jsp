<%@ page import="com.example.checkRevision.model.Advertisement" %> <%@ page
import="java.util.ArrayList" %> <%@ page
import="com.example.checkRevision.model.Order" %> <%@ page
import="com.example.checkRevision.model.OrderAdCombined" %> <%@ page
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
    <link rel="stylesheet" href="../allPages/buyer/home.css" />
    <link rel="stylesheet" href="../allPages/buyer/search-results-more.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <div class="container">
      <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
      </div>

      <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>
      </div>

      <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>
      </div>

      <main>
        <div class="main__container">
          <div class="book-more-details">
            <div class="navigation">
              <div class="back-button">
                <button onclick="goBack()">Back</button>
              </div>
            </div>
            <div class="main-component">
              <div class="book-cover">
                <img
                  src="<%=MyVariables.rootURL%>allPages/styling/bookCover.jpeg"
                />
              </div>
              <div class="book-details">
                <div class="book-details-field">
                  <p><strong>Title</strong></p>
                  <p>Advanced Level Physics</p>
                </div>

                <div class="book-details-field">
                  <p><strong>Author</strong></p>
                  <p>Nelkon & Parker</p>
                </div>

                <div class="book-details-field">
                  <p><strong>Language</strong></p>
                  <p>English</p>
                </div>

                <div class="book-details-field">
                  <p><strong>ISBN</strong></p>
                  <p>1234567890123</p>
                </div>

                <div class="book-details-field">
                  <p><strong>Category</strong></p>
                  <p>Non-Fiction</p>
                </div>

                <div class="book-details-field">
                  <p><strong>Seller</strong></p>
                  <p>seller1</p>
                </div>

                <div class="book-details-field">
                  <p><strong>Buyer</strong></p>
                  <p>buyer1</p>
                </div>

                <div class="price">
                  <p>Rs. 3250</p>
                </div>
              </div>
            </div>

            <div class="description">
              <div class="order-details">
                <div class="order-details-field">
                  <p><strong>Order Id</strong></p>
                  <p>1121</p>
                </div>

                <div class="order-details-field">
                  <p><strong>Status</strong></p>
                  <p>Pending</p>
                </div>

                <div class="order-details-field">
                  <p><strong>Advertisement ID</strong></p>
                  <p>2143</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
      </nav>
      <script src="../allPages/javaScript/sidebarResponsive.js"></script>
      <script>
        function goBack() {
          window.history.back();
        }
      </script>
    </div>
  </body>
</html>
