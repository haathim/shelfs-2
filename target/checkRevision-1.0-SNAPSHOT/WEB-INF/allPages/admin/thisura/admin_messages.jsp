<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

    <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="buyer_styles.css" />
<%--  <link rel="stylesheet" href="../allPages/admin/thisura/admin_messages_styles.css" />--%>
  <script src="layoutjs.js"></script>
  <title>SHELFS - Online Bookstore</title>
</head>

<body id="body">
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
      <div class="main__container">
          <h1>Messages</h1>
<%--          <div class="mainbox1">--%>
<%--            <table id="order1">--%>
<%--              --%>
<%--              <tbody>--%>
<%--                  <tr>--%>
<%--                      <td>User 1</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                      <td>User 2</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 3</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 4</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 5</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 6</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 7</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 8</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 9</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 10</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 11</td>--%>
<%--                  </tr>--%>
<%--                  <tr>--%>
<%--                    <td>User 12</td>--%>
<%--                  </tr>--%>
<%--              </tbody>--%>
<%--            </table>--%>
<%--            <div class="mainbox2"></div>--%>
<%--          </div>--%>
<%--          <div class="mainbox3"></div>--%>
          <div class="table-template">
              <div class="search-container">
                  <form action="viewChats" method="get">
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
                      <th>USER</th>
                      <th>LATEST MESSAGE</th>
                      <th>OPEN</th>
                  </tr>

                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>

                  </tr>
                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
                  </tr>
                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
                  </tr>
                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
                  </tr>
                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
                  </tr>
                  <tr class="table-rows">
                      <td>Harry Potter</td>
                      <td>What's the best price?</td>
                      <td><div class="view-more-button"><a href="messagesMore"><h2>OPEN</h2></a>
                  </tr>
              </table>
          </div>
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