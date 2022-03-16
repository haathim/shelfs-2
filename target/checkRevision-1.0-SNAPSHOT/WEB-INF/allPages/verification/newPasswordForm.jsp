<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 10-Jan-22
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="newPassword" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="username">Enter New Password:</label><br>
    <input type="text" id="password1" name="password1"><br>
    <label for="username">Re-enter New Password:</label><br>
    <input type="text" id="password2" name="password2"><br>
    <label for="username">OTP Code:</label><br>
    <input type="text" id="otpCode" name="otpCode"><br>
    <input type="submit" value="Submit">
</form>


</body>
</html>
