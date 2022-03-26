
<%@ page import="com.example.checkRevision.model.Advertisement" %>
<%@ page import="java.util.ArrayList" %><%-- Created by IntelliJ IDEA. User: Lenovo Date: 21-Sep-21 Time: 12:13 PM To
change this template use File | Settings | File Templates. --%> <%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="../allPages/buyer/home.css" />
    <link rel="stylesheet" href="../allPages/buyer/sidebar.css" />
    <link rel="stylesheet" href="../allPages/unregistered/register-buyer.css" />


    <title>SHELFS.</title>
</head>
<body id="body">


<div class="container">
    <div class="nav_icon" onclick="toggleSidebar()">
        <i class="fa fa-bars" aria-hidden="true"></i>
    </div>

    <div class="navbar__left">
        <%@include file="/WEB-INF/allPages/seller/navbar-left.jsp"%>
    </div>

    <div class="navbar__right">
        <%@include file="/WEB-INF/allPages/seller/navbar-right.jsp"%>
    </div>

    <main>
        <div class="main__container">

            <div class="post-book">
                <div class="formContainer">
                    <h1>POST A BOOK</h1>
                    <p>Fill the below form to post book.</p>
                    <div id="instructions" style="color: blue; font-weight: bold">

                    </div>
                    <div id="error" style="color: red; font-weight: bold"></div>
                    <form action="postAd" method="post" enctype="multipart/form-data" id="form">
                        <div class="row">
                            <div class="column">
                                <label for="title">Title</label>
                                <input
                                        type="text"
                                        id="title"
                                        name="title"
                                        placeholder="Title: Use only letters, digits, period, commas, question-mark, ampersand and exclamation mark. Length 1 - 50."
                                        required
                                />
                            </div>
                            <div class="column">
                                <label for="author">Author</label>
                                <input
                                        type="text"
                                        id="author"
                                        name="author"
                                        placeholder="Author: Use only letters, digits and period. Length 3 - 20."
                                        required
                                />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="isbn">ISBN</label>
                                <input type="text" id="isbn" name="isbn" placeholder="ISBN: Valid 13 digit ISBN number." required />
                            </div>
                        </div>
                        <div class="row">

                            <div class="column">
                                <label for="category">Category</label><br>
                                <select
                                        type="text"
                                        id="category"
                                        name="category"
                                        required
                                ></select>
                            </div>
                            <div class="column">
                                <label for="language">Language</label><br>
                                <select
                                        type="text"
                                        id="language"
                                        name="language"
                                        required
                                ></select>
                            </div>
                        </div>
                        <div class="row">

                            <div class="column">
                                <label for="price">Price</label>
                                <input type="number" id="price" name="price" placeholder="Price here" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="description">Description</label>
                                <textarea
                                        id="description"
                                        placeholder="Describe your book in detail here"
                                        rows="3"
                                        name="description"
                                        required
                                ></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <label for="frontPhoto">Front Image</label>
                                <input type="file" id="frontPhoto" placeholder="Images: Max size 2MB. Allowed types JPG and PNG." name="frontPhoto" multiple accept=".jpg, .png" required/>
                            </div>
                            <div class="column">
                                <label for="backPhoto">Back Image</label>
                                <input type="file" id="backPhoto" placeholder="Images: Max size 2MB. Allowed types JPG and PNG." name="backPhoto" multiple accept=".jpg, .png" required/>
                            </div>
                        </div>
                        <input type="submit" id="submit-button" value="Post"/>

                    </form>
                </div>
            </div>

        </div>



    </main>

    <nav id="sidebar">
        <%@include file="/WEB-INF/allPages/seller/sidebar.jsp"%>
    </nav>
    <script src="../allPages/javaScript/sidebarResponsive.js"></script>
    <script src="../allPages/javaScript/inputValidation/seller/postBookForm.js"></script>

</div>
</body>
</html>


