<%@ page import="com.example.checkRevision.model.Advertisement" %> <%@ page
import="java.util.ArrayList" %> <%@ page
import="com.example.checkRevision.model.Order" %> <%@ page
import="com.example.checkRevision.variables.MyVariables" %> <%@ page
import="com.example.checkRevision.model.OrderAdCombined" %><%-- Created by
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
    <%--
    <link rel="stylesheet" href="../allPages/buyer/home.css" />
    --%>
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link
      rel="stylesheet"
      href="../allPages/unregistered/search-results-more.css"
    />

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <% Advertisement ad = (Advertisement) request.getAttribute("ad"); %>

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
          <div class="book-more-details">
            <div class="navigation">
              <div class="back-button">
                <a href="viewPostedAds"><p>Back</p></a>
              </div>

              <div class="right-buttons">
                <%--
                <div class="edit-button">
                  --%> <%--
                  <a href="editPostedBook?adId=<%=ad.getAdId()%>"><p>Edit</p></a
                  >--%> <%--
                </div>
                --%>
                <div class="remove-button">
                  <a href="removePostedBook?adId=<%=ad.getAdId()%>"
                    ><p>Remove</p></a
                  >
                </div>
              </div>
            </div>
            <div class="main-component">
              <div class="book-cover">
                <% out.println("<img src=\""+ ad.getBookPhotoFront() + "\" alt=\"Book Cover\" />"); %>
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

          <div class="edit-book">
            <div class="formContainer">
              <h1>EDIT BOOK</h1>
              <p>Fill the below form to edit book.</p>
              <div id="instructions" style="color: blue; font-weight: bold">
              </div>
              <div id="error" style="color: red; font-weight: bold"></div>
              <form action="editPostedBook" method="post" enctype="multipart/form-data" id="form">
                <input type="hidden" name="adId" value="<%=ad.getAdId()%>">
                <div class="row">
                  <div class="column">
                    <label for="title">Title</label>
                    <input
                            type="text"
                            id="title"
                            name="title"
                            value="<%=ad.getTitle()%>"
                            required

                    />
                  </div>
                  <div class="column">
                    <label for="author">Author</label>
                    <input
                            type="text"
                            id="author"
                            name="author"
                            value="<%=ad.getAuthor()%>"
                            required
                    />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="isbn">ISBN</label>
                    <input type="text" id="isbn" name="isbn" value="<%=ad.getIsbn()%>" required />
                  </div>
                </div>
                <div class="row">

                  <div class="column">
                    <label for="category">Category</label><br>
                    <select
                            type="text"
                            id="category"
                            name="category"
                            required
                    ></select>
                  </div>
                  <div class="column">
                    <label for="language">Language</label><br>
                    <select
                            type="text"
                            id="language"
                            name="language"
                            required
                    ></select>
                  </div>
                </div>
                <div class="row">

                  <div class="column">
                    <label for="price">Price</label>
                    <input type="number" id="price" name="price" value="<%=ad.getPrice()%>" required />
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="description">Description</label>
                    <h4>Current Description:</h4>
                    <p><%=ad.getDescription()%></p>
                    <textarea
                            id="description"
                            placeholder="Describe your book in detail here"
                            rows="3"
                            name="description"
                    ></textarea>
                  </div>
                </div>
                <div class="row">
                  <div class="column">
                    <label for="frontPhoto">Front Image</label>
                    <input type="file" id="frontPhoto" placeholder="Images: Max size 2MB. Allowed types JPG and PNG." name="frontPhoto" multiple accept=".jpg, .png" />
                  </div>
                  <div class="column">
                    <label for="backPhoto">Back Image</label>
                    <input type="file" id="backPhoto" placeholder="Images: Max size 2MB. Allowed types JPG and PNG." name="backPhoto" multiple accept=".jpg, .png" />
                  </div>
                </div>
                <input type="submit" id="submit-button" value="Edit"/>

              </form>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/seller/sidebar.jsp"%>
      </nav>
      <script src="../allPages/javaScript/sidebarResponsive.js"></script>
      <script src="../allPages/javaScript/inputValidation/seller/editBookForm.js"></script>

    </div>
  </body>
</html>
