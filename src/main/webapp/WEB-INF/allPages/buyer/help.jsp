<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.Complaint" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 21-Sep-21
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../allPages/styling/layout.css" />
    <link rel="stylesheet" href="../allPages/buyer/buyer-common.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />


    <title>SHELFS.</title>
</head>
<body>

<%
    ArrayList<Complaint> buyersComplaintReplies = (ArrayList<Complaint>) request.getAttribute("buyersComplaintReplies");
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

            <div class="formContainer">
                <h1>Hello There!</h1>
                <p>How can we help you?</p>
                <div id="error" style="color: red; font-weight: bold;padding: 10px"></div>
                <form id="complaintForm" method="post" action="help">
                    <div class="column">
                        <label for="complaintTitle">Title</label>
                        <input
                                id="complaintTitle"
                                type="text"
                                name="complaintTitle"
                                required
                        />
                    </div>
                    <div class="column">
                        <label for="complaintDescription">Send us your questions. we'll reach to you as soon as we can</label>
                        <textarea
                                type="text"
                                id="complaintDescription"
                                name="complaintDescription"
                                placeholder="Type your questions here"
                                rows="7"
                                required
                        ></textarea>

                    </div>
<%--                    <button type="submit">Submit</button>--%>
                    <input type="submit" value="Submit Complaint">
                </form>

            </div>


            <% if(!buyersComplaintReplies.isEmpty()){%>
            <h1>Replies to Complaints</h1>
            <%}%>
            <% for (Complaint complaint: buyersComplaintReplies){%>
            <div class="formContainer">
                <h4 style="color: #343434">Complaint ID: <%=complaint.getComplaintId()%></h4>
                <h2>Complaint Title: <%=complaint.getTitle()%></h2>
                <h3>Complaint Description:</h3>
                <br><br>
                <p><%=complaint.getDescription()%></p>
                <h3 style="color: #4c46f5">Reply from Admin:</h3>
                <p style="color: #4c46f5"><%=complaint.getReply()%></p>
            </div>

            <%}%>


        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - help.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    <script src="../allPages/javaScript/inputValidation/buyer/complaintsValidation.js"></script>

</div>
</body>
</html>

