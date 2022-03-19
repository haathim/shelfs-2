<div class="sidebar__title">
  <div class="sidebar__img">
    <img src="../allPages/styling/assets/logo.png" alt="logo" />
    <h1>SHELFS</h1>
  </div>
  <i
    onclick="closeSidebar()"
    class="fa fa-times"
    id="sidebarIcon"
    aria-hidden="true"
  ></i>
</div>

<div class="sidebar__menu">
  <div id="buy-and-sell-used"><h2>SELLER PORTAL</h2></div>
  <div class="sidebar__link active_menu_link">
    <i class="fa fa-home"></i>
    <a href="#">MENU</a>
  </div>

  <%--
  <h2>BUYER</h2>
  --%> <%--
  <div class="sidebar__link" id="test-back">
    --%> <%-- <i class="fa fa-building-o"></i>--%> <%--
    <a href="favourites">My Favourites</a>--%> <%--
  </div>
  --%> <%--
  <div class="sidebar__link">
    --%> <%-- <i class="fa fa-wrench"></i>--%> <%--
    <a href="requestBooks">Requests Books</a>--%> <%--
  </div>
  --%> <%--
  <div class="sidebar__link">
    --%> <%-- <i class="fa fa-archive"></i>--%> <%--
    <a href="viewOrders">My Orders</a>--%> <%--
  </div>
  --%>

  <h2>SELLER</h2>
  <div class="sidebar__link">
    <i class="fa fa-question"></i>
    <a href="postAd">Post a Book</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-sign-out"></i>
    <a href="salesHistory">Sales History</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-calendar-check-o"></i>
    <a href="viewBuyerRequests">Buyer Requests</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-files-o"></i>
    <a href="viewPostedAds">Posted Books</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-files-o"></i>
    <a href="newSales">New Sales</a>
  </div>

  <div id="become-seller">
    <a href="../buyer/home"><h2>SWITCH TO BUYER PORTAL</h2></a>
  </div>

  <h2>ACCOUNT</h2>
<%--  <div class="sidebar__link">--%>
<%--    <i class="fa fa-handshake-o"></i>--%>
<%--    <a href="messages">Messages</a>--%>
<%--  </div>--%>

  <div class="sidebar__link">
    <i class="fa fa-briefcase"></i>
    <a href="settings">Settings</a>
  </div>
  <div class="sidebar__logout">
    <i class="fa fa-power-off"></i>
    <a href="../logout">Logout</a>
  </div>
</div>
