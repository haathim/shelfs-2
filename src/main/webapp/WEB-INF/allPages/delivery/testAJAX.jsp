<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 17-Mar-22
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <button onclick="doSomething()">Click Me</button>

<script>
    function doSomething(){
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "newDeliveryUpdatePickup", true);
        xhr.onload = ()=>{
            if(xhr.readyState === XMLHttpRequest.DONE){
                console.log("Done...")
            }
        }
        let body = 'pickupId=' + encodeURIComponent("28") +
            '&status=' + encodeURIComponent("1");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
        xhr.send(body);
    }
</script>
</body>
</html>
