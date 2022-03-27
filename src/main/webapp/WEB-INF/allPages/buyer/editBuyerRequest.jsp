<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.checkRevision.model.Wishlist" %>
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="com.example.checkRevision.variables.MyVariables" %>
<%@ page import="com.example.checkRevision.model.BuyerRequest" %>
<%@ page import="com.example.checkRevision.model.Buyer" %><%--
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
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/unregistered/register-buyer.css" />



    <title>SHELFS.</title>
</head>
<body>
<%
    BuyerRequest  buyerRequestDetails = (BuyerRequest)request.getAttribute("buyerRequestDetails");
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

            <div class="reuquest-book">
                <div class="formContainer">
                    <h1>Edit Book Request</h1>
                    <p>Fill the below form to Edit Request for a Book.</p>
                    <div id="instructions" style="color: blue; font-weight: bold">
                        <p>

                        </p>
                        <p></p>
<%--                        <p>--%>
<%--                            Description: Use only letters, digits, period, commas, question-mark,--%>
<%--                            ampersand and exclamation mark. Length 1 - 500.--%>
<%--                        </p>--%>
                    </div>
                    <div id="error" style="color: red; font-weight: bold"></div>
                    <form action="editBuyerRequest" method="post" id="form">
                        <div class="row">
                            <input type="hidden" name="buyerRequestId" value="<%=buyerRequestDetails.getRequestId()%>">
                            <div class="column">
                                <label for="title">Title</label>
                                <input
                                        id="title"
                                        type="text"
                                        name="title"
                                        value="<%=buyerRequestDetails.getTitle()%>"
                                        placeholder="Title: Use only letters, digits, period commas, question-mark, ampersand and exclamation mark. Length 1 - 50."
                                        required
                                />
                            </div>
                            <div class="column">
                                <label for="author">Author</label>
                                <input
                                        id="author"
                                        type="text"
                                        name="author"
                                        value="<%=buyerRequestDetails.getAuthor()%>"
                                        required
                                />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="category">Category</label><br>
                                <select
                                        type="text"
                                        id="category"
                                        name="category"
                                        value=""
                                        required
                                ></select>
                            </div>

                            <div class="column">
                                <label for="preferredPrice">Preferred Price</label>
                                <input
                                        type="number"
                                        id="preferredPrice"
                                        name="preferredPrice"
                                        value="<%=buyerRequestDetails.getPreferredPrice()%>"
                                />
                            </div>

                        </div>

                        <div class="row">
                            <div class="column">
                                <label for="comment">Comment</label>
                                <textarea
                                        id="comment"
                                        placeholder="Put a description about you request.."
                                        rows="3"
                                        name="comment"
                                        value="<%=buyerRequestDetails.getComment()%>"
                                ></textarea>
                            </div>
                        </div>

                        <input type="submit" value="Edit" class="sub-btn">
                    </form>
                    <form action="deleteBuyerRequest" method="post">
                        <input type="hidden" name="buyerRequestId" value="<%=buyerRequestDetails.getRequestId()%>">
                        <input type="submit" value="Remove" class="sub-btn">
                    </form>
                </div>
            </div>

        </div>

    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/buyer/sidebar/sidebar - request books.jsp"%>
    </nav>



</div>
<script src="../allPages/javaScript/sidebarResponsive.js"></script>
<script src="../allPages/javaScript/inputValidation/buyer/requestBooksForm.js"></script>
</body>
</html>


