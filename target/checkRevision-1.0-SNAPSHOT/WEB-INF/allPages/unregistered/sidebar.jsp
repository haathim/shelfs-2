<%--<div class="sidebar__title">--%>
<%--    <div class="sidebar__img">--%>
<%--        <img src="../allPages/styling/assets/logo.png" alt="logo" />--%>
<%--        <h1>SHELFS</h1>--%>
<%--    </div>--%>
<%--    <i--%>
<%--            onclick="closeSidebar()"--%>
<%--            class="fa fa-times"--%>
<%--            id="sidebarIcon"--%>
<%--            aria-hidden="true"--%>
<%--    ></i>--%>
<%--</div>--%>

<%--<div class="sidebar__menu">--%>
<%--    <div id="buy-and-sell-used"><h2>Buy and Sell used books.</h2></div>--%>
<%--    <div class="sidebar__link active_menu_link">--%>
<%--        <i class="fa fa-home"></i>--%>
<%--        <a href="#">MENU</a>--%>
<%--    </div>--%>

<%--    <div id="register-buyer">--%>
<%--        <h3>Start buying books.</h3>--%>
<%--        <a href="<%=MyVariables.rootURL%>public/buyerRegForm"><button><h2>Become a Buyer</h2></button></a>--%>

<%--    </div>--%>
<%--</div>--%>

<div class="sidebar__title">
    <div class="sidebar__img">
        <!-- <img src="assets/logo.png" alt="logo" /> -->
        <h1>SHELFS</h1>
        <p>Online Bookstore</p>
    </div>
    <i onclick="closeSidebar()" class="fa fa-times" id="sidebarIcon" aria-hidden="true"></i>
</div>

<div class="sidebar__menu">
    <div id="buy-and-sell-used">
        <h2>Buy and Sell used books.</h2>
    </div>
    <div id="create-account">
        <h4>Get your favourite books to the lowest price</h4>
        <input type="submit" value= "Join SHELFS" class="btn" onClick="window.location.href='buyerRegForm'">
    </div>
    <div class="block1">
        <div class="row">

            <h1>560+</h1>
            <h3>Sellers</h3>


        </div>
        <div class="row">

            <h1>2730+</h1>
            <h3>Books</h3>


        </div>
        <div class="row">

            <h1>5260+</h1>
            <h3>Customers</h3>


        </div>
        <!-- <footer>
          <div class="footer">&copy - SHELFS - 2021</div>></p>
      </footer> -->
    </div>

</div>