<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Order" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.OrderAdCombined" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
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
  <%--    <link rel="stylesheet" href="../allPages/buyer/home.css" />--%>
  <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
  <link rel="stylesheet" href="../allPages/buyer/search-results-more.css" />


  <title>SHELFS.</title>
</head>
<body id="body">
<%
  Advertisement ad = (Advertisement) request.getAttribute("ad");


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

      <div class="book-more-details">
        <div class="navigation">
          <div class="back-button">
            <a href="manageAds"><p>Back</p></a>
          </div>

          <div class="right-buttons">
<%--            <div class="edit-button">--%>
<%--              <p>Edit</p>--%>
<%--            </div>--%>
            <div class="remove-button">
              <p><a href="deleteAd?adId=<%=ad.getAdId()%>">Remove</p></a>
            </div>
          </div>

        </div>
        <div class="main-component">
          <div class="book-cover">
            <%
              out.println("<img src=\""+ ad.getBookPhotoFront() + "\" alt=\"Book Cover\" />");
            %>
          </div>
          <div class="book-details">
            <div class="book-details-field">
              <p><strong>Title</strong></p>
              <p><% out.println(ad.getTitle());%></p>
            </div>

            <div class="book-details-field">
              <p><strong>Author</strong></p>
              <p><% out.println(ad.getAuthor());%></p>
            </div>

            <div class="book-details-field">
              <p><strong>Language</strong></p>
              <p><% out.println(ad.getLanguage());%></p>
            </div>

            <div class="book-details-field">
              <p><strong>ISBN</strong></p>
              <p><% out.println(ad.getIsbn());%></p>
            </div>

            <div class="book-details-field">
              <p><strong>Category</strong></p>
              <p><% out.println(ad.getCategory());%></p>
            </div>

            <div class="price">
              <p><strong>Price</strong></p>
              <p>Rs. <% out.println(ad.getPrice());%></p>
            </div>
          </div>
        </div>

        <div class="description">
          <p><strong>Description</strong></p>
          <p><%out.println(ad.getDescription());%></p>
        </div>
      </div>

    </div>



  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
  </nav>
  <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>



