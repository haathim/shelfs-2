<%@ page import="java.util.ArrayList" %> <%@ page
import="com.example.checkRevision.model.SellerApplications" %> <%@ page
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
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/admin/view-complaints-more.css" />

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <div class="container">
      <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
      </div>

      <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/admin/navbar-left.jsp"%>
      </div>

      <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/admin/navbar-right.jsp"%>
      </div>

      <main>
        <div class="main__container">
          <div class="view-seller-applications">
            <div class="book-more-details">
              <div class="navigation">
                <div class="back-button">
                  <p>Back</p>
                </div>
                <div class="right-buttons">
                  <div class="remove-button">
                    <p>Reply</p>
                  </div>
                </div>
              </div>

              <div class="main-component">
                <div class="book-details">
                  <div class="details-title">
                    <h2>Complaint Details</h2>
                  </div>
                  <div class="book-details-field">
                    <p><strong>Name of User</strong></p>
                    <p>Elmasiri Navathe</p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Username</strong></p>
                    <p>elmasiriRoxxzz123</p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Title</strong></p>
                    <p>Website not working</p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Description</strong></p>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                      sed do eiusmod tempor incididunt ut labore et dolore magna
                      aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                      ullamco laboris nisi ut aliquip ex ea commodo consequat.
                      Duis aute irure dolor in reprehenderit in voluptate velit
                      esse cillum dolore eu fugiat nulla pariatur. Excepteur
                      sint occaecat cupidatat non proident, sunt in culpa qui
                      officia deserunt mollit anim id est laborum.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/admin/sidebar.jsp"%>
      </nav>
      <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    </div>
  </body>
</html>
