<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/12/02
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정</title>
</head>
<body>

<form:form commandName="boardVO" method="POST" action="../editok">
  <form:hidden path="seq"/>
  <table id="edit">
    <tr><td>차종</td><td></td><form:input path="carType"></form:input></tr>
    <tr><td>차량 주인</td><td></td><form:input path="owner"></form:input></tr>
    <tr><td>주차장 위치</td><td></td><form:input path="parkingSpot"></form:input></tr>
  </table>
  <input type="submit" value="수정하기"/>
  <input type="button" value="취소하기" onclick="history.back()"/>
</form:form>
</body>
</html>
