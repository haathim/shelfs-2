<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.*" %><%--
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
    ArrayList<NewOrder> orders = (ArrayList<NewOrder>) request.getAttribute("orders");

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
            <div class="table-template">
                <div class="search-container">
                    <form method="get" action="viewOrders">
                        <input type="text" name="keyword" class="table-search" placeholder="Search Items...">
                        <button type="submit" class="search-button">Search</button>
                    </form>
                </div>
                <table>
                    <tr class="table-head">
                        <th>Order Id</th>
                        <th>Date Ordered</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th>See More</th>

                    </tr>
                    <%for (NewOrder order: orders){%>

                    <tr class="table-rows">

                    <td><%=order.getOrderId()%></td>
                    <td><%=order.getDateOrdered()%></td>
                    <td><% switch (order.getStatus()) {
                        case 0:
                            out.println("Pending Pickups");
                            break;
                        case 1:
                            out.println("Pickups Complete");
                            break;
                        case 2:
                            out.println("To be delivered");
                            break;
                        case 3:
                            out.println("Delivered");
                            break;
                    }%></td>
                    <td><%=order.getTotalPrice()%></td>
                    <td><div class="view-more-button"><a href="viewOrdersMore?orderId=<%=order.getOrderId()%>"><h2>View</h2></a></div></td>

                    </tr>
                    <%}%>
                </table>
            </div>

        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - orders.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>
