
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.SellerApplications" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
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
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />

    <title>SHELFS.</title>
</head>
<body id="body">

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
            <div class="table-template view-seller-applications">
                <div class="head">
                    <h2 class="title">View Buyers and Sellers</h2>
                    <p class="description">View details of all Buyers and Sellers</p>
                </div>
                <div class="search-container">
                    <form method="post" action="">
                        <input type="text" class="table-search" placeholder="Search Items...">
                        <button class="search-button">Search</button>
                    </form>
                </div>
                <table>
                    <tr class="table-head">
                        <th>Name</th>
                        <th>Username</th>
                        <th>User Type</th>
                        <th>View</th>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Name</strong></p>
                            <p>Elmasiri Navathe</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Username</strong></p>
                            <p>elmasiriRoxxzz123</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> User Type</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewUsersMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Name</strong></p>
                            <p>Elmasiri Navathe</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Username</strong></p>
                            <p>elmasiriRoxxzz123</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> User Type</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewUsersMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

                    <tr class="table-rows">
                        <td class="table-cell">
                            <p class="field-name"><strong>Name</strong></p>
                            <p>Elmasiri Navathe</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> Username</strong></p>
                            <p>elmasiriRoxxzz123</p>
                        </td>

                        <td class="table-cell">
                            <p class="field-name"><strong> User Type</strong></p>
                            <p>Buyer</p>
                        </td>

                        <td class="table-cell">
                            <div class="view-more-button">
                                <a href="<%=MyVariables.rootURL%>admin/viewUsersMore"><h2>View</h2></a>
                            </div>
                        </td>
                    </tr>

<%--                    <%--%>

<%--                        for (SellerApplications sellerApp: sellerApplications) {--%>
<%--                            out.println("<tr class=\"table-rows\">");--%>
<%--                            out.println("<td>" + sellerApp.getBuyerFirstName() + " " + sellerApp.getBuyerLastName() + "</td>");--%>
<%--                            out.println("<td>" + sellerApp.getBuyerId() + "</td>");--%>
<%--                            out.println("<td>" + sellerApp.getNic() + "</td>");--%>
<%--                            out.println("<td>"+"<div class=\"view-more-button\">"+ "<a href=\"" + MyVariables.rootURL +"admin/viewSellerApplicationsMore?sellerAppId=" + sellerApp.getBuyerId() + "\"><h2>View</h2></a>\n" +"</div></td>");--%>
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


