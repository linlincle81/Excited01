<%@ page import="java.sql.*, db.DBConn" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String nickname = (String)session.getAttribute("nickname");
String inputPassword = request.getParameter("password");
String deleteConfirm = request.getParameter("deleteConfirm");

// 폼이 제출된 경우
if (inputPassword != null) {
    if (deleteConfirm == null) {
%>
<script>
    alert("안내문을 체크해주세요.");
    location.href = "withdraw.jsp";
</script>
<%
    } else if (nickname == null) {
%>
<script>
    alert("로그인이 필요합니다.");
    location.href = "login.jsp";
</script>
<%
    } else {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConn.getConnection();
            String checkSql = "SELECT * FROM users WHERE nickname=? AND password=?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, nickname);
            pstmt.setString(2, inputPassword);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                pstmt.close();
                String deleteSql = "DELETE FROM users WHERE nickname=?";
                pstmt = conn.prepareStatement(deleteSql);
                pstmt.setString(1, nickname);
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    session.invalidate();
%>
<script>
    alert("회원 탈퇴가 완료되었습니다.");
    location.href = "main.jsp";
</script>
<%
                } else {
%>
<script>
    alert("회원 탈퇴 중 오류가 발생했습니다.");
    location.href = "withdraw.jsp";
</script>
<%
                }
            } else {
%>
<script>
    alert("비밀번호가 일치하지 않습니다.");
    location.href = "withdraw.jsp";
</script>
<%
            }
        } catch(Exception e) {
            e.printStackTrace();
%>
<script>
    alert("서버 오류가 발생했습니다. 콘솔을 확인해주세요.");
    location.href = "withdraw.jsp";
</script>
<%
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
    return;
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원탈퇴</title>
  <!-- 외부 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Jockey+One&display=swap" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'PFStardustExtraBold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/PFStardustExtraBold.woff2') format('woff2');
      font-weight: 800;
      font-style: normal;
    }

    .delete_Page_background {
      background: linear-gradient(black 30%, yellow);
      height: 100vh;
      position: relative;
    }

    .delete_background_head {
      position: absolute;
      top: 1%;
      left: 1%;
      font-family: "Jockey One";
      font-size: 32px;
      color: white;
    }

    .delete_background_head a {
      text-decoration: none;
      color: white;
    }

    .delete_background_light {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      height: 100vh;
    }

    .delete_form {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 50%;
      padding: 1.5rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      background: linear-gradient(#FFF95B 10%, white);
      border-radius: 8px;
      height: 80vh;
      display: flex;
      flex-direction: column;
      padding: 0 5%;
      font-family: 'PFStardustExtraBold';
      font-size: 20px;
    }

    .delete_form h1 {
      position: relative;
      text-align: center;
      margin-bottom: 5%;
      font-family: 'Jockey One';
      font-size: 48px;
      top: -5%;
    }

    .delete_back_arrow {
      width: 10%;
      height: auto;
      position: relative;
      top: 4%;
      left: -8%;
    }

    .delete_form p {
      margin-top: 15%;
    }

    .delete_form input[type="password"] {
      margin-top: 3%;
      margin-bottom: 5%;
      height: 5%;
    }

    .delete_btn {
      display: flex;
      justify-content: center;
      margin-top: 30%;
    }

    .delete_btn button {
      width: 25%;
      border-radius: 17px;
      height: 5vh;
      background: linear-gradient(#8FFFEC, white);
      font-family: 'PFStardustExtraBold';
    }
  </style>
</head>
<body>
  <div class="delete_Page_background">
    <!-- 상단 로고 -->
    <div class="delete_background_head">
      <a href="main.jsp">Excited</a>
    </div>

    <!-- 가운데 이미지 -->
    <div class="delete_background_light">
      <img src="${pageContext.request.contextPath}/assets/images/lightning.png" alt="번개 이미지" />
    </div>

    <!-- 탈퇴 폼 -->
    <form class="delete_form" method="post">
      <a href="lobby.jsp">
        <img class="delete_back_arrow" src="${pageContext.request.contextPath}/assets/images/BackArrow.png" alt="뒤로가기 화살표" />
      </a>
      <h1>회원탈퇴</h1>
      <p>비밀번호 확인</p>
      <input type="password" name="password" placeholder="비밀번호 입력" required />
      <div>
        <input type="checkbox" id="deleteConfirm" name="deleteConfirm" value="yes" required />
        <label for="deleteConfirm">탈퇴 시 데이터가 영구적으로 삭제됩니다.</label>
      </div>
      <div class="delete_btn">
        <button type="submit">탈퇴하기</button>
      </div>
    </form>
  </div>
</body>
</html>
