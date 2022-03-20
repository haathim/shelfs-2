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
    <link rel="stylesheet" href="../allPages/buyer/search-results-more.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/buyer/buyer_book_styles.css" />

    <title>SHELFS.</title>
  </head>
  <body id="body">
    <% Advertisement ad = (Advertisement) request.getAttribute("ad"); %>

    <div class="container">
      <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
      </div>

      <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/buyer/navbar-left.jsp"%>
      </div>

      <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
      </div>

      <main>
        <div class="main__container">
          <div class="book-more-details">
            <div class="navigation">
              <div class="back-button">
                <button onclick="goBack()">Back</button>
              </div>
            </div>
            <div class="main-area-box">
              <div class="book-top-box">
                <div class="top-box-title-block">
                  <% out.println(ad.getTitle());%>
                  <div class="author"><% out.println(ad.getAuthor());%></div>
                </div>
                <div class="top-box-seller-block">
                  <div class="seller-icon"></div>

                  <div class="seller-name" id="seller">
                    <%=ad.getSellerId()%>
<%--                    <div class="rating">4.9</div>--%>
                  </div>
                </div>
              </div>
              <div class="detail-block" id="item1">
                <div class="book-cover">
                  <div class="cover-pic">
                    <img src="<%=ad.getBookPhotoFront()%>" id="image" />
                  </div>
                </div>
                <div class="padding"></div>

                <div class="book-details">
                  <div class="detail-list">
                    <div hidden class="list" style="display: none">
                      <h2 id="textwidth">Ad Id</h2>
                      <h3 id="adId"><% out.println(ad.getAdId());%></h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">Title</h2>
                      <h3 id="booktitle"><% out.println(ad.getTitle());%></h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">Author</h2>
                      <h3 id="bookauthor"><% out.println(ad.getAuthor());%></h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">Description</h2>
                      <h3 id="parawidth">
                        <% out.println(ad.getDescription());%>.
                      </h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">Language</h2>
                      <h3><% out.println(ad.getLanguage());%></h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">ISBN</h2>
                      <h3><% out.println(ad.getIsbn());%></h3>
                    </div>
                    <div class="list">
                      <h2 id="textwidth">Category</h2>
                      <h3><% out.println(ad.getCategory());%></h3>
                    </div>
                  </div>
                  <div class="buttons">
                    <div class="price-button" id="price">
                      <% out.println(ad.getPrice());%>
                    </div>
                    <div class="btn-inline">
                      <button
                        type="button"
                        class="addtocart-btn"
                        onclick="addToCart()"
                      >
                        <i class="fa fa-shopping-cart"></i> Add to cart
                      </button>
                      <form action="addtowishlist" method="post">
                        <input
                          type="hidden"
                          name="adId"
                          value="<%=ad.getAdId()%>"/>

                        <button type="submit" class="addtowishlist-btn">
                          <i class="fa fa-star"></i> Add to wishlist
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              <%--
              <div class="recommendations">
                --%> <%--
                <div class="top-box-title-block">
                  --%> <%-- You may also like--%> <%--
                </div>
                --%> <%--
                <div class="recommended-books">
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img src="../allPages/uploads/hobbit-cover.jpg" />--%>
                      <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img
                        src="../allPages/uploads/harrypotter-cover.jpg"
                      />--%> <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img src="../allPages/uploads/got-cover.jpg" />--%> <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img src="../allPages/uploads/aw80-cover.jpg" />--%> <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img src="../allPages/uploads/sherlock-cover.jpg" />--%>
                      <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                  <div class="main-sub-box">
                    --%> <%--
                    <div class="cover-pic-small">
                      --%> <%--
                      <img src="../allPages/uploads/tomsawyer-cover.jpg" />--%>
                      <%--
                    </div>
                    --%> <%--
                  </div>
                  --%> <%--
                </div>
                --%> <%--
              </div>
              --%>
            </div>
          </div>
        </div>
      </main>

      <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
      </nav>
      <script src="../allPages/javaScript/sidebarResponsive.js"></script>
      <script src="../allPages/javaScript/addtocart.js"></script>
      <script>
        function goBack() {
          window.history.back();
        }
      </script>
    </div>
  </body>
</html>
