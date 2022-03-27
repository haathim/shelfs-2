<%@ page import="java.util.ArrayList" %>
<%--<%@ page import="com.example.checkRevision.model.Wishlist" %>--%>
<%--<%@ page import="com.example.checkRevision.model.Advertisement" %>--%>
<%--<%@ page import="com.example.checkRevision.variables.MyVariables" %>--%>
<%--<%@ page import="com.example.checkRevision.model.Order" %>--%>
<%@ page import="com.example.checkRevision.model.Delivery" %><%--
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
  <link rel="stylesheet" href="../allPages/unregistered/register-buyer.css" />


  <title>SHELFS.</title>
</head>
<body>
<%
  ArrayList<Delivery> deliveryPersons = (ArrayList<Delivery>) request.getAttribute("deliveryPersons");
%>

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
      <div class="add-delivery-person-form">
        <div class="formContainer">
          <h1>ADD A DELIVERY PERSON</h1>
          <p>Fill the below form to add new delivery person.</p>
          <div id="instructions" style="color: blue; font-weight: bold">
            <p>

            </p>
            <p>

            </p>
            <p></p>

            <p></p>

          </div>
          <div id="error" style="color: red; font-weight: bold"></div>
          <form id="form" action="addDeliveryPerson" method="post">
            <div class="row">
              <div class="column">
                <label for="username">Username</label>
                <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Username: Use only letters and digits. Length 3 - 20. Should be globally
              unique."
                        required
                />
              </div>
              <div class="column">
                <label for="password">Password</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password: Length 8 - 20."
                        required
                />
              </div>

              <div class="column">
                <label for="password2">Password</label>
                <input
                        type="password"
                        id="password2"
                        name="password2"
                        placeholder="Re-Enter password"
                        required
                />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="firstName">First Name</label>
                <input
                        type="text"
                        id="firstName"
                        name="firstName"
                        placeholder="Enter first name here. First Name, Last Name: Use only letters. First letter should be Capital. Length 3 - 20."
                        required
                />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="lastName">Last Name</label>
                <input
                        type="text"
                        id="lastName"
                        name="lastName"
                        placeholder="Enter last name here. First Name, Last Name: Use only letters. First letter should be Capital. Length 3 - 20."
                        required
                />
              </div>
            </div>
            <div class="row">
              <div class="column">
                <label for="mobileNo">Phone Number</label>
                <input type="text" id="mobileNo" name="mobileNo" placeholder="Enter Mobile Number here. Mobile No: Should be valid SriLankan mobile number. Eg: 0777123456" required/>
              </div>
            </div>
            <input type="submit" id="submit-button" value="Add Deliverer"/>
          </form>
          <%--            <button class="sub-btn">Submit</button>--%>
        </div>
      </div>
      <div class="table-template view-seller-applications">
        <div class="head">
          <h2 class="title">View Delivery Person</h2>
          <p class="description">Existing Delivery Persons</p>
        </div>
        <%--          <div class="search-container">--%>
        <%--            <input--%>
        <%--                    type="text"--%>
        <%--                    class="table-search"--%>
        <%--                    placeholder="Search Items..."--%>
        <%--            />--%>
        <%--            <button class="search-button">Search</button>--%>
        <%--          </div>--%>

<%--        <div class="search-container">--%>
<%--          <form method="post" action="">--%>
<%--            <input type="text" class="table-search" placeholder="Search Items...">--%>
<%--            <button class="search-button">Search</button>--%>
<%--          </form>--%>
<%--        </div>--%>

        <table>
          <tr class="table-head">
            <th>Delivery Person Name</th>
            <th>Username</th>
            <th>Date Joined</th>
            <th>Mobile Number</th>
            <th>Remove</th>
<%--            <th>View</th>--%>
          </tr>

          <% for (Delivery deliverer: deliveryPersons){%>
          <tr class="table-rows">
            <td class="table-cell">
              <p class="field-name">
                <strong> Delivery Person Name</strong>
              </p>
              <p><%=deliverer.getFullName()%></p>
            </td>

            <td class="table-cell">
              <p class="field-name"><strong> Username</strong></p>
              <p><%=deliverer.getUsername()%></p>
            </td>

            <td class="table-cell">
              <p class="field-name"><strong> Date Joined</strong></p>
              <p><%=deliverer.getDateJoined()%></p>
            </td>

            <td class="table-cell">
              <p class="field-name"><strong> Mobile Number</strong></p>
              <p><%=deliverer.getPhoneNo()%></p>
            </td>

<%--            <td class="table-cell">--%>
<%--              <div class="view-more-button">--%>
<%--                <a></a><h2>View</h2>--%>
<%--              </div>--%>
<%--            </td>--%>

            <td><div class="view-more-button"><a href="removeDeliverer?username=<%=deliverer.getUsername()%>"><h2>Remove</h2></a></div></td>

          </tr>
          <%}%>
        </table>
      </div>
    </div>

  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
  <script src="../allPages/javaScript/inputValidation/admin/addDeliveryPerson.js"></script>

</div>
</body>
</html>
