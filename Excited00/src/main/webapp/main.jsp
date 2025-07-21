<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 세션에서 로그인 닉네임 가져오기
    String loginNickname = (String)session.getAttribute("nickname");
    boolean loggedIn = (loginNickname != null);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- 구글 폰트 로드 -->
    <link href="https://fonts.googleapis.com/css2?family=Jockey+One&display=swap" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'PFStardustExtraBold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/PFStardustExtraBold.woff2') format('woff2');
            font-weight: 800;
            font-style: normal;
        }
        body {
            margin: 0;
            padding: 0;
        }
        .home_containor {
            background-color: black;
            min-height: 100vh;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .home_header {
            display: flex;
            justify-content: space-between;
        }
        .head_left {
            width: 50%;
            background-color: black;
        }
        .head_right {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 50%;
            height: 8vh;
            padding-right: 2%;
            background: linear-gradient(to left, yellow, black);
            font-family: "Jockey One", sans-serif;
            font-size: 26px;
            text-shadow: -1px 0px white, 0px 1px white, 1px 0px white, 0px -1px white;
        }
        .people_containor {
            position: relative;
            display: flex;
            justify-content: center;
            margin-top: 2%;
        }
        .people {
            width: 30%;
            height: 50vh;
            position: absolute;
            top: 2%;
            z-index: 1;
        }
        .body_comment {
            position: relative;
            z-index: 3;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 8%;
            color: white;
            font-family: "Jockey One", sans-serif;
        }
        .home_body {
            height: 85vh;
        }
        .home_name {
            position: relative;
            z-index: 0;
            margin-top: 2%;
            font-size: 170px;
            text-shadow: -2px 0px yellow, 0px 2px yellow, 2px 0px yellow, 0px -2px yellow;
        }
        .home_name::before {
            content: attr(data-content);
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            -webkit-text-stroke: 4px yellow;
        }
        .home_sub_name {
            margin-top: 2%;
            font-size: 25px;
            color: white;
            font-family: "Jockey One", sans-serif;
        }
        .home_menu {
            display: flex;
            justify-content: space-around;
            margin-top: 3%;
            font-family: "Jockey One", sans-serif;
        }
        .menu_card {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 17%;
            height: 35vh;
            background: linear-gradient(yellow, white);
            border-radius: 15px;
            font-size: 32px;
            z-index: 3;
            font-family: 'PFStardustExtraBold';
            color: black;
            cursor: pointer;
        }
        .menu_card p {
            margin-top: 15%;
        }
    </style>
</head>
<body>
    <div class="home_containor">
        <div class="home_header">
            <div class="head_left"></div>
            <div class="head_right">
                <%-- 로그인 상태에 따라 다르게 동작 --%>
                <% if (loggedIn) { %>
                    <a href="#" onclick="alert('로그인 상태입니다.'); return false;">LOGIN</a>
                <% } else { %>
                    <a href="login.jsp">LOGIN</a>
                <% } %>
            </div>
        </div>

        <div class="people_containor">
            <p class="home_sub_name">Do with Anonymous</p>
            <img class="people" src="${pageContext.request.contextPath}/assets/images/people.png" alt="번개 이미지"/>
        </div>

        <div class="home_body">
            <div class="body_comment">
                <p class="home_name" data-content="Excited">Excited</p>
            </div>
            <div class="home_menu">
                <div class="menu_card"
                     onclick="<%= loggedIn ? "location.href='lobby.jsp?category=food'" : "alert('로그인이 필요합니다.'); location.href='login.jsp';" %>">
                    <img src="${pageContext.request.contextPath}/assets/images/food.png" alt="밥 친구"/>
                    <p>밥친구</p>
                </div>
                <div class="menu_card"
                     onclick="<%= loggedIn ? "location.href='lobby.jsp?category=sports'" : "alert('로그인이 필요합니다.'); location.href='login.jsp';" %>">
                    <img src="${pageContext.request.contextPath}/assets/images/sports.png" alt="운동 친구"/>
                    <p>운동친구</p>
                </div>
                <div class="menu_card"
                     onclick="<%= loggedIn ? "location.href='lobby.jsp?category=song'" : "alert('로그인이 필요합니다.'); location.href='login.jsp';" %>">
                    <img src="${pageContext.request.contextPath}/assets/images/song.png" alt="코노 친구"/>
                    <p>코노친구</p>
                </div>
                <div class="menu_card"
                     onclick="<%= loggedIn ? "location.href='lobby.jsp?category=game'" : "alert('로그인이 필요합니다.'); location.href='login.jsp';" %>">
                    <img src="${pageContext.request.contextPath}/assets/images/game.png" alt="게임 친구"/>
                    <p>게임친구</p>
                </div>
                <div class="menu_card"
                     onclick="<%= loggedIn ? "location.href='lobby.jsp?category=all'" : "alert('로그인이 필요합니다.'); location.href='login.jsp';" %>">
                    <img src="${pageContext.request.contextPath}/assets/images/light.png" alt="전체"/>
                    <p>전체</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
