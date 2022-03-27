
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="../allPages/styling/layout.css" />
  <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
  <link rel="stylesheet" href="../allPages/styling/chatStyle.css" />

</head>
<body>
<%

  String username = (String) request.getAttribute("username");
%>
<div class="container">
  <div class="nav_icon" onclick="toggleSidebar()">
    <i class="fa fa-bars" aria-hidden="true"></i>
  </div>

  <div class="navbar__left">
    <%@include file="/WEB-INF/allPages/buyer/navbar-left/navbar-left.jsp"%>
  </div>

  <div class="navbar__right">
    <%@include file="/WEB-INF/allPages/buyer/navbar-right.jsp"%>
  </div>

  <main>
    <div class="main__container">
      <div class="wrapper">
        <section class="users">
          <header>
            <div class="content">
              <div class="details">
                <span>CHAT</span>
                <p>Select an user to start chat</p>
              </div>
            </div>

          </header>
<%--          <input id="searchBar" type="text" placeholder="Enter spiderman to search..."/>--%>
<%--          <button>Search</button>--%>
          <div class="search">
            <input type="text" placeholder="Enter name to search..." class="show"/>
<%--            <button class="active"><i class="fas fa-search"></i></button>--%>
          </div>
          <input id="meUser" type="hidden" name="username" value="<%=username%>">
          <div class="users-list">
          </div>
        </section>
      </div>
    </div>
  </main>

  <nav id="sidebar">
    <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
  </nav>
</div>

<script src="../allPages/javaScript/chat/users.js"></script>
<script src="../allPages/javaScript/sidebarResponsive.js"></script>

</body>
</html>

