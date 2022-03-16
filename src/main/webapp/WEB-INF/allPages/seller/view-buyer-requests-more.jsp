<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.BuyerRequest" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
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

    <title>SHELFS.</title>
</head>
<body id="body">

<%
    BuyerRequest buyReq = (BuyerRequest) request.getAttribute("buyReq");


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
                <table>
                    <tr class="table-head">
                        <th>Field</th>
                        <th>Details</th>
                    </tr>
                    <%
                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Request ID" + "</td>");
                        out.println("<td>" + buyReq.getRequestId() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Title" + "</td>");
                        out.println("<td>" + buyReq.getTitle() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Author" + "</td>");
                        out.println("<td>" + buyReq.getAuthor() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Date Requested" + "</td>");
                        out.println("<td>" + buyReq.getDate() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Buyer" + "</td>");
                        out.println("<td>" + buyReq.getBuyerId() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Category" + "</td>");
                        out.println("<td>" + buyReq.getCategory() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Preferred Price" + "</td>");
                        out.println("<td>" + buyReq.getPreferredPrice() + "</td>");
                        out.println("</tr>");

                        out.println("<tr class=\"table-rows\">");
                        out.println("<td>" + "Comment from Buyer" + "</td>");
                        out.println("<td>" + buyReq.getComment() + "</td>");
                        out.println("</tr>");

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


