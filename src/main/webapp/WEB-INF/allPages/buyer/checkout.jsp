<%@ page import="com.example.checkRevision.model.Advertisement" %> <%@ page
import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Buyer" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %><%-- Created by IntelliJ IDEA. User: Lenovo Date:
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

  <%
    ArrayList<Advertisement> checkoutAds = (ArrayList<Advertisement>) request.getAttribute("checkoutAds");
    String checkoutAdsValue = "";
    int total = 0;
    for (Advertisement checkoutAd: checkoutAds){
      total += checkoutAd.getPrice();

    }
    Buyer buyer = (Buyer) request.getAttribute("buyer");

    StringBuilder str = new StringBuilder("");
    for (Advertisement checkoutAd : checkoutAds) {
      str.append(checkoutAd.getAdId()).append(",");
    }

    String commaseparatedlist = str.toString();
    if (commaseparatedlist.length() > 0) {
      commaseparatedlist = commaseparatedlist.substring(0, commaseparatedlist.length() - 1);
    }

    commaseparatedlist = commaseparatedlist;


  %>
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


            <div class="checkout-details">
              <h2>YOUR ORDER</h2>
              <table class="checkout-details-table">
                <tr class="checkout-details-table-row">
                  <th>Product</th>
                  <th>Price</th>
                </tr>

                <% for (Advertisement checkoutAd: checkoutAds){%>
                <tr class="checkout-details-table-row">
                  <td><%=checkoutAd.getTitle()%></td>
                  <td><%=checkoutAd.getPrice()%></td>
                </tr>
                <%}%>

                <tr>
                  <td></td>
                  <td></td>
                </tr>
                <tr class="checkout-details-table-row">
                  <td><strong>Subtotal</strong></td>
                  <td id="subTotal" style="font-weight: bold"><%=total%></td>
                </tr>
              </table>

              <h3>Delivery Method</h3>
                <% if (buyer.getDistrict().equals("Colombo")){%>
                <div class="radio-button">
                    <input
                            type="radio"
                            id="inhouse-delviery"
                            name="delivery-method"
                            value="inhouse"
                            checked
                            required
                    />
                    <label for="inhouse-delviery">In-House Delivery</label>
                </div>
                <div class="radio-button">
                    <input
                            type="radio"
                            id="courier-delivery"
                            name="delivery-method"
                            value="courier"
                            required
                    />
                    <label for="courier-delivery"
                    >Courier Delivery <strong>Rs.100</strong></label
                    >
                </div>
                <%}else{%>
                <div class="radio-button">
                    <input
                            type="radio"
                            id="courier-delivery"
                            name="delivery-method"
                            value="courier"
                            disabled
                            checked
                            required
                    />
                    <label for="courier-delivery1"
                    >Courier Delivery <strong>Rs.<%=MyVariables.courierAmount%></strong></label
                    >
                </div>
                <br>
                <%}%>
              <h4 id="error" style= "color:red"></h4>
              <table>
                <tr class="checkout-details-table-row">
                  <td><strong>Total</strong></td>
                  <td id="total" style="font-weight: bold"><%=total%></td>
                </tr>
              </table>
              <form onsubmit="checkDelivery()" id="payHereForm" method="post" action="https://sandbox.payhere.lk/pay/checkout">
                <input type="hidden" name="merchant_id" value="1218974" />
                  <% if (buyer.getDistrict().equals("Colombo")){%>
                <input
                        type="hidden"
                        name="return_url"
                        value="http://localhost:8976/checkRevision_war_exploded/buyer/payHereSuccess?checkoutAds=<%=commaseparatedlist%>&isCourier=0"
                />
                  <%}else{%>
                  <input
                          type="hidden"
                          name="return_url"
                          value="http://localhost:8976/checkRevision_war_exploded/buyer/payHereSuccess?checkoutAds=<%=commaseparatedlist%>&isCourier=1"
                  />
                  <%}%>
                <input
                        type="hidden"
                        name="cancel_url"
                        value="http://localhost:8976/checkRevision_war_exploded/payHereFailiure"
                />

                <input
                        type="hidden"
                        name="notify_url"
                        value="http://http://localhost:8000/checkRevision_war_exploded/testPayHereServlet"
                />
