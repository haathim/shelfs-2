<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.Order" %>
<%@ page import="com.example.checkRevision.model.OrderAdCombined" %><%--
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
    <link rel="stylesheet" href="../allPages/buyer/buyer-common.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />


    <title>SHELFS.</title>
</head>
<body>
<%
    ArrayList<OrderAdCombined> orders = (ArrayList<OrderAdCombined>) request.getAttribute("orders");

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
                <div class="search-container">
                    <form action="searchResults" method="get">
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
                        <th>Order Id</th>
                        <th>Seller ID</th>
                        <th>Delivered</th>
                        <th>View</th>
                    </tr>
                    <%

                        for (OrderAdCombined order: orders) {
                            out.println("<tr class=\"table-rows\">");
                            out.println("<td>" + order.getOrder().getOrderId() + "</td>");
                            out.println("<td>" + order.getAd().getSellerId() + "</td>");
                            out.println("<td>" + order.getOrder().isCompleted() + "</td>");
                            out.println("<td>"+"<div class=\"view-more-button\">"+ "<a href=\"" + "viewOrdersMore?orderId=" + order.getOrder().getOrderId() + "\"><h2>View</h2></a>\n" +"</div></td>");
                            out.println("</tr>");
                        }


                    %>
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
