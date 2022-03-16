<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.PenDelOrderCombined" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

    <link rel="stylesheet" href="../allPages/delivery/style.css" />
<%--    <link rel="stylesheet" href="../allPages/styling/layout.css" />--%>
<%--    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />--%>
    <link rel="stylesheet" href="../allPages/delivery/overview.css">

    <title>SHELFS - Online Bookstore</title>

</head>

<%
    ArrayList<PenDelOrderCombined> penDelOrders = (ArrayList<PenDelOrderCombined>) request.getAttribute("penDelOrders");
    String query = (String) request.getAttribute("query");
    int currentPage = (int) request.getAttribute("currentPage");
    int noOfPages = (int) request.getAttribute("noOfPages");
%>

<body id="body">
<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

        <div class="datetime">

            <div class="time">
                <span class="hms"></span>
                <span class="ampm"></span>
                <br>
                <span class="date"></span>
            </div>

        </div>

    </div>

    <div class="navbar__right">

        <a href="#" onclick="toggleNotifi()">
            <i class="fa fa-bell"></i>
        </a>

        <!--notification list-->
        <div class="notifi-box" id="box">

            <h2>Notifications <span>#</span></h2>

            <div class="notifi-item">
                <div class="text">
                    <h4>Dear Sir/Miss</h4>
                    <p>Thank You for complete.</p>
                </div>
            </div>

            <div class="notifi-item">
                <div class="text">
                    <h4>Dear Sir/Miss</h4>
                    <p>Thank You for complete.</p>
                </div>
            </div>

            <div class="notifi-item">
                <div class="text">
                    <h4>Dear Sir/Miss</h4>
                    <p>Thank You for complete.</p>
                </div>
            </div>

            <div class="notifi-item">
                <div class="text">
                    <h4>Dear Sir/Miss</h4>
                    <p>Thank You for complete.</p>
                </div>
            </div>

            <div class="notifi-item">
                <div class="text">
                    <h4>Dear Sir/Miss</h4>
                    <p>Thank You for complete.</p>
                </div>
            </div>

        </div>

        <a href="#">
            <i class="fa fa-envelope"></i>
        </a>
        <a href="#">
            <img width="30" src="assets/avatar.svg" alt="" />
        </a>
    </div>

    <main>

        <h1>Overview</h1>

        <div class="overview-navigation">
            <!--Orders Deliveries Pickups Completed Search bar-->
            <nav class="ov-navigation">

                <ul>
                    <li><a class="active" href="#">Orders</a></li>
                    <li><a href="#">Deliveries</a></li>
                    <li><a href="#">Pickups</a></li>
                    <li><a href="#">Completed</a></li>
                </ul>

                <div class="search-container">
                    <form action="#">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

            </nav>

        </div>

        <div class="pending-delivery">

            <div class="table-template">

                <table>

                    <tr class="table-head">
                        <th>Order ID</th>
                        <th>Advertisement ID</th>
                        <th>Seller ID</th>
                        <th>Buyer ID</th>
                        <th>District</th>
                        <th>Date Ordered</th>
                        <th>View</th>
                    </tr>

                    <% for (PenDelOrderCombined penDelOrder: penDelOrders){%>
                        <tr class="table-rows">
                            <td class="table-cell">
                                <p class="field-name"><strong> Order ID</strong></p>
                                <p><%=penDelOrder.getOrder().getOrderId()%></p>
                            </td>

                            <td class="table-cell">
                                <p class="field-name"><strong> Advertisement ID</strong></p>
                                <p><%=penDelOrder.getOrder().getAdId()%></p>
                            </td>

                            <td class="table-cell">
                                <p class="field-name"><strong> Seller ID</strong></p>
                                <p><%=penDelOrder.getAdvertisement().getSellerId()%></p>
                            </td>

                            <td class="table-cell">
                                <p class="field-name"><strong> Buyer ID</strong></p>
                                <p><%=penDelOrder.getOrder().getBuyerId()%></p>
                            </td>

                            <td class="table-cell">
                                <p class="field-name"><strong> District</strong></p>
                                <p><%=penDelOrder.getPendingJob().getBuyerDistrict()%></p>
                            </td>

                            <td class="table-cell">
                                <p class="field-name"><strong> Date Ordered</strong></p>
                                <p>3/9/2020</p>
                            </td>

                            <td class="table-cell">
                                <a href="unacceptedDetails?orderId=<%=penDelOrder.getPendingJob().getOrderId()%>"><p>View</p></a>
                            </td>

                        </tr>
                    <%}%>
                </table>

            </div>

        </div>

        <nav class="pagination-container">
            <ul class="pagination">
                <% if (noOfPages > 1){%>
                <a class="page-link" href="home?Page=1&&query=${query}"><li class="page-item">First</li></a>
                <%}%>
                <% if (currentPage != 1){%>
                <a class="page-link" href="home?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>
                <%}%>

                <% if (currentPage < noOfPages){%>
                <a class="page-link" href="home?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>
                <%}%>

                <% if (noOfPages > 1){%>
                <a class="page-link" href="home?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>
                <%}%>

            </ul>
        </nav>
    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/delivery/sidebar.jsp"%>
    </nav>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script src="../allPages/javaScript/sidebarResponsive.js"></script>
<script src="../allPages/delivery/script.js"></script>

</body>

</html>