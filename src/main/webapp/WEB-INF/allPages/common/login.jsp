
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous" />
    <link rel="stylesheet" href="allPages/styling/layout.css"/>
    <link rel="stylesheet" href="allPages/styling/login_css.css" />
    <title>SHELFS - Online Bookstore</title>
</head>
<body id="body">
<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">

        <%@include file="/WEB-INF/allPages/unregistered/navbar-left/navbar-left - SignIn.jsp"%>




    </div>

<%--    <div class="navbar__right">--%>
<%--        <a href="#">--%>
<%--            <i class="fa fa-search"></i>--%>
<%--        </a>--%>
<%--        <a href="#">--%>
<%--            <i class="fa fa-shopping-cart"></i>--%>
<%--        </a>--%>
<%--        <a href="#">--%>
<%--            <i class="fa fa-comments-o"></i>--%>
<%--        </a>--%>

<%--    </div>--%>

    <main>
        <div class="auth-box">
            <div id="top-login" class="toplogintext">
                <h1>Login to SHELFS</h1>
            </div>
            <div id="top-signup" class="topsignuptext">
                <h1>Create an Account</h1>
            </div>
            <form id="login" action="login" class="input-group" method="post">
                <input id = "uname" name ="uname" type="text" class="input-field" placeholder="Username"  required>
                <input id = "pass" name = "pass" type="password" class="input-field" placeholder="Password" required>
                <button type="submit" class="submit-btn">Log in</button>
                <p > <a href="forgotPasswordForm"><span style="color:white">Forgot password?</span></a></p>
            </form>
            <form id="signup" class="input-group">
                <input type="email" class="input-field" placeholder="Email" required>
                <input type="password" class="input-field" placeholder="Password" required>
                <input type="password" class="input-field" placeholder="Retype Password" required>
                <button type="submit" class="submit-btn">Sign in</button>
            </form>
            <div id="signuptext" class="signup-text">
                <p>Don't have an account?</p>

            </div>
            <div id="logintext" class="login-text">
                <p>Already have an account?</p>
            </div>

            <button id="signupbtn" type="button" class="signup-btn" onClick="window.location.href='public/buyerRegForm'">Sign Up</button>
            <button id="loginbtn" type="button" class="login-btn" onclick="login()">Log In</button>
        </div>

    </main>

    <nav id="sidebar">
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
                <input type="submit" value= "Join SHELFS" class="btn" onClick="window.location.href='public/buyerRegForm'">
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
    </nav>
</div>
<script>
    var x = document.getElementById("login");
    var y = document.getElementById("signup");
    var k = document.getElementById("signuptext");
    var l = document.getElementById("logintext");
    var m = document.getElementById("signupbtn");
    var n = document.getElementById("loginbtn");
    var p = document.getElementById("top-login");
    var q = document.getElementById("top-signup");
    function signup(){
        x.style.left = "-750px";
        y.style.left = "-800px";
        k.style.left = "-750px";
        l.style.left = "250px";
        m.style.left = "-750px";
        n.style.left = "350px";
        p.style.left = "-750px";
        q.style.left = "20px";
    }

    function login(){
        x.style.left = "50px";
        y.style.left = "450px";
        k.style.left = "250px";
        l.style.left = "900px";
        m.style.left = "430px";
        n.style.left = "900px";
        p.style.left = "10px";
        q.style.left = "-300px";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="../allPages/javaScript/script.js"></script>
</body>
This is new lofin

<form action="login" method="post">
    <label for="uname">Username</label>
    <input
            id="uname"
            type="text"
            name="uname"
            required
    />
    <br /><br />

    <label for="pass">Password:</label>
    <input
            id="pass"
            type="text"
            name="pass"
            required
    />
    <br /><br />
    <input type="submit" value="Submit" />
</form>
</body>
</body>
</html>
