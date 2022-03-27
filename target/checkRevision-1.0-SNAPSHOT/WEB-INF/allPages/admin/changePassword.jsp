
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
      <%@include file="/WEB-INF/allPages/common/changePasswordCommonpart.jsp"%>
    </div>

  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
  <script src="../allPages/javaScript/inputValidation/changePasswordValidation.js"></script>

</div>
</body>
</html>



