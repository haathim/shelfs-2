<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %><%--
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
<%--    <link rel="stylesheet" href="../allPages/buyer/buyer-common.css" />--%>
    <link rel="stylesheet" href="../allPages/buyer/my-favourites.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />


    <title>SHELFS.</title>
</head>
<body>
<%
    ArrayList<Advertisement> wishlistAds = (ArrayList<Advertisement>) request.getAttribute("wishlistAds");

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
            <div class="main-area-box">
                <div class="top-box-title-block">
                    Favorites
                    <% for (Advertisement favTitle: wishlistAds){%>
                    <div class="sub-box">
                        <div class="text-box">

                            <div class="title">
                                <%=favTitle.getTitle()%>
                            </div>
                            <div class="author">
                                <%=favTitle.getAuthor()%>
                            </div>


                        </div>

                        <div class="book-cover">
                            <div class="cover-pic">
                                <img src="<%=favTitle.getBookPhotoFront()%>">
                            </div>
                        </div>

                        <% if(favTitle.getAvailable() != 1){%>
                        <div class="description">
                            <p style="color: red">This Advertisement is no longer available</p>
                            <a href="searchResults?query=<%=favTitle.getTitle()%>">View Similar Books</a>
                        </div>
                        <%}else{%>
                        <div class="description">
                            <%=favTitle.getDescription()%>
                        </div>
                        <form method="post">
                            <input type="hidden" name="adId" value=<%=favTitle.getAdId()%>>
                            <button type="submit" class="favorite-btn">
                                <a href="searchResultsMore?adId=<%=favTitle.getAdId()%>">View book </a> </button>
                        </form>
                        <%}%>

                        <form action="deletefromwishlist" method="post">
                            <input type="hidden" name="adId" value=<%=favTitle.getAdId()%>>
                                <button type="submit" class="favorite-btn">Remove from favourites</button>
                        </form>

                    </div>
                    <%}%>

                </div>
                <%--                <div class="top-box-title-block">--%>

                <%--                    <div class="sub-box">--%>
                <%--                        <div class="text-box">--%>

                <%--                            <div class="title">--%>
                <%--                                The Hobbit--%>
                <%--                            </div>--%>
                <%--                            <div class="author">--%>
                <%--                                J.R.R Tolkien--%>
                <%--                            </div>--%>

                <%--                        </div>--%>

                <%--                        <div class="book-cover">--%>
                <%--                            <div class="cover-pic"></div>--%>
                <%--                        </div>--%>
                <%--                        <div class="description">--%>
                <%--                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Itaque vel corporis quidem praesentium delectus, rerum vero, ducimus ea iure, aut nam dolorum ullam. Quidem officia vero iure ex, deserunt voluptate.--%>
                <%--                        </div>--%>
                <%--                        <button type="button" class="favorite-btn">Remove from favourties</button>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>

        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - favourites.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>
