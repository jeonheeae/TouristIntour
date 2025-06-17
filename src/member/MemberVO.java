package member;


public class MemberVO {
    private String email; // email 필드로 변경
    private String name;
    private String password; // pwd를 password로 변경
    private String phone; // 전화번호 추가
    private String gender; // 성별 추가

    public MemberVO() {
        System.out.println("MemberVO 기본 생성자");
    }

    public MemberVO(String email, String name, String password, String phone, String gender) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.gender = gender;

    }

    // Getter와 Setter 메소드
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
