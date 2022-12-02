<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/12/02
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>야호</title>
</head>
<body>
<h1>주차장 관리 현황</h1>
<table id="list" width="90%">
    <tr>
        <th>주차 순번</th>
        <th>차량 사진</th>
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
            <td><img src="${pageContext.request.contextPath }/upload/${u.getFileName()}" class="photo" width="100px"></td>
            <td>${u.carType}</td>
            <td>${u.parking}</td>
            <td>${u.owner}</td>
            <td>${u.regDate}</td>
            <td>${u.fee}</td>
            <td><a href="editform/${u.getSeq()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="add">Add New Post</a>

</body>
</html>
