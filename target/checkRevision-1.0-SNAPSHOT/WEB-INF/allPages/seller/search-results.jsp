<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="../allPages/unregistered/search-results.css" />

    <title>SHELFS.</title>
</head>
<body id="body">
<%
    ArrayList<Advertisement> resultAds = (ArrayList<Advertisement>) request.getAttribute("resultAds");
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
            <!-- Insert Main Code Here -->
            <%--            <div class="search-container">--%>
            <%--                <input--%>
            <%--                        type="text"--%>
            <%--                        class="table-search"--%>
            <%--                        placeholder="Search Items..."--%>
            <%--                />--%>
            <%--                <button class="search-button">Search</button>--%>
            <%--            </div>--%>
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

            <div class="main-area-box">
                <div class="grid-text">
                    <h2>Search Results</h2>
                </div>
                <div class="main-area-column">
                    <%
                        for (Advertisement ad: resultAds) {
                            out.println("<div class=\"main-sub-box\">\n" +
                                    "<div class=\"cover-pic\">" + "<img src=\""+ad.getBookPhotoFront()+"\" />" + "</div>" +
                                    "<div class=\"title\">"+ad.getTitle()+"</div>\n" +
                                    "<div class=\"author\"><str>"+ad.getAuthor()+"</str></div>"+
//                                            "<div class=\"view-more-button\">" + "<button><a href=\""+"http://localhost:8000/checkRevision_war_exploded/searchResultsMoreServlet?adId="+ad.getAdId()+"\">View</a></button>\n" + "</div>"+
                                    "<div class=\"view-more-button\">" + "<a href=\"" + MyVariables.rootURL +"seller/searchResultsMore?adId=" + ad.getAdId() + "\"><button>View</button></a>\n" + "</div>" +                                    "<div class=\"price\">Rs."+ad.getPrice()+"</div>\n" +
//                                            "<div id=\"view-more-url\" hidden>"+"http://localhost:8000/checkRevision_war_exploded/searchResultsMoreServlet?adId="+ad.getAdId()+"</div>\n" +
                                    "</div>");

                        }
                    %>
                </div>
            </div>

            <nav class="pagination-container">
                <ul class="pagination">
                    <% if (noOfPages > 0){%>
                    <a class="page-link" href="searchResults?Page=1&&query=${query}"><li class="page-item">First</li></a>
                    <%}%>
                    <% if (currentPage != 1){%>
                    <a class="page-link" href="searchResults?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>
                    <%}%>

                    <% if (currentPage < noOfPages){%>
                    <a class="page-link" href="searchResults?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>
                    <%}%>

                    <% if (noOfPages > 1){%>
                    <a class="page-link" href="searchResults?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>
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


