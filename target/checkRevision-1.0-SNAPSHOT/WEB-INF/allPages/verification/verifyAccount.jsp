<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 20-Dec-21
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="unauthorized.css" />
</head>
<body>
<div class="box">

Your Email is not verified. Please Enter username and verification code.

<form action="verifyEmail" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="verCode">Verification Code:</label><br>
    <input type="text" id="verCode" name="verCode" ><br><br>
    <input type="submit" value="Verify">
</form>

To resend code.

<form action="resendVerCode" method="post">
    <label for="username1">Username:</label><br>
    <input type="text" id="username1" name="username1" style="margin: 10px;"><br>
    <input type="submit" value="Resend Code">
</form>
</div>
</body>
</html>
