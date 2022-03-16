<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.*" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
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

    <title>SHELFS.</title>
</head>
<body id="body">
<%
    ArrayList<SellerSale> newlySoldAds = (ArrayList<SellerSale>) request.getAttribute("newlySoldAds");

%>


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

            <div class="table-template">
<%--                <div class="search-container">--%>
<%--                    <form action="searchResults" method="get">--%>
<%--                        <input--%>
<%--                                type="text"--%>
<%--                                class="table-search"--%>
<%--                                placeholder="Search Items..."--%>
<%--                                name="query"--%>
<%--                        />--%>
<%--                        <input type="submit" class="search-button" value="Search">--%>
<%--                    </form>--%>
<%--                </div>--%>
                <table>
                    <tr class="table-head">
                        <th>Buyer</th>
                        <th>Book Title</th>
                        <th>Book Author</th>
                        <th>View</th>
                    </tr>

                    <% for(SellerSale newSale: newlySoldAds){%>
                    <tr class="table-rows">

                        <td><%=newSale.getBuyer()%></td>
                        <td><%=newSale.getTitle()%></td>
                        <td><%=newSale.getAuthor()%></td>
                        <td>
                            <div class="view-more-button">
                                <a href="newSalesMore?adId=<%=newSale.getAdId()%>"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>
                    <%}%>

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




