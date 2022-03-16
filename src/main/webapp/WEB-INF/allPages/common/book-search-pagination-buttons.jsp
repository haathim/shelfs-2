
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
