
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.SellerApplications" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
change this template use File | Settings | File Templates. --%> <%@ page
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
  <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
<%--  <link rel="stylesheet" href="../allPages/admin/thisura/admin_messages_styles.css" />--%>


  <title>SHELFS.</title>
</head>
<body id="body">


<div class="container">
  <div class="nav_icon" onclick="toggleSidebar()">
    <i class="fa fa-bars" aria-hidden="true"></i>
  </div>

  <div class="navbar__left">
    <%@include file="/WEB-INF/allPages/seller/navbar-left.jsp"%>
  </div>

  <div class="navbar__right">
    <%@include file="/WEB-INF/allPages/seller/navbar-right.jsp"%>
  </div>

  <main>
    <div class="main__container">
      <h1>Messages</h1>
<%--      <div class="mainbox1">--%>
<%--        <table id="order1">--%>

<%--          <tbody>--%>
<%--          <tr>--%>
<%--            <td>User 1</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 2</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 3</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 4</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 5</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 6</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 7</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 8</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 9</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 10</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 11</td>--%>
<%--          </tr>--%>
<%--          <tr>--%>
<%--            <td>User 12</td>--%>
<%--          </tr>--%>
<%--          </tbody>--%>
<%--        </table>--%>
<%--        <div class="mainbox2"></div>--%>
<%--      </div>--%>
<%--      <div class="mainbox3"></div>    </div>--%>
      <div class="table-template">
        <div class="search-container">
          <form action="viewChats" method="get">
            <input
                    type="text"
                    class="table-search"
                    placeholder="Search Items..."
                    name="query"
            />
            <input type="submit" class="search-button" value="Search">
          </form>
        </div>
        <table>
          <tr class="table-head">
            <th>USER</th>
            <th>LATEST MESSAGE</th>
            <th>OPEN</th>
          </tr>

          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>

          </tr>
          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
          </tr>
          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
          </tr>
          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
          </tr>
          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
          </tr>
          <tr class="table-rows">
            <td>Harry Potter</td>
            <td>What's the best price?</td>
            <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
          </tr>
        </table>
      </div>
    </div>


  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/seller/sidebar.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>


