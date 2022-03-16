<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.Order" %><%--
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


<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/admin/navbar-left.jsp"%>
    </div>

    <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/admin/navbar-right.jsp"%>
    </div>

    <main>
        <div class="main__container">
            <div class="table-template">
                <div class="search-container">
                    <form method="post" action="">
                        <input type="text" class="table-search" placeholder="Search Items...">
                        <button class="search-button">Search</button>
                    </form>
                </div>
                <table>
                    <tr class="table-head">
                        <th>Order Id</th>
                        <th>Status</th>
                        <th>Seller ID</th>
                        <th>Buyer ID</th>
                        <th>View</th>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Order Id</strong></p>
                            <p>1121</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Status</strong></p>
                            <p>Pending</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Seller Id</strong></p>
                            <p>seller1</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Buyer Id</strong></p>
                            <p>buyer1</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewOrdersAdminMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Order Id</strong></p>
                            <p>1121</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Status</strong></p>
                            <p>Pending</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Seller Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Buyer Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewOrdersAdminMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Order Id</strong></p>
                            <p>1121</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Status</strong></p>
                            <p>Pending</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Seller Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Buyer Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewOrdersAdminMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Order Id</strong></p>
                            <p>1121</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Status</strong></p>
                            <p>Pending</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Seller Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Buyer Id</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewOrdersAdminMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>








                <%--                    <%--%>

<%--                        for (Order order: orders) {--%>
<%--                            out.println("<tr class=\"table-rows\">");--%>
<%--                            out.println("<td>" + order.getOrderId() + "</td>");--%>
<%--                            out.println("<td>" + order.getStatus() + "</td>");--%>
<%--                            out.println("<td>" + order.getSellerId() + "</td>");--%>
<%--                            out.println("<td>" + order.getSellerPayStatus() + "</td>");--%>
<%--                            out.println("<td>"+"<div class=\"view-more-button\">"+ "<a href=\"" + MyVariables.rootURL +"buyer/viewOrdersMore?orderId=" + order.getOrderId() + "\"><h2>View</h2></a>\n" +"</div></td>");--%>
<%--                            out.println("</tr>");--%>
<%--                        }--%>


<%--                    %>--%>
                </table>
            </div>

        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/admin/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>
