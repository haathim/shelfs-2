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
          <div class="checkout-container">
            <div class="formContainer">
              <h1>Billing Details</h1>
              <p>Please check whether the below details are accurate</p>
              <div
                id="instructions"
                style="color: blue; font-weight: bold"
              ></div>
              <div id="error" style="color: red; font-weight: bold"></div>
              <form action="buyerRegSubmit" method="post" id="form">
                <div class="row">
                  <div class="column">
                    <label for="firstName">First Name:</label>
                    <input
                      id="firstName"
                      placeholder="Nimal"
                      type="text"
                      name="firstName"
                      required
                    />
                  </div>
                  <div class="column">
                    <label for="lastName">Last Name:</label>
                    <input
                      id="lastName"
                      placeholder="Perera"
                      type="text"
                      name="lastName"
                      required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="houseNo">House Number:</label>
                    <input
                      id="houseNo"
                      placeholder="23/7"
                      type="text"
                      name="houseNo"
                      required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="street">Street:</label>
                    <input
                      id="street"
                      placeholder="Parakrama road"
                      type="text"
                      name="street"
                      required
                    />
                  </div>
                  <div class="column">
                    <label for="city">City:</label>
                    <input
                      id="city"
                      placeholder="Kaduwela"
                      type="text"
                      name="city"
                      required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="district"> District:</label>
                    <br />
                    <select
                      placeholder="Kaduwela"
                      id="district"
                      type="text"
                      name="district"
                      required
                    ></select>
                  </div>
                  <div class="column">
                    <input
                      id="province"
                      placeholder="Western"
                      type="hidden"
                      name="province"
                      required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="mobileNo">Mobile Number</label>
                    <input
                      id="mobileNo"
                      placeholder="0771234567"
                      type="text"
                      name="mobileNo"
                      required
                    />
                  </div>
                  <div class="column">
                    <label for="email">Email Address</label>
                    <input
                      id="email"
                      placeholder="Nimal@gmail.com"
                      type="text"
                      name="email"
                      required
                    />
                  </div>
                </div>
                <%--
                <input type="submit" value="Register" class="sub-btn" />--%>
              </form>
            </div>

            <div class="checkout-details">
              <h2>YOUR ORDER</h2>
              <table class="checkout-details-table">
                <tr class="checkout-details-table-row">
                  <th>Product</th>
                  <th>Price</th>
                </tr>

                <tr class="checkout-details-table-row">
                  <td>The Fellowship of the Ring</td>
                  <td>Rs.5500</td>
                </tr>

                <tr class="checkout-details-table-row">
                  <td>The Hobbit</td>
                  <td>Rs.4500</td>
                </tr>

                <tr class="checkout-details-table-row">
                  <td>The Return of the King</td>
                  <td>Rs.6500</td>
                </tr>

                <tr>
                  <td></td>
                  <td></td>
                </tr>
                <tr class="checkout-details-table-row">
                  <td><strong>Subtotal</strong></td>
                  <td><strong>Rs.16500</strong></td>
                </tr>
              </table>

              <h2>Delivery Method</h2>
              <div class="radio-button">
                <input
                  type="radio"
                  id="inhouse-delviery"
                  name="delivery-method"
                  value="courier"
                />
                <label for="inhouse-delviery">In-House Delivery</label>
              </div>
              <div class="radio-button">
                <input
                  type="radio"
                  id="courier-delivery"
                  name="delivery-method"
                  value="inhouse"
                />
                <label for="courier-delivery"
                  >Courier Delivery <strong>Rs.100</strong></label
                >
              </div>

              <table>
                <tr class="checkout-details-table-row">
                  <td><strong>Total</strong></td>
                  <td><strong>Rs.18000</strong></td>
                </tr>
              </table>

              <div class="checkout-button">
                <h2>PLACE ORDER</h2>
              </div>
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
