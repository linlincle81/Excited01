<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Lobby</title>
<style>
  body {
    margin: 0;
    padding: 0;
    background: black;
    color: white;
    font-family: Arial, sans-serif;
  }
  .lobby-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: yellow;
    padding: 10px 20px;
  }
  .lobby-header a {
    text-decoration: none;
    color: black;
    font-weight: bold;
    font-size: 20px;
  }
  .menu-icon {
    font-size: 28px;
    cursor: pointer;
  }
  .menu-panel {
    display: none;
    position: absolute;
    top: 60px;
    right: 10px;
    background: white;
    color: black;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
  }
  .menu-panel a {
    display: block;
    padding: 8px;
    text-decoration: none;
    color: black;
  }
  .menu-panel a:hover {
    background: #eee;
  }
</style>
<script>
  function toggleMenu() {
    const panel = document.getElementById('menuPanel');
    panel.style.display = panel.style.display === 'block' ? 'none' : 'block';
  }
</script>
</head>
<body>
  <div class="lobby-header">
    <!-- 메인으로 돌아가기 -->
    <a href="main.jsp">⬅ 메인으로</a>
    <div class="menu-icon" onclick="toggleMenu()">
      <img src="${pageContext.request.contextPath}/assets/images/threeLine.png" 
           alt="메뉴" 
           style="width:40px; height:40px; cursor:pointer;">
    </div>
    <div id="menuPanel" class="menu-panel">
      <a href="editProfile.jsp">프로필 수정</a>
      <a href="withdraw.jsp">회원 탈퇴</a>
      <a href="logout.jsp">로그아웃</a>
    </div>
  </div>

  <h1 style="text-align:center; margin-top:50px;">Party Room Lobby</h1>
  <p style="text-align:center;">여기서 원하는 파티를 선택하세요.</p>
</body>
</html>
