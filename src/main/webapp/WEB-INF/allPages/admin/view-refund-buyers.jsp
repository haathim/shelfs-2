<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.OrderBuyer" %>
<%@ page import="com.example.checkRevision.model.Delivery" %>
<%@ page import="com.example.checkRevision.model.NewOrderNewOrderPickups" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

    <link rel="stylesheet" href="../allPages/styling/layout.css" />
    <link rel="stylesheet" href="buyer_styles.css" />
    <link rel="stylesheet" href="../allPages/admin/thisura/admin_manage_users_styles.css" />
    <script src="layoutjs.js"></script>
    <title>SHELFS - Online Bookstore</title>
</head>

<body id="body">
<%
    ArrayList<NewOrderNewOrderPickups> refundDetails = (ArrayList<NewOrderNewOrderPickups>) request.getAttribute("refundDetails");
//    String query = (String) request.getAttribute("query");
//    int currentPage = (int) request.getAttribute("currentPage");
//    int noOfPages = (int) request.getAttribute("noOfPages");

%>
<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

        <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>

    </div>

    <%--    <div class="navbar__right">--%>
    <%--      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>--%>
    <%--    </div>--%>

    <main>
        <div class="main-container">
            <h1>Refund Buyers</h1>
            <div class="mainbox1">
                <table id="order1">
                    <thead>
                    <%--                    <div class="searchbar">--%>
                    <%--                        <input type="text" placeholder="Search.."><div class="inline"><button style="margin:10px;">Submit</button></div>--%>
                    <%--                    </div>--%>
                    <tr>
                        <th>Order ID</th>
                        <th>Pickup ID</th>
                        <th>Ad ID</th>
                        <th>Seller</th>
                        <th>Buyer</th>
                        <th>Refund Amount</th>
                        <th>Refund</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (NewOrderNewOrderPickups refundDetail: refundDetails){%>
                    <tr>
                        <td><%=refundDetail.getNewOrder().getOrderId()%></td>
                        <td><%=refundDetail.getNewOrderPickups().getPickupId()%></td>
                        <td><%=refundDetail.getAdId()%></td>
                        <td><%=refundDetail.getNewOrderPickups().getSellerId()%></td>
                        <td><%=refundDetail.getNewOrder().getBuyerId()%></td>
                        <td><%=refundDetail.getTotalPrice()%></td>
                        <form action="refundBuyers" method="post">
                            <input type="hidden" name="adId" value="<%=refundDetail.getAdId()%>">
                            <td><button type="submit">Refunded</button></td>
                        </form>

                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <%--            <nav class="pagination-container">--%>
            <%--                <ul class="pagination">--%>
            <%--                    <% if (noOfPages > 1){%>--%>
            <%--                    <a class="page-link" href="manageAds?Page=1&&query=${query}"><li class="page-item">First</li></a>--%>
            <%--                    <%}%>--%>
            <%--                    <% if (currentPage != 1){%>--%>
            <%--                    <a class="page-link" href="manageAds?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>--%>
            <%--                    <%}%>--%>

            <%--                    <% if (currentPage < noOfPages){%>--%>
            <%--                    <a class="page-link" href="manageAds?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>--%>
            <%--                    <%}%>--%>

            <%--                    <% if (noOfPages > 1){%>--%>
            <%--                    <a class="page-link" href="manageAds?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>--%>
            <%--                    <%}%>--%>

            <%--                </ul>--%>
            <%--            </nav>--%>

        </div>
    </main>
    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/admin/thisura/sidebar.jsp"%>
    </nav>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="script.js"></script>
<script src="layoutjs.js"></script>
</body>

</html>
