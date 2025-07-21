<%@ page import="dao.UserDAO, dto.UserDTO, java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String action = request.getParameter("action");

if ("findNickname".equals(action)) {
    // 닉네임 찾기
    String email = request.getParameter("email_find");
    if (email != null && !email.trim().equals("")) {
        try (Connection conn = db.DBConn.getConnection()) {
            String sql = "SELECT nickname FROM users WHERE email = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
%>
<script>alert('가입된 닉네임은: <%= rs.getString("nickname") %> 입니다.');</script>
<%
                } else {
%>
<script>alert('해당 이메일로 가입된 닉네임이 없습니다.');</script>
<%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
%>
<script>alert('닉네임 찾기 중 오류 발생');</script>
<%
        }
    }
}

if ("findPassword".equals(action)) {
    // 비밀번호 찾기
    String nicknameFind = request.getParameter("nickname_find");
    String emailFindPw = request.getParameter("email_find_pw");
    if (nicknameFind != null && emailFindPw != null
            && !nicknameFind.trim().equals("") && !emailFindPw.trim().equals("")) {
        try (Connection conn = db.DBConn.getConnection()) {
            String sql = "SELECT password FROM users WHERE nickname = ? AND email = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, nicknameFind);
                pstmt.setString(2, emailFindPw);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
%>
<script>alert('가입된 비밀번호는: <%= rs.getString("password") %> 입니다.');</script>
<%
                } else {
%>
<script>alert('해당 정보로 가입된 계정이 없습니다.');</script>
<%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
%>
<script>alert('비밀번호 찾기 중 오류 발생');</script>
<%
        }
    }
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<style>
  body { font-family: Arial, sans-serif; background: #f9f9f9; }
  h2 { margin-top: 40px; }
  form {
    background: #fff;
    padding: 20px;
    margin: 20px auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 400px;
  }
  label { display: block; margin-bottom: 6px; font-weight: bold; }
  input[type="text"], input[type="email"] {
    width: 100%; padding: 8px; margin-bottom: 12px;
    border: 1px solid #ccc; border-radius: 4px;
  }
  button {
    background: #4CAF50; color: white; border: none;
    padding: 10px 15px; border-radius: 4px; cursor: pointer;
  }
  button:hover { background: #45a049; }
</style>
</head>
<body>

<h2>닉네임 찾기</h2>
<form method="post" action="findAccount.jsp">
  <input type="hidden" name="action" value="findNickname">
  <label for="email_find">가입 이메일</label>
  <input type="email" id="email_find" name="email_find" required>
  <button type="submit">닉네임 찾기</button>
</form>

<h2>비밀번호 찾기</h2>
<form method="post" action="findAccount.jsp">
  <input type="hidden" name="action" value="findPassword">
  <label for="nickname_find">닉네임</label>
  <input type="text" id="nickname_find" name="nickname_find" required>

  <label for="email_find_pw">가입 이메일</label>
  <input type="email" id="email_find_pw" name="email_find_pw" required>

  <button type="submit">비밀번호 찾기</button>
</form>

</body>
</html>
