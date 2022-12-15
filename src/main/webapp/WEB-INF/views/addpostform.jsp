<%--
  Created by IntelliJ IDEA.
  User: dale
  Date: 2022/12/02
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>등록하기</title>
</head>
<body>
<form action="addok" method="post">
    <table>
        <li>
            <label class="category" for="carType">차종</label>
            <select id="carType" name="carType">
                <option value="경차">경차</option>
                <option value="승용차" selected>승용차</option>
                <option value="승합차">승합차</option>
                <option value="화물트럭">화물트럭</option>
                <option value="특수목적차량">특수목적차량</option>
                <option value="오토바이">오토바이</option>
            </select>
        </li>
        <tr>
            <td>차량주인:</td>
            <td><input type="text" name="owner"/></td>
        </tr>
        <tr>
            <td>주차장 위치:</td>
            <td><input type="text" name="parkingSpot"/></td>
        </tr>
        <tr>
            <td>차 모델:</td>
            <td><input type="text" name="fileName"/></td>
        </tr>
        <tr>
            <td>차량번호: </td>
            <td><input type="text" name="carNumber"/></td>
        </tr>
        <tr>
            <input type="radio" id="short" name="period" value="short" checked="checked">
            <label for="short" >단기주차</label>
            <input type="radio" id="long" name="period" value="long">
            <label for="long">장기주차</label>
        </tr>
        <tr>
<%--            <td align="left"><input type='file' name="fileName"></td>--%>
        <tr>
            <td><a href="list">목록으로 돌아가기</a></td>
            <td align="right"><input type="submit" value="차량 등록"/></td>
        </tr>
    </table>
</form>

</body>
</html>
