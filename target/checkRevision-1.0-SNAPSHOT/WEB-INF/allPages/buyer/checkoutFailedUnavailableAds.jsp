<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="com.example.checkRevision.model.Advertisement" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Lenovo--%>
<%--  Date: 23-Mar-22--%>
<%--  Time: 9:36 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>


<%--<% for (Advertisement ad: unavailableAds){%>--%>
<%--<h2><%=ad.getAdId()%></h2>--%>
<%--<h3><%=ad.getTitle()%></h3>--%>
<%--<%}%>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
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
    <link rel="stylesheet" href="../allPages/buyer/home.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />

    <title>SHELFS - Online Bookstore</title>
</head>
<body id="body">
<%
    ArrayList<Advertisement> unavailableAds = (ArrayList<Advertisement>) request.getAttribute("unavailableAds");
%>



<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/buyer/navbar-left/navbar-left - Home.jsp"%>
    </div>

    <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
    </div>

    <main>
        <div class="main__container">

            <h2>These Advertisements are not available any more. Please remove them from cart and try again.</h2>

            <div class="main-area-box">

                <% for (Advertisement ad: unavailableAds){%>
                <div class="sub-box" data-adId="<%=ad.getAdId()%>">
                    <div class="text-box">
                        <div hidden class="adId">
                            <div id="adId"><%=ad.getAdId()%></div>

                        </div>
                        <div class="title">
                            <div id="booktitle"><%=ad.getTitle()%></div>
                        </div>

                        <div class="author">
                            <div id="bookauthor"><%=ad.getAuthor()%></div>
                        </div>
                        <div class="description">
                            from <div id="seller"><%=ad.getSellerId()%></div>
                        </div>
                    </div>

                    <div class="book-cover">
                        <div class="cover-pic"><img src="<%=ad.getBookPhotoFront()%>" alt="Book photo"></div>
                    </div>

                    <div class="price">
                        <span id="price"><%=ad.getPrice()%></span>
                    </div>
                    <button type="button" class="remove-btn" onclick="removeFromCart(this)"><i class="fa fa-trash"></i>  Remove</button>
                </div>
                <%}%>
            </div>

        </div>



    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    <script src="../allPages/javaScript/layoutjs.js"></script>
<%--    <script src="../allPages/javaScript/addtocart.js"></script>--%>
    <script>

        function removeFromCart(element){
            var buttonClicked = element
            var cartTile = buttonClicked.parentElement
            var adIdx = cartTile.getAttribute("data-adId")
            console.log("Ad Idx", adIdx)
            cartTile.remove();

            var existingItems = JSON.parse(localStorage.getItem('cartitem'))

            console.log("666666666")
            existingItems = existingItems.filter((item) => (item.adId != parseInt(adIdx)));

            console.log("Ex item", existingItems)

            localStorage.setItem("cartitem", JSON.stringify(existingItems));
        }
    </script>

</div>
</body>
</html>


