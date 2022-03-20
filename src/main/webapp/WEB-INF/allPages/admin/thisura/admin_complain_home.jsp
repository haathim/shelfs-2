<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Complaint" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />

  <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="../allPages/admin/thisura/admin_manage_users_styles.css" />
  <script src="layoutjs.js"></script>
  <title>SHELFS - Online Bookstore</title>
</head>
<body id="body">
<%
  ArrayList<Complaint> complaints = (ArrayList<Complaint>) request.getAttribute("complaints");
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
          <h1>Complaints</h1>
          <div class="mainbox1">
            <table id="order1">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Username</th>
                  <th>Title</th>
                  <th>View Complaint</th>
                </tr>
              </thead>
              <tbody>
              <% for (Complaint complaint: complaints){%>
                <tr>
                  <td><%=complaint.getBuyerName()%></td>
                  <td><%=complaint.getBuyerId()%></td>
                  <td><%=complaint.getTitle()%></td>
                  <td><div class="inline"><a href="viewComplaintsMore?complaintId=<%=complaint.getComplaintId()%>"><button style="margin:5px;">View</button></a></div></td>
                </tr>
                <%}%>
              </tbody>
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