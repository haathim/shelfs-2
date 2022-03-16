<%@ page import="com.example.checkRevision.model.Advertisement" %> <%@ page
import="java.util.ArrayList" %><%-- Created by IntelliJ IDEA. User: Lenovo Date:
21-Sep-21 Time: 12:13 PM To change this template use File | Settings | File
Templates. --%> <%@ page contentType="text/html;charset=UTF-8" language="java"
%>
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
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/buyer/cart-checkout.css" />

    <%--
    <link rel="stylesheet" href="allPages/styling/layout.css" />
    --%> <%--
    <link rel="stylesheet" href="allPages/buyer/home.css" />
    --%> <%--
    <link rel="stylesheet" href="allPages/buyer/sidebar.css" />
    --%> <%--
    <link rel="stylesheet" href="allPages/buyer/cart-checkout.css" />
    --%>

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <div class="container">
      <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
      </div>

      <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/buyer/navbar-left/navbar-left.jsp"%>
      </div>

      <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
      </div>

      <main>
        <div class="main__container">
          <div class="cart-container">
            <div class="table-template view">
              <div class="head">
                <h2 class="title">Your Cart</h2>
                <div class="cart-stats-and-checkout-btn">
                  <div class="cart-stats">
                    <h3>Item Count : 4</h3>
                    <h3>Total : Rs. 10,000</h3>
                  </div>
                  <div class="checkout-button">
                    <a href="checkout"><h2>Checkout</h2></a>
                  </div>
                </div>

                <!-- <p class="description">Accept or Reject seller applications</p> -->
              </div>

              <table>
                <tr class="table-head">
                  <th>Product</th>
                  <th>Price</th>
                  <th>Remove</th>
                </tr>

                <tr class="table-rows">
                  <td class="table-cell product">
                    <img
                      src="../allPages/uploads/hobbit-cover.jpg"
                      alt="Book Cover"
                    />
                    <p>The Hobbit</p>
                  </td>

                  <td class="table-cell">
                    <p class="field-name"><strong> Price</strong></p>
                    <p>Rs.7500</p>
                  </td>

                  <td class="table-cell">
                    <div class="view-more-button">
                      <h2>Remove</h2>
                    </div>
                  </td>
                </tr>

                <tr class="table-rows">
                  <td class="table-cell product">
                    <img
                      src="../allPages/uploads/aw80-cover.jpg"
                      alt="Book Cover"
                    />
                    <p>The Hobbit</p>
                  </td>

                  <td class="table-cell">
                    <p class="field-name"><strong> Price</strong></p>
                    <p>Rs.7500</p>
                  </td>

                  <td class="table-cell">
                    <div class="view-more-button">
                      <h2>Remove</h2>
                    </div>
                  </td>
                </tr>

                <tr class="table-rows">
                  <td class="table-cell product">
                    <img
                      src="../allPages/uploads/got-cover.jpg"
                      alt="Book Cover"
                    />
                    <p>The Hobbit</p>
                  </td>

                  <td class="table-cell">
                    <p class="field-name"><strong> Price</strong></p>
                    <p>Rs.7500</p>
                  </td>

                  <td class="table-cell">
                    <div class="view-more-button">
                      <h2>Remove</h2>
                    </div>
                  </td>
                </tr>

                <tr class="table-rows">
                  <td class="table-cell product">
                    <img
                      src="../allPages/uploads/sherlock-cover.jpg"
                      alt="Book Cover"
                    />
                    <p>The Hobbit</p>
                  </td>

                  <td class="table-cell">
                    <p class="field-name"><strong> Price</strong></p>
                    <p>Rs.7500</p>
                  </td>

                  <td class="table-cell">
                    <div class="view-more-button">
                      <h2>Remove</h2>
                    </div>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
      </nav>
      <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    </div>
  </body>
</html>
