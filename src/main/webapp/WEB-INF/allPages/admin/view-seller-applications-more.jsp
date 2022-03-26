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
    <link
      rel="stylesheet"
      href="../allPages/admin/view-seller-applications-more.css"
    />

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <% SellerApplications sellerApplication = (SellerApplications)
    request.getAttribute("sellApp"); System.out.println("This is from JSP Page for Seller Application view more--");
    System.out.println(sellerApplication.getBuyerId()); %>

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
          <div class="view-seller-applications">
            <div class="book-more-details">
              <div class="navigation">
                <div class="back-button">
                  <a href="viewSellerApplications"><p>Back</p></a>
                </div>
                <div class="right-buttons">
                  <div class="remove-button">
                    <a
                      href="acceptSellerApp?sellerAppId=<%=sellerApplication.getBuyerId()%>"><p>Accept</p></a
                    >
                    <%--
                    <form action="acceptSellerApp" method="post">
                      <input type="submit" value="Accept" />
                    </form>
                    --%>
                  </div>
                  <div class="remove-button">
                    <a
                      href="rejectSellerApp?sellerAppId=<%=sellerApplication.getBuyerId()%>"><p>Reject</p></a
                    >
                    <%--
                    <form action="rejectSellerApp" method="post">
                      <input type="submit" value="Accept" />
                    </form>
                    --%>
                  </div>
                </div>
              </div>

              <div class="main-component">
                <div class="book-details">
                  <div class="details-title">
                    <h2>Buyer Details</h2>
                  </div>
                  <div class="book-details-field">
                    <p><strong>Buyer Name</strong></p>
                    <p>
                      <%=sellerApplication.getBuyerFirstName()%>
                      <%=sellerApplication.getBuyerLastName()%>
                    </p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Username</strong></p>
                    <p><%=sellerApplication.getBuyerId()%></p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>NIC</strong></p>
                    <p><%=sellerApplication.getNic()%></p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Bank Account Number</strong></p>
                    <p><%=sellerApplication.getBankAccountNo()%></p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Bank Name</strong></p>
                    <p><%=sellerApplication.getBankName()%></p>
                  </div>

                  <div class="book-details-field">
                    <p><strong>Bank Branch</strong></p>
                    <p><%=sellerApplication.getBankBranch()%></p>
                  </div>
                </div>

                <div class="book-cover">
                  <img src="<%=sellerApplication.getNicPhotoFront()%>" />
                </div>
                <div class="book-cover">
                  <img src="<%=sellerApplication.getNicPhotoBack()%>" />
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
    </div>
  </body>
</html>
