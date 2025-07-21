<%@ page import="java.sql.*, db.DBConn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 세션에서 현재 닉네임을 가져온다고 가정
    String oldNickname = (String)session.getAttribute("nickname");
    String newNickname = request.getParameter("newNickname");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");
    String realName = request.getParameter("realName");

    if(newNickname != null && newPassword != null && confirmPassword != null && realName != null) {
        if(!newPassword.equals(confirmPassword)) {
%>
<script>
    alert("비밀번호가 일치하지 않습니다.");
    history.back();
</script>
<%
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                conn = DBConn.getConnection();
                String sql = "UPDATE users SET nickname=?, password=?, name=? WHERE nickname=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newNickname);
                pstmt.setString(2, newPassword);
                pstmt.setString(3, realName);
                pstmt.setString(4, oldNickname);

                int rows = pstmt.executeUpdate();
                if(rows > 0) {
                    session.setAttribute("loginUserNickname", newNickname);
%>
<script>
    alert("프로필 수정 성공!");
    location.href="main.jsp";
</script>
<%
                } else {
%>
<script>
    alert("프로필 수정 실패! DB를 확인해보세요.");
    history.back();
</script>
<%
                }
            } catch(Exception e) {
                e.printStackTrace();
%>
<script>
    alert("에러 발생! 콘솔을 확인하세요.");
    history.back();
</script>
<%
            } finally {
                try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
                try { if(conn != null) conn.close(); } catch(Exception e) {}
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>프로필 수정</title>
  <!-- 구글 폰트 -->
  <link 
    href="https://fonts.googleapis.com/css2?family=Jockey+One&display=swap" 
    rel="stylesheet"
  />
  <style>
    @font-face {
      font-family: 'PFStardustExtraBold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/PFStardustExtraBold.woff2') format('woff2');
      font-weight: 800;
      font-style: normal;
    }

    .EditProfile_background {
      background: linear-gradient(black 30%, yellow);
      height: 100vh;
      position: relative;
      font-family: 'Jockey One', sans-serif;
    }

    .background_head {
      position: absolute;
      top: 1%;
      left: 1%;
      font-size: 32px;
      color: white;
    }

    .background_head a {
      text-decoration: none;
      color: inherit;
    }

    .background_light {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      height: 100vh;
    }

    .EditProfile_form {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 40%;
      height: 80vh;
      background: linear-gradient(#FFF95B, white);
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      padding: 1.5rem 5%;
      display: flex;
      flex-direction: column;
      font-family: 'PFStardustExtraBold', sans-serif;
      font-size: 20px;
    }

    .back_arrow {
      width: 10%;
      height: auto;
      display: block;
      margin-bottom: 1rem;
      cursor: pointer;
    }

    .EditProfile_form h1 {
      text-align: center;
      font-size: 48px;
      margin: 0 0 2rem;
    }

    .EditProfile_form p {
      margin: 0.5rem 0 0.2rem;
    }

    .EditProfile_form input {
      width: 100%;
      margin-bottom: 1.5rem;
      padding: 0.5rem;
      box-sizing: border-box;
      font-family: inherit;
      font-size: 1rem;
      border-radius: 4px;
      border: 1px solid #ccc;
    }

    .link_p {
      margin-top: auto;
      text-align: right;
    }
    .link_p a {
      text-decoration: none;
      color: #00CC77;
    }

    .save_btn {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 2rem;
    }
    .save_btn button {
      width: 30%;
      height: 5vh;
      border-radius: 15px;
      background: linear-gradient(#8FFFEC, white);
      border: none;
      font-family: 'PFStardustExtraBold', sans-serif;
      font-size: 1rem;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="EditProfile_background">
    <!-- 상단 헤더 -->
    <div class="background_head">
      <a href="main.jsp">Excited</a>
    </div>

    <!-- 중앙 번개 이미지 -->
    <div class="background_light">
      <img 
        src="${pageContext.request.contextPath}/assets/images/lightning.png" 
        alt="번개 이미지"
      />
    </div>

    <!-- 프로필 수정 폼 -->
    <div class="EditProfile_form">
      <a href="${pageContext.request.contextPath}/lobby.jsp">
    <img class="back_arrow" src="${pageContext.request.contextPath}/assets/images/BackArrow.png" alt="뒤로가기 화살표"/>
</a>

      <h1>프로필 수정</h1>
      <form method="post">
        <p>새 닉네임</p>
        <input 
          type="text" 
          name="newNickname" 
          placeholder="ex) 태그맨" 
          required
        />

        <p>새 비밀번호</p>
        <input 
          type="password" 
          name="newPassword" 
          required
        />

        <p>비밀번호 확인</p>
        <input 
          type="password" 
          name="confirmPassword" 
          required
        />

        <p>이름</p>
        <input 
          type="text" 
          name="realName" 
          required
        />

        <p class="link_p">
          <a href="${pageContext.request.contextPath}/tmi">TMI 설정하기 →</a>
        </p>

        <div class="save_btn">
          <button type="submit">저장</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
