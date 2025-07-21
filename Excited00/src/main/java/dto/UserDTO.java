package dto;

public class UserDTO {
    private String nickname;
    private String email;      // ✅ 추가
    private String password;
    private String name;       // ✅ 추가
    private String gender;
    private String birthdate;

    public UserDTO() {}

    // 생성자에도 email, name 추가
    public UserDTO(String nickname, String email, String password, String name, String gender, String birthdate) {
        this.nickname = nickname;
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.birthdate = birthdate;
    }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getEmail() { return email; }           // ✅ 추가
    public void setEmail(String email) { this.email = email; } // ✅ 추가

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }            // ✅ 추가
    public void setName(String name) { this.name = name; } // ✅ 추가

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getBirthdate() { return birthdate; }
    public void setBirthdate(String birthdate) { this.birthdate = birthdate; }
}
