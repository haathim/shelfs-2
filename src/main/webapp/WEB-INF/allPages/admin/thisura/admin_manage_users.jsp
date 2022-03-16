<%@ page import="com.example.checkRevision.model.Buyer" %>
<%@ page import="java.util.ArrayList" %>
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
  ArrayList<Buyer> resultBuyers = (ArrayList<Buyer>) request.getAttribute("resultBuyers");
  String query = (String) request.getAttribute("query");
  int currentPage = (int) request.getAttribute("currentPage");
  int noOfPages = (int) request.getAttribute("noOfPages");

%>

  <div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
      <i class="fa fa-bars" aria-hidden="true"></i>
    </div>


    <div class="navbar__left">

      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-left.jsp"%>

    </div>

    <div class="navbar__right">
      <%@include file="/WEB-INF/allPages/admin/thisura/navbar-right.jsp"%>
    </div>

    <main>
      <div class="main-container">
          <h1>Manage Users</h1>
          <div class="mainbox1">
            <table id="order1">
              <thead>
                <div class="searchbar">
                  <input type="text" placeholder="Search.."><div class="inline"><button style="margin:10px;">Submit</button></div>
                  </div>
                <tr>
                  <th>User Name</th>
                  <th>User ID</th>
                  <th>Status</th>
                  <th>More Details</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
<%--                <tr>--%>
<%--                  <td>Chandler Bing</td>--%>
<%--                  <td>1045</td>--%>
<%--                  <td>Seller</td>--%>
<%--                  <td><a href="#">View</a></td>--%>
<%--                  <td><div class="inline"><button style="margin:5px;">Terminate</div></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Monica Geller</td>--%>
<%--                    <td>4571</td>--%>
<%--                    <td>Buyer</td>--%>
<%--                    <td><a href="#">View</a></td>--%>
<%--                    <td><div class="inline"><button style="margin:5px;">Terminate</div></td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>Joey Tribbiani</td>--%>
<%--                    <td>0236</td>--%>
<%--                    <td>Delivery Person</td>--%>
<%--                    <td><a href="#">View</a></td>--%>
<%--                    <td><div class="inline"><button style="margin:5px;">Terminate</div></td>--%>
<%--                  </tr>--%>

                <% for(Buyer resultBuyer:resultBuyers){%>
                  <tr>
                    <td><%=resultBuyer.getFirstName()%> <%=resultBuyer.getLastName()%></td>
                    <td><%=resultBuyer.getUsername()%></td>
                    <td><%=resultBuyer.getUserType()%></td>
                    <td><a href="viewUsersMore?username=<%=resultBuyer.getUsername()%>">View</a></td>
                    <td><div class="inline"><a href="#"><button style="margin:5px;">Remove</button></a></div></td>
                  </tr>
                <%}%>
              </tbody>
            </table>
          </div>

        <nav class="pagination-container">
          <ul class="pagination">
            <% if (noOfPages > 1){%>
            <a class="page-link" href="viewUsers?Page=1&&query=${query}"><li class="page-item">First</li></a>
            <%}%>
            <% if (currentPage != 1){%>
            <a class="page-link" href="viewUsers?Page=${currentPage-1}&&query=${query}"><li class="page-item">Previous</li></a>
            <%}%>

            <% if (currentPage < noOfPages){%>
            <a class="page-link" href="viewUsers?Page=${currentPage+1}&&query=${query}"><li class="page-item">Next</li></a>
            <%}%>

            <% if (noOfPages > 1){%>
            <a class="page-link" href="viewUsers?Page=${noOfPages}&&query=${query}"><li class="page-item">Last</li></a>
            <%}%>

          </ul>
        </nav>

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