<%--                <br><br>Item Details<br />--%>
                <input type="hidden" name="order_id" value="shelfsOrder">
                <input type="hidden" name="items" value="Shelfs Books"><br />
                <input type="hidden" name="currency" value="LKR" />
                <input id="payHereTotal" type="hidden" name="amount" value="<%=total%>">
                <br /><br />Customer Details<br />
                <input type="text" name="first_name" value="<%=buyer.getFirstName()%>" placeholder="First Name">
                <input type="text" name="last_name" value="<%=buyer.getLastName()%>" placeholder="Last Name"><br />
                <input type="text" name="email" value="<%=buyer.getEmail()%>" placeholder="Email">
                <input type="text" name="phone" value="<%=buyer.getPhoneNo()%>" placeholder="Phone"><br/>
                <input type="text" name="address" value="<%=buyer.getAddress()%>" placeholder="Address">
                <input type="text" name="city" value="<%=buyer.getCity()%>" placeholder="City">
                <input type="hidden" name="country" value="Sri Lanka"><br /><br />
                <div>
                    <h4>Delivery Details</h4>

                    <p><%=buyer.getHouseNo()%></p>
                    <p><%=buyer.getStreet()%></p>
                    <p><%=buyer.getCity()%></p>
                    <p><%=buyer.getDistrict()%></p>
                    <p><%=buyer.getProvince()%> Province</p>
                    <br>
                    <div class="view-more-button">
                        <a href="settings">Change Delivery Address</a>
                    </div>
                </div>
                  <br>

                  <input type="submit" value="Place Order">

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
  <script>
      var form = document.getElementById("payHereForm");
      var total = document.getElementById("total");
      var getSelectedValue = document.querySelector('input[name="delivery-method"]:checked');
      var courierAmount = <%=MyVariables.courierAmount%>;
      form.addEventListener("submit", (e) => {
          var getSelectedValue = document.querySelector('input[name="delivery-method"]:checked');
          if (getSelectedValue != null) {
              console.log("INSIDE NOT NULL IF")
              if (getSelectedValue.value === "courier") {
                  console.log("INSIDE COURIER IF")
                  document.getElementById("payHereTotal").value = courierAmount + parseInt(document.getElementById("payHereTotal").value);
              }
          } else {
              console.log("INSIDE NULL IF")
              console.log(getSelectedValue)
              document.getElementById("error").innerHTML
                  = "*You have not selected any delivery option";
              e.preventDefault();
          }
      });

      var deliveryOption = document.querySelectorAll('input[name="delivery-method"]')
      deliveryOption.forEach((option)=> {
          option.addEventListener("change", (e) => {
              var selectedOption = document.querySelector('input[name="delivery-method"]:checked');
              var returnURL = document.querySelector('input[name="return_url"]').value;
              if(selectedOption.value === "courier"){
                  document.querySelector('input[name="return_url"]').value = returnURL.toString().substring(0,returnURL.toString().length - 1) + "1";
                  document.getElementById("total").innerText = parseInt(document.getElementById("subTotal").innerText) + courierAmount;
              }else{
                  document.querySelector('input[name="return_url"]').value = returnURL.toString().substring(0,returnURL.toString().length - 1) + "0";
                  document.getElementById("total").innerText = document.getElementById("subTotal").innerText;
              }
          })
      })
      //
      // function checkDelivery(e) {
      //     // if (getSelectedValue != null) {
      //     //     console.log("INSIDE NOT NULL IF")
      //     //     if (getSelectedValue.value === "courier") {
      //     //         console.log("INSIDE COURIER IF")
      //     //         document.getElementById("payHereTotal").value = 100 + parseInt(document.getElementById("payHereTotal").value);
      //     //     }
      //     // } else {
      //     //     console.log("INSIDE NULL IF")
      //     //     console.log(getSelectedValue.value)
      //     //     document.getElementById("error").innerHTML
      //     //         = "*You have not selected any delivery option";
      //     //     e.preventDefault();
      //     // }
      //     console.log(getSelectedValue)
      //     e.pre
      //
      // }

  </script>
  </body>
</html>
