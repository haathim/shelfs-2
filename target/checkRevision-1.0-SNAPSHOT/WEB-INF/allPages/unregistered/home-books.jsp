
<div class="search-container">
    <form action="searchResults" method="get">
        <input
                type="text"
                class="table-search"
                placeholder="  Search book titles, authors, categories etc"
                name="query"
        />
        <input type="submit" class="search-button" value="Search">
    </form>
</div>


<div class="main-area-box">
    <div class="grid-text">
        <h2>Fiction books</h2>
    </div>

    <div class="main-area-column">
        <div class=""main-area-row">
            <div id="leftarrow" class="arrow-left">
                <i class="fa fa-chevron-left"></i>
            </div>
        </div>
        <div id="booktiles" class="book-tiles">
            <%
                for (Advertisement ad: fictionAds) {
                    out.println("<div class=\"main-sub-box\">\n" +
                            "<div class=\"cover-pic\">" + "<img src=\"" + ad.getBookPhotoFront() + "\" />" + "</div>" +
                            "<div class=\"title\">" + ad.getTitle() + "</div>\n" +
                            "<div class=\"author\"><str>" + ad.getAuthor() + "</str></div>" +
                            "<div class=\"view-more-button\">" + "<a href=\"" + "searchResultsMore?adId=" + ad.getAdId() + "\"><button>View</button></a>\n" + "</div>" +
                            "<div class=\"price\">Rs." + ad.getPrice() + "</div>\n" +
                            "</div>");
                }
            %>
        </div>

        <div class=""main-area-row">
             <div id="rightarrow" class="arrow-right">

                 <i class="fa fa-chevron-right"></i>

            </div>
        </div>


    </div>



</div>

<div class="main-area-box">
    <div class="grid-text">
        <h2>Non-fiction books</h2>
    </div>
    <div class="main-area-column">
        <div class=""main-area-row">
            <div id="leftarrow" class="arrow-left">
                <i class="fa fa-chevron-left"></i>
            </div>
        </div>
        <div id="booktiles" class="book-tiles">
        <%
            for (Advertisement ad: nonFictionAds) {
                out.println("<div class=\"main-sub-box\">\n" +
                        "<div class=\"cover-pic\">" + "<img src=\"" + ad.getBookPhotoFront() + "\" />" + "</div>" +
                        "<div class=\"title\">" + ad.getTitle() + "</div>\n" +
                        "<div class=\"author\"><str>" + ad.getAuthor() + "</str></div>" +
                        "<div class=\"view-more-button\">" + "<a href=\"" + "searchResultsMore?adId=" + ad.getAdId() + "\"><button>View</button></a>\n" + "</div>" +
                        "<div class=\"price\">Rs." + ad.getPrice() + "</div>\n" +
                        "</div>");
            }
        %>
        </div>
        <div class=""main-area-row">
            <div id="rightarrow" class="arrow-right">

                <i class="fa fa-chevron-right"></i>

            </div>
        </div>
    </div>
</div>

<%--<div class="main-area-box">--%>
<%--    <div class="grid-text">--%>
<%--        <h2>Other books</h2>--%>
<%--    </div>--%>
<%--    <div class="main-area-column">--%>
<%--        <%--%>
<%--            for (Advertisement ad: otherAds) {--%>
<%--                out.println("<div class=\"main-sub-box\">\n" +--%>
<%--                        "<div class=\"cover-pic\">" + "<img src=\"" + ad.getBookPhotoFront() + "\" />" + "</div>" +--%>
<%--                        "<div class=\"title\">" + ad.getTitle() + "</div>\n" +--%>
<%--                        "<div class=\"author\"><str>" + ad.getAuthor() + "</str></div>" +--%>
<%--                        "<div class=\"view-more-button\">" + "<a href=\"" + "searchResultsMore?adId=" + ad.getAdId() + "\"><button>View</button></a>\n" + "</div>" +--%>
<%--                        "<div class=\"price\">Rs." + ad.getPrice() + "</div>\n" +--%>
<%--                       "</div>");--%>
<%--            }--%>
<%--        %>--%>

<%--    </div>--%>
<%--</div>--%>