<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Buyer" %>
<%@ page import="com.example.checkRevision.model.BuyerRequest" %>
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
    <link rel="stylesheet" href="../allPages/buyer/home.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />

    <title>SHELFS.</title>
</head>
<body id="body">

<%
    ArrayList<BuyerRequest> buyReqs = (ArrayList<BuyerRequest>) request.getAttribute("buyReqs");
    String query = (String) request.getAttribute("query");
    int currentPage = (int) request.getAttribute("currentPage");
    int noOfPages = (int) request.getAttribute("noOfPages");

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
                    <form action="viewBuyerRequests" method="get">
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
                        <th>Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Preferred Price</th>
                        <th>Buyer</th>
                        <th>View</th>
                    </tr>
<%--                    <%--%>

<%--                        for (BuyerRequest buyReq: buyReqs) {--%>
<%--                            out.println("<tr class=\"table-rows\">");--%>
<%--                            out.println("<td>" + buyReq.getTitle() + "</td>");--%>
<%--                            out.println("<td>" + buyReq.getAuthor() + "</td>");--%>
<%--                            out.println("<td>" + buyReq.getCategory() + "</td>");--%>
<%--                            out.println("<td>" + buyReq.getPreferredPrice() + "</td>");--%>
<%--                            out.println("<td>" + buyReq.getBuyerId() + "</td>");--%>
<%--                            out.println("<td>"+"<div class=\"view-more-button\">"+ "<a href=\"" + MyVariables.rootURL +"seller/viewBuyerRequestsMore2?buyReqId=" + buyReq.getRequestId() + "\"><h2>View</h2></a>\n" +"</div></td>");--%>
<%--                            out.println("</tr>");--%>
<%--                        }--%>


<%--                    %>--%>
                    <% for (BuyerRequest buyReq: buyReqs) {%>
                    <tr class="table-rows">

                        <td><%=buyReq.getTitle()%></td>
                        <td><%=buyReq.getAuthor()%></td>
                        <td><%=buyReq.getCategory()%></td>
                        <td><%=buyReq.getPreferredPrice()%></td>
                        <td><%=buyReq.getBuyerId()%></td>
                        <td><div class="view-more-button"><a href="viewBuyerRequestsMore2?buyReqId=<%=buyReq.getRequestId()%>"><h2>View</h2></a></div></td>

                    </tr>

                    <%}%>

                </table>
            </div>


            <nav class="pagination-container">
                <ul class="pagination">
                    <% if (noOfPages > 1){%>
                    <a class="page-link" href="viewBuyerRequests?Page=1&&query=${query}"><li class="page-item">First</li></a>
                    <%}%>
                    <% if (currentPage != 1){%>
                    <a class="page-link" href="viewBuyerRequests?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>
                    <%}%>

                    <% if (currentPage < noOfPages){%>
                    <a class="page-link" href="viewBuyerRequests?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>
                    <%}%>

                    <% if (noOfPages > 1){%>
                    <a class="page-link" href="viewBuyerRequests?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>
                    <%}%>

                </ul>
            </nav>
        </div>



    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/seller/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
</div>
</body>
</html>


