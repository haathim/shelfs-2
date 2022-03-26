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
    <link rel="stylesheet" href="../allPages/styling/chatStyle.css" />

    <script src="layoutjs.js"></script>
    <title>SHELFS - Online Bookstore</title>
</head>
<body id="body">
<%
    String otherUser = (String) request.getAttribute("otherUser");
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
            <div class="wrapper">
                <section class="chat-area">
                    <header>
                        <a href="chatUsersPage" class="back-icon"
                        >Back</a>
                        <div class="details">
                            <span style="font-weight: bold">@<%=otherUser%></span>
                            <p></p>
                        </div>
                    </header>
                    <div class="chat-box"></div>
                    <form id="chatSendForm" action="#" class="typing-area">
                        <input
                                type="text"
                                class="incoming_id"
                                name="otherUser"
                                value="<%=otherUser%>"
                                hidden
                        />
                        <input
                                type="text"
                                name="message"
                                class="input-field"
                                placeholder="Type a message here..."
                                autocomplete="off"
                        />
                        <button>Send</button>
                    </form>
                </section>
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
<script src="../allPages/javaScript/chat/chat.js"></script>

</body>

</html>
