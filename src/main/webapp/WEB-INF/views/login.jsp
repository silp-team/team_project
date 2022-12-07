<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/12/07
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<meta charset="UTF-8">
<body>
<div style='width:100%;text-align:center;padding-top:100px'>
    <img src='../img/chiwawa.jpg' height="250">
    <form method="post" action="loginOk">
        <div><label>User ID: </label> <input type='text' name='userid'/></div>
        <div><label>Password: </label> <input type='password' name='password'/></div>
        <button type='submit'>login</button>
    </form>
</div>
</body>
</html>
