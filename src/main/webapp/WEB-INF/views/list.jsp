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

    <!-- Tinkerbell mouse effect -->
    <script type="text/javascript">
        // <![CDATA[
        var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
        var sparkles=50;

        /****************************
         *  Tinkerbell Magic Sparkle *
         *(c)2005-13 mf2fm web-design*
         *  http://www.mf2fm.com/rv  *
         * DON'T EDIT BELOW THIS BOX *
         ****************************/
        var x=ox=400;
        var y=oy=300;
        var swide=800;
        var shigh=600;
        var sleft=sdown=0;
        var tiny=new Array();
        var star=new Array();
        var starv=new Array();
        var starx=new Array();
        var stary=new Array();
        var tinyx=new Array();
        var tinyy=new Array();
        var tinyv=new Array();

        window.onload=function() { if (document.getElementById) {
            var i, rats, rlef, rdow;
            for (var i=0; i<sparkles; i++) {
                var rats=createDiv(3, 3);
                rats.style.visibility="hidden";
                rats.style.zIndex="999";
                document.body.appendChild(tiny[i]=rats);
                starv[i]=0;
                tinyv[i]=0;
                var rats=createDiv(5, 5);
                rats.style.backgroundColor="transparent";
                rats.style.visibility="hidden";
                rats.style.zIndex="999";
                var rlef=createDiv(1, 5);
                var rdow=createDiv(5, 1);
                rats.appendChild(rlef);
                rats.appendChild(rdow);
                rlef.style.top="2px";
                rlef.style.left="0px";
                rdow.style.top="0px";
                rdow.style.left="2px";
                document.body.appendChild(star[i]=rats);
            }
            set_width();
            sparkle();
        }}

        function sparkle() {
            var c;
            if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
                ox=x;
                oy=y;
                for (c=0; c<sparkles; c++) if (!starv[c]) {
                    star[c].style.left=(starx[c]=x)+"px";
                    star[c].style.top=(stary[c]=y+1)+"px";
                    star[c].style.clip="rect(0px, 5px, 5px, 0px)";
                    star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
                    star[c].style.visibility="visible";
                    starv[c]=50;
                    break;
                }
            }
            for (c=0; c<sparkles; c++) {
                if (starv[c]) update_star(c);
                if (tinyv[c]) update_tiny(c);
            }
            setTimeout("sparkle()", 40);
        }

        function update_star(i) {
            if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
            if (starv[i]) {
                stary[i]+=1+Math.random()*3;
                starx[i]+=(i%5-2)/5;
                if (stary[i]<shigh+sdown) {
                    star[i].style.top=stary[i]+"px";
                    star[i].style.left=starx[i]+"px";
                }
                else {
                    star[i].style.visibility="hidden";
                    starv[i]=0;
                    return;
                }
            }
            else {
                tinyv[i]=50;
                tiny[i].style.top=(tinyy[i]=stary[i])+"px";
                tiny[i].style.left=(tinyx[i]=starx[i])+"px";
                tiny[i].style.width="2px";
                tiny[i].style.height="2px";
                tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
                star[i].style.visibility="hidden";
                tiny[i].style.visibility="visible"
            }
        }

        function update_tiny(i) {
            if (--tinyv[i]==25) {
                tiny[i].style.width="1px";
                tiny[i].style.height="1px";
            }
            if (tinyv[i]) {
                tinyy[i]+=1+Math.random()*3;
                tinyx[i]+=(i%5-2)/5;
                if (tinyy[i]<shigh+sdown) {
                    tiny[i].style.top=tinyy[i]+"px";
                    tiny[i].style.left=tinyx[i]+"px";
                }
                else {
                    tiny[i].style.visibility="hidden";
                    tinyv[i]=0;
                    return;
                }
            }
            else tiny[i].style.visibility="hidden";
        }

        document.onmousemove=mouse;
        function mouse(e) {
            if (e) {
                y=e.pageY;
                x=e.pageX;
            }
            else {
                set_scroll();
                y=event.y+sdown;
                x=event.x+sleft;
            }
        }

        window.onscroll=set_scroll;
        function set_scroll() {
            if (typeof(self.pageYOffset)=='number') {
                sdown=self.pageYOffset;
                sleft=self.pageXOffset;
            }
            else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
                sdown=document.body.scrollTop;
                sleft=document.body.scrollLeft;
            }
            else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
                sleft=document.documentElement.scrollLeft;
                sdown=document.documentElement.scrollTop;
            }
            else {
                sdown=0;
                sleft=0;
            }
        }

        window.onresize=set_width;
        function set_width() {
            var sw_min=999999;
            var sh_min=999999;
            if (document.documentElement && document.documentElement.clientWidth) {
                if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
                if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
            }
            if (typeof(self.innerWidth)=='number' && self.innerWidth) {
                if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
                if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
            }
            if (document.body.clientWidth) {
                if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
                if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
            }
            if (sw_min==999999 || sh_min==999999) {
                sw_min=800;
                sh_min=600;
            }
            swide=sw_min;
            shigh=sh_min;
        }

        function createDiv(height, width) {
            var div=document.createElement("div");
            div.style.position="absolute";
            div.style.height=height+"px";
            div.style.width=width+"px";
            div.style.overflow="hidden";
            return (div);
        }

        function newColour() {
            var c=new Array();
            c[0]=255;
            c[1]=Math.floor(Math.random()*256);
            c[2]=Math.floor(Math.random()*(256-c[1]/2));
            c.sort(function(){return (0.5 - Math.random());});
            return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
        }
        // ]]>
    </script>

</head>
<style>
    h1, h2{
        padding: 8px;
        background-color: #2689e0;
        border-radius: 10px;
        border-width: 5px;
        border-style: double;
        color: black;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        padding: 15px 32px;
        font-size: 30px;
        margin-top: 0px;
    }

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


    #playlist {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    #playlist td, #playlist th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align:center;
    }
    #playlist tr:nth-child(even){background-color: #f2f2f2;}
    #playlist tr:nth-child(odd){background-color: #f2f2f2;}
    #playlist tr:hover {background-color: #ddd;}
    #playlist th {
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
        cursor: pointer;
        margin: 0px;
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


<h1 style="color:black">주차장 관리 현황</h1>
<div style="float: right">
    <button type="logout" class="button button1" onclick="location.href='../login/logout'"> Logout </button>
</div>
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

<h2 style="color: black">주차장 CCTV 현황</h2>

<table id="playlist">
    <tr>
        <th>1번 CCTV</th>
        <th>2번 CCTV</th>
        <th>3번 CCTV</th>
    </tr>
<tr>
    <td><iframe width="320" height="240" src="https://www.youtube.com/embed/hlJLxOmamFA?autoplay=1&mute=1&amp;playlist=hlJLxOmamFA&loop=1;" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
    <td><iframe width="320" height="240" src="https://www.youtube.com/embed/EFwxv-KJJPM?autoplay=1&mute=1&amp;playlist=EFwxv-KJJPM&loop=1;" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
    <td><iframe width="320" height="240" src="https://www.youtube.com/embed/_NzjfwGtAQg?autoplay=1&mute=1&amp;playlist=_NzjfwGtAQg&loop=1;" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
</tr>
</table>
</body>
</html>
