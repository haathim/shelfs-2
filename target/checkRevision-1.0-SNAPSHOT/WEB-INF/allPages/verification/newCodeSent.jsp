<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 21-Dec-21
  Time: 8:56 AM
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
<%
    String username = (String) request.getAttribute("username");
    String email = (String) request.getAttribute("email");
%>

<p>Your new verification code has been sent to <%=email%> for account with username <%=username%></p>
<a href="verifyAccount">Verify Account</a>
</div>
</body>
</html>
