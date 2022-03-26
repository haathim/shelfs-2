<link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
<link rel="stylesheet" href="../allPages/styling/layout.css" />
<div class="sidebar__title">
  <div class="sidebar__img">
    <%-- <img src="../allPages/styling/assets/logo.png" alt="logo" />--%>
    <h1>SHELFS</h1>
    <p>Online Bookstore</p>
  </div>
  <i
    onclick="closeSidebar()"
    class="fa fa-times"
    id="sidebarIcon"
    aria-hidden="true"
  ></i>
</div>

<div class="sidebar__menu">
  <div id="buy-and-sell-used">
    <h2>Buy and Sell used books.</h2>
  </div>
  <div class="sidebar__link active_menu_link">
    <i class="fa fa-home"></i>
    <a href="#">DASHBOARD</a>
  </div>

  <h2>BUYER</h2>
  <div class="sidebar__link" id="test-back">
    <i class="fa fa-building-o"></i>
    <a href="#">My Shelf</a>
  </div>
  <div class="sidebar__link" id="test-back">
    <i class="fa fa-building-o"></i>
    <a href="favourites">My Favourites</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-wrench"></i>
    <a href="requestBooks">Request Books</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-archive"></i>
    <a href="viewOrders">My Orders</a>
  </div>

  <div id="become-seller">
    <% if(request.getSession().getAttribute("userType") == "buyer"){%>
    <h3>Start selling your books.</h3>
    <a href="sellerApplication"><h2>Become a Seller</h2></a>
    <%}else if (request.getSession().getAttribute("userType") == "seller"){%>
    <a href="../seller/home"><h2>SWITCH TO SELLER PORTAL</h2></a>
    <%}%>
  </div>

  <h2>ACCOUNT</h2>
  <div class="sidebar__link">
    <i class="fa fa-wrench"></i>
    <a href="help">Settings</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-question"></i>
    <a href="settings">Help</a>
  </div>
  <div class="sidebar__link">
    <i class="fa fa-power-off"></i>
    <a href="../logout" onclick="removeLocalStorage()">Logout</a>
  </div>
  </div>
  <script>
    function removeLocalStorage(){
      localStorage.removeItem("cartitem");
    }
  </script>
