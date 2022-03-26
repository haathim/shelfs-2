
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
    String otherUser = (String) request.getAttribute("otherUser");
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
                    <section class="chat-area">
                        <header>
                            <a href="chatUsersPage" class="back-icon"
                            >Back
                            </a>
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
            <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar.jsp"%>
        </nav>
    </div>

<script src="../allPages/javaScript/chat/chat.js"></script>
<script src="../allPages/javaScript/sidebarResponsive.js"></script>

</body>
</html>
