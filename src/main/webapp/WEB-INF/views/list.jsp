<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/12/02
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>주차 관리 시스템</title>
</head>
<style>
    #list {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    #list td, #list th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align:center;
    }
    #list tr:nth-child(even){background-color: #f2f2f2;}
    #list tr:nth-child(odd){background-color: #f2f2f2;}
    #list tr:hover {background-color: #ddd;}
    #list th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #006bb3;
        color: white;
    }
    .button1 {width: 100px;
        height: 50px;}
    .button {
        background-color: #2689e0;
        border-radius: 10px;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
    body{background: linear-gradient(lightCyan, skyBlue, deepSkyBlue); height: 100vw}

</style>
<script>
    function delete_ok(id){
        var a = confirm("정말로 삭제하겠습니까?");
        if(a) location.href='deleteok/' + id;
    }
</script>
<body>

<div style="float: right">
    <button type="logout" class="button button1" onclick="location.href='../login/logout'"> Logout </button>
</div>
<h1>주차장 관리 현황</h1>
<table id="list" width="90%">
    <tr>
        <th>주차 순번</th>
        <th>차량 모델</th>
        <th>차종</th>
        <th>주차장 위치</th>
        <th>차량 주인</th>
        <th>입차 날짜</th>
        <th>요금(시간당 1천원)</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>

    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.seq}</td>
<%--            <td><img src="./palisade.png" width="300"> </td>--%>
<%--            <td><img src="${pageContext.request.contextPath }/upload/${u.getFileName()}" class="photo" width="100px"></td>--%>
            <td>${u.fileName}</td>
            <td>${u.carType}</td>
            <td>${u.parkingSpot}</td>
            <td>${u.owner}</td>
            <td>${u.regDate}</td>
            <td>${u.fee}</td>
            <td><a href="editform/${u.getSeq()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<div style="float: right">
    <button type="button" class="button button1" onclick="location.href='add'"> add </button>
</div>

</body>
</html>
