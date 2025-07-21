<%@ page import="dao.UserDAO, dto.UserDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String nickname = request.getParameter("nickname");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirm_password");
String email = request.getParameter("email");      // ✅ 추가
String name = request.getParameter("name");        // ✅ 추가
String gender = request.getParameter("gender");
String birthdate = request.getParameter("birthdate");

if (nickname != null && password != null && confirmPassword != null) {
    if (!password.equals(confirmPassword)) {
%>
<script>
alert("비밀번호가 일치하지 않습니다.");
history.back();
</script>
<%
    } else {
        // ✅ UserDTO 생성 시 email, name까지 넣기
        UserDTO user = new UserDTO(nickname, email, password, name, gender, birthdate);
        UserDAO dao = new UserDAO();
        boolean result = dao.insertUser(user);
        if (result) {
%>
<script>
alert("회원가입 성공!");
location.href="login.jsp";
</script>
<%
        } else {
%>
<script>
alert("회원가입 실패: DB 문제일 수 있음");
history.back();
</script>
<%
        }
    }
    return;
}
%>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Jockey+One&display=swap');
    @font-face {
      font-family: 'PFStardustExtraBold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2506-1@1.0/PFStardustExtraBold.woff2') format('woff2');
      font-weight: 800;
      font-style: normal;
    }

    body.register_background {
      background: linear-gradient(black 30%, yellow);
      height: 100vh;
      margin: 0;
      padding: 0;
      position: relative;
    }

    /* ✅ Excited 버튼 스타일 (editProfile.jsp와 동일) */
    .background_head {
      position: absolute;
      top: 1%;
      left: 1%;
      font-family: "Jockey One", sans-serif;
      font-size: 32px;
    }
    .background_head a {
  text-decoration: none; /* 밑줄 제거 */
  color: white;          /* 흰색 */
  font-weight: normal;   /* ★ editProfile과 통일 (굵기 동일) */
}
.background_head a:hover {
  text-decoration: none;
  color: white;
}


    .background_light {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      height: 100vh;
    }

    .register_form {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 40%;
      padding: 1.5rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      background: linear-gradient(#FFF95B, white);
      border-radius: 8px;
      height: 80vh;
      display: flex;
      flex-direction: column;
    }

    .register_form p {
      display: flex;
      justify-content: center;
      margin-bottom: 5%;
      font-size: 64px;
      font-family: 'Jockey One', sans-serif;
    }

    .register_form_table {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    .form-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .form-row label {
      flex: 1;
      margin-right: 1rem;
      font-family: 'PFStardustExtraBold';
      font-size: 24px;
    }

    .form-row input,
    .form-row select {
      flex: 2;
      padding: 0.5rem;
      box-sizing: border-box;
      font-family: 'PFStardustExtraBold';
    }

    .register_button {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 50%;
      height: 8vh;
      margin: 10% auto 0;
      border-radius: 10px;
      border: 1px solid black;
      background: linear-gradient(#8FFFEC, white);
      font-family: 'Jockey One', sans-serif;
      font-size: 36px;
      cursor: pointer;
    }
  </style>
</head>
<body class="register_background">

  <!-- ✅ Excited 버튼 -->
  <div class="background_head">
    <a href="main.jsp">Excited</a>
  </div>

  <!-- ✅ 번개 이미지 -->
  <div class="background_light">
    <img src="assets/images/lightning.png" alt="번개 이미지" />
  </div>

  <!-- ✅ 회원가입 폼 -->
  <div class="register_form">
    <p>SIGN UP</p>
    <form class="register_form_table" action="join.jsp" method="post">
      <div class="form-row">
        <label for="nickname">닉네임</label>
        <input id="nickname" name="nickname" type="text" required />
      </div>

      <div class="form-row">
        <label for="password">비밀번호</label>
        <input id="password" name="password" type="password" required />
      </div>

      <div class="form-row">
        <label for="passwordConfirm">비밀번호 확인</label>
        <input id="passwordConfirm" name="confirm_password" type="password" required />
      </div>

	<div class="form-row">
    	<label for="email">이메일</label>
   		 <input id="email" name="email" type="email" required />
  	</div>

      <div class="form-row">
        <label for="name">이름</label>
        <input id="name" name="name" type="text" required />
      </div>

      <div class="form-row">
        <label for="gender">성별</label>
        <select id="gender" name="gender" required>
          <option value="">선택</option>
          <option value="M">남</option>
          <option value="F">여</option>
        </select>
      </div>

      <div class="form-row">
        <label for="birth">생년월일</label>
        <input id="birth" name="birthdate" type="date" required />
      </div>

      <button class="register_button" type="submit">Join</button>
    </form>
  </div>

</body>
</html>
