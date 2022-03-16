<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="buyer_styles.css" />
  <link rel="stylesheet" href="../allPages/admin/thisura/admin_overview_styles.css" />
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
      <div class="main-container">
          <h1>Overview</h1>
          <div class="mainbox1">
            <table id="order1">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Order Name</th>
                  <th>Order Details</th>
                  <th>Seller ID</th>
                  <th>Seller Name</th>
                  <th>Buyer ID</th>
                  <th>Buyer Name</th>
                  <th>Order Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>0001</td>
                  <td>The Shining</td>
                  <td>Don't know</td>
                  <td>1542</td>
                  <td>Shawn Rodrigo</td>
                  <td>2134</td>
                  <td>Asitha Muthumala</td>
                  <td>Completed</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="mainbox2">
            <table id="order2">
              <thead>
                <tr>
                  <th>Analytical details</th>
                </tr>
              </thead>
